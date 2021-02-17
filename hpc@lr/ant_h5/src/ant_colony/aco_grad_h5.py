# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent,"
@license: "MIT"
@version: "3.2"
@email: "owuordickson@gmail.com"
@created: "05 February 2021"

Breath-First Search for gradual patterns (ACO-GRAANK)

"""
import os
import h5py
import numpy as np
from itertools import combinations
from common.gp import GI, GP
from common.dataset import Dataset


class GradACO:

    def __init__(self, f_path, min_supp, segs):
        self.d_set = Dataset(f_path, segs, min_supp)
        self.attr_index = self.d_set.attr_cols
        self.e_factor = 0.5  # evaporation factor
        self.iteration_count = 0
        self.d, self.attr_keys = self.generate_d()  # distance matrix (d) & attributes corresponding to d

    def generate_d(self):
        # 1a. Retrieve/Generate distance matrix (d)
        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        d = self.d_set.read_h5_dataset(grp_name)
        if d.size > 0:
            # 1b. Fetch valid bins group
            grp_name = 'dataset/' + self.d_set.step_name + '/valid_bins/'
            h5f = h5py.File(self.d_set.h5_file, 'r')
            attr_keys = list(h5f[grp_name].keys())
            h5f.close()
            return d, attr_keys

        # 1b. Fetch valid bins group
        grp_name = 'dataset/' + self.d_set.step_name + '/valid_bins/'
        h5f = h5py.File(self.d_set.h5_file, 'r')
        grp = h5f[grp_name]
        attr_keys = list(grp.keys())

        # 2. Initialize an empty d-matrix
        n = len(grp)
        d = np.zeros((n, n), dtype=float)  # cumulative sum of all segments
        for k in range(self.d_set.seg_count):
            # 2. For each segment do a binary AND
            for i in range(n):
                for j in range(n):
                    bin_1 = grp[attr_keys[i]]
                    bin_2 = grp[attr_keys[j]]
                    if GI.parse_gi(attr_keys[i]).attribute_col == GI.parse_gi(attr_keys[j]).attribute_col:
                        # Ignore similar attributes (+ or/and -)
                        continue
                    else:
                        # Cumulative sum of all segments for 2x2 (all attributes) gradual items
                        d[i][j] += np.sum(np.multiply(bin_1['bins'][str(k)][:], bin_2['bins'][str(k)][:]))

        # 3. Save d_matrix in HDF5 file
        h5f.close()
        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        self.d_set.add_h5_dataset(grp_name, d)
        return d, attr_keys

    def run_ant_colony(self):
        min_supp = self.d_set.thd_supp
        d = self.d
        a = self.d_set.attr_size
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
        # print(pheromones)
        # print("***\n")
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
        v_matrix = self.d
        idx = [self.attr_keys.index(x.as_string()) for x in pattern.gradual_items]
        combs = list(combinations(idx, 2))
        for i, j in combs:
            if v_matrix[i][j] > 0:
                p_matrix[i][j] += 1
            if v_matrix[j][i] > 0:
                p_matrix[j][i] += 1
        return p_matrix

    def validate_gp(self, pattern):
        # pattern = [('2', '+'), ('4', '+')]
        gen_pattern = GP()

        h5f = h5py.File(self.d_set.h5_file, 'r')
        grp_name = 'dataset/' + self.d_set.step_name + '/valid_bins/'
        bin_keys = [gi.as_string() for gi in pattern.gradual_items]
        bin_grps = [h5f[grp_name + k] for k in bin_keys]

        if len(bin_grps) >= 2:
            h5_path = 'temp.h5'
            h5f_1 = h5py.File(h5_path, 'w')
            h5f.copy((grp_name + bin_keys[0]), h5f_1)
            main_grp = h5f_1[h5f_1.name][bin_keys[0]]['bins']
            # print(main_grp['bins']['0'][:])
            gen_pattern = self.bin_and(bin_keys, bin_grps, main_grp)
            h5f_1.close()

        h5f.close()
        if len(gen_pattern.gradual_items) <= 1:
            return pattern
        else:
            return gen_pattern

    def bin_and(self, keys, grps, m_grp):
        n = self.d_set.attr_size
        min_supp = self.d_set.thd_supp
        pattern = GP()

        gi = GI.parse_gi(keys[0])
        pattern.add_gradual_item(gi)
        # bin_1 = grps[0]['bins']
        # main_bin = [bin_1[str(x)][:] for x in range(self.d_set.seg_count)]
        for i in range(len(keys)):
            if i == 0:
                continue
            bin_2 = grps[i]['bins']
            # temp_bin = [np.multiply(temp_bin[k], bin_2[str(k)][:]) for k in range(self.d_set.seg_count)]
            # temp_bin = []
            bin_sum = 0
            for k in range(self.d_set.seg_count):
                m_grp[str(k)][...] = np.multiply(m_grp[str(k)][:], bin_2[str(k)][:])
                bin_sum += np.sum(m_grp[str(k)][:])
                # temp_bin.append(arr)
            supp = float(bin_sum) / float(n * (n - 1.0) / 2.0)
            if supp >= min_supp:
                # main_bin = temp_bin
                gi = GI.parse_gi(keys[i])
                pattern.add_gradual_item(gi)
                pattern.set_support(supp)
        # print(str(pattern.to_string()) + ' : ' + str(pattern.support))
        # h5f_1.close()
        return pattern

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
