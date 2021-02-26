# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Thomas Runkler, Edmond Menya, and Anne Laurent,"
@license: "MIT"
@version: "6.0"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "17 Feb 2021"

Breath-First Search for gradual patterns (ACO-GRAANK)

"""
import gc
import h5py
import numpy as np
from algorithms.common.gp_v4 import GI, GP
from algorithms.common.dataset_v7 import Dataset


class GradACO:

    def __init__(self, f_path, chunks, min_supp):
        self.d_set = Dataset(f_path, chunks, min_supp)
        self.e_factor = 0.5  # evaporation factor
        self.iteration_count = 0
        self.d, self.attr_keys = self.generate_d()  # distance matrix (d) & attributes corresponding to d
        # print(self.d)

    def generate_d(self):
        # 1a. Fetch valid attribute keys
        h5f = h5py.File(self.d_set.h5_file, 'r+')
        bin_grp = h5f['dataset/rank_bins/']
        attr_keys = list(bin_grp.keys())

        # 1b. Retrieve/Generate distance matrix (d)
        grp = 'dataset/d_matrix/'
        if grp in h5f:
            # 1b. Fetch valid bins group
            d = h5f[grp][:]
            h5f.close()
            return d, attr_keys

        # 2. Initialize an empty d-matrix
        n = len(attr_keys)
        d = np.zeros((n, n), dtype=np.dtype('i8'))  # cumulative sum of all segments
        for i in range(n):
            for j in range(n):
                gi_1 = GI.parse_gi(attr_keys[i])
                gi_2 = GI.parse_gi(attr_keys[j])
                if gi_1.attribute_col == gi_2.attribute_col:
                    # 2a. Ignore similar attributes (+ or/and -)
                    continue
                else:
                    bin_1 = bin_grp[gi_1.as_string()]  # v_bins[i][1]
                    bin_2 = bin_grp[gi_2.as_string()]  # v_bins[j][1]
                    # Cumulative sum of all segments for 2x2 (all attributes) gradual items
                    # 2b. calculate sum from bin ranks (in chunks)
                    bin_sum = 0
                    for k in list(bin_1.keys()):
                        bin_sum += np.sum(np.multiply(bin_1[k][:], bin_2[k][:]))
                    d[i][j] += bin_sum

        h5f.create_dataset('dataset/d_matrix', data=d, chunks=True, compression="gzip", compression_opts=9, shuffle=True)
        h5f.close()
        return d, attr_keys

    def run_ant_colony(self):
        min_supp = self.d_set.thd_supp
        d = self.d
        a = self.d_set.row_count
        winner_gps = list()  # subsets
        loser_gps = list()  # supersets
        repeated = 0
        it_count = 0

        if self.d_set.no_bins:
            return []

        # 1. Remove d[i][j] < frequency-count of min_supp
        fr_count = ((min_supp * a * (a - 1)) / 2)
        d[d < fr_count] = 0

        # 2. Calculating the visibility of the next city
        # visibility(i,j)=1/d(i,j)
        # In the case GP mining visibility = d
        # with np.errstate(divide='ignore'):
        #    visibility = 1/d
        #    visibility[visibility == np.inf] = 0

        # 3. Initialize pheromones (p_matrix)
        pheromones = np.ones(d.shape, dtype=float)
        # print(pheromones)
        # print("***\n")

        # 4. Iterations for ACO
        # while repeated < 1:
        while it_count < 10:
            rand_gp, pheromones = self.generate_aco_gp(pheromones)
            if len(rand_gp.gradual_items) > 1:
                # print(rand_gp.get_pattern())
                exits = GradACO.is_duplicate(rand_gp, winner_gps, loser_gps)
                if not exits:
                    repeated = 0
                    # check for anti-monotony
                    is_super = GradACO.check_anti_monotony(loser_gps, rand_gp, subset=False)
                    is_sub = GradACO.check_anti_monotony(winner_gps, rand_gp, subset=True)
                    if is_super or is_sub:
                        continue
                    gen_gp = self.validate_gp(rand_gp)
                    is_present = GradACO.is_duplicate(gen_gp, winner_gps, loser_gps)
                    is_sub = GradACO.check_anti_monotony(winner_gps, gen_gp, subset=True)
                    if is_present or is_sub:
                        repeated += 1
                    else:
                        if gen_gp.support >= min_supp:
                            pheromones = self.update_pheromones(gen_gp, pheromones)
                            winner_gps.append(gen_gp)
                        else:
                            loser_gps.append(gen_gp)
                    if set(gen_gp.get_pattern()) != set(rand_gp.get_pattern()):
                        loser_gps.append(rand_gp)
                else:
                    repeated += 1
            it_count += 1
        self.iteration_count = it_count
        return winner_gps

    def generate_aco_gp(self, p_matrix):
        attr_keys = self.attr_keys
        v_matrix = self.d
        pattern = GP()

        # 1. Generate gradual items with highest pheromone and visibility
        m = p_matrix.shape[0]
        for i in range(m):
            combine_feature = np.multiply(v_matrix[i], p_matrix[i])
            total = np.sum(combine_feature)
            with np.errstate(divide='ignore', invalid='ignore'):
                probability = combine_feature / total
            cum_prob = np.cumsum(probability)
            r = np.random.random_sample()
            try:
                j = np.nonzero(cum_prob > r)[0][0]
                gi = GI.parse_gi(attr_keys[j])
                if not pattern.contains_attr(gi):
                    pattern.add_gradual_item(gi)
            except IndexError:
                continue

        # 2. Evaporate pheromones by factor e
        p_matrix = (1 - self.e_factor) * p_matrix
        return pattern, p_matrix

    def update_pheromones(self, pattern, p_matrix):
        idx = [self.attr_keys.index(x.as_string()) for x in pattern.gradual_items]
        for n in range(len(idx)):
            for m in range(n + 1, len(idx)):
                i = idx[n]
                j = idx[m]
                p_matrix[i][j] += 1
                p_matrix[j][i] += 1
        return p_matrix

    def validate_gp(self, pattern):
        # pattern = [('2', '+'), ('4', '+')]
        min_supp = self.d_set.thd_supp
        n = self.d_set.row_count
        gen_pattern = GP()
        bin_1 = None

        h5f = h5py.File(self.d_set.h5_file, 'r+')
        bin_grp = h5f['dataset/rank_bins/']

        for gi in pattern.gradual_items:
            if bin_1 is None:
                bin_1 = bin_grp[gi.as_string()]
                gen_pattern.add_gradual_item(gi)
            else:
                bin_2 = bin_grp[gi.as_string()]
                bin_sum = 0
                # tmp_bin = []
                for k in list(bin_2.keys()):
                    bin_prod = np.multiply(bin_1[k][:], bin_2[k][:])
                    bin_sum += np.sum(bin_prod)
                    # tmp_bin.append(bin_prod)
                    grp = 'dataset/rank_bins/tmp/' + '/' + str(k)
                    if grp in h5f:
                        del h5f[grp]
                    h5f.create_dataset(grp, data=bin_prod)

                supp = float(bin_sum) / float(n * (n - 1.0) / 2.0)
                if supp >= min_supp:
                    # bin_1 = tmp_bin.copy()
                    bin_1 = h5f['dataset/rank_bins/tmp/']
                    gen_pattern.add_gradual_item(gi)
                    gen_pattern.set_support(supp)

        h5f.close()
        if len(gen_pattern.gradual_items) <= 1:
            return pattern
        else:
            return gen_pattern

    @staticmethod
    def check_anti_monotony(lst_p, pattern, subset=True):
        result = False
        if subset:
            for pat in lst_p:
                result1 = set(pattern.get_pattern()).issubset(set(pat.get_pattern()))
                result2 = set(pattern.inv_pattern()).issubset(set(pat.get_pattern()))
                if result1 or result2:
                    result = True
                    break
        else:
            for pat in lst_p:
                result1 = set(pattern.get_pattern()).issuperset(set(pat.get_pattern()))
                result2 = set(pattern.inv_pattern()).issuperset(set(pat.get_pattern()))
                if result1 or result2:
                    result = True
                    break
        return result

    @staticmethod
    def is_duplicate(pattern, lst_winners, lst_losers):
        for pat in lst_losers:
            if set(pattern.get_pattern()) == set(pat.get_pattern()) or \
                    set(pattern.inv_pattern()) == set(pat.get_pattern()):
                return True
        for pat in lst_winners:
            if set(pattern.get_pattern()) == set(pat.get_pattern()) or \
                    set(pattern.inv_pattern()) == set(pat.get_pattern()):
                return True
        return False
