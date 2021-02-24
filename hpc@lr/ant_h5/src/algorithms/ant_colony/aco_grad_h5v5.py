# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent,"
@license: "MIT"
@version: "5.5"
@email: "owuordickson@gmail.com"
@created: "22 Feb 2021"
@modified: "22 Feb 2021"

Breath-First Search for gradual patterns (ACO-GRAANK)

"""
import h5py
import numpy as np
from algorithms.common.gp_v4 import GI, GP
from algorithms.common.dataset_h5v5 import Dataset


class GradACO:

    def __init__(self, f_path, min_supp):
        self.d_set = Dataset(f_path, min_supp)
        self.attr_index = self.d_set.attr_cols
        self.e_factor = 0.5  # evaporation factor
        self.iteration_count = 0
        self.d, self.attr_keys = self.generate_d()  # distance matrix (d) & attributes corresponding to d

    def generate_d(self):
        # 1a. Retrieve/Generate distance matrix (d)
        grp_name = 'dataset/' + self.d_set.step_name + '/valid_items'
        attr_keys = [x.decode() for x in self.d_set.read_h5_dataset(grp_name)]

        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        d = self.d_set.read_h5_dataset(grp_name)
        if d.size > 0:
            # 1b. Fetch valid bins group
            return d, attr_keys

        # 1b. Fetch valid bins group
        h5f = h5py.File(self.d_set.h5_file, 'r')
        grp_name = 'dataset/' + self.d_set.step_name + '/rank_matrix'
        ranks = h5f[grp_name][:]  # [:] TO BE REMOVED

        # 2. Initialize an empty d-matrix
        n = len(attr_keys)
        d = np.zeros((n, n), dtype=float)  # cumulative sum of all segments
        for i in range(n):
            for j in range(n):
                gi_1 = GI.parse_gi(attr_keys[i])
                gi_2 = GI.parse_gi(attr_keys[j])
                if gi_1.attribute_col == gi_2.attribute_col:
                    # Ignore similar attributes (+ or/and -)
                    continue
                else:
                    # for s in ranks.iter_chunks():
                    bin_1 = ranks[:, gi_1.attribute_col].copy()
                    bin_2 = ranks[:, gi_2.attribute_col].copy()

                    # 2b. Reconstruct if negative (swap 0.5 and 1, leave 0 as 0)
                    if gi_1.is_decrement():
                        bin_1 = np.where(bin_1 == 0.5, 1, np.where(bin_1 == 1, 0.5, 0))

                    if gi_2.is_decrement():
                        bin_2 = np.where(bin_2 == 0.5, 1, np.where(bin_2 == 1, 0.5, 0))

                    # Cumulative sum of all segments for 2x2 (all attributes) gradual items
                    temp_bin = np.where(bin_1 == bin_2, 1, 0)
                    d[i][j] += np.sum(temp_bin)
        # print(d)
        h5f.close()
        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        self.d_set.add_h5_dataset(grp_name, d, compress=True)
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
        # combs = list(combinations(idx, 2))
        for n in range(len(idx)):
            for m in range(n+1, len(idx)):
                i = idx[n]
                j = idx[m]
                p_matrix[i][j] += 1
                p_matrix[j][i] += 1
        return p_matrix

    def validate_gp(self, pattern):
        min_supp = self.d_set.thd_supp
        n = self.d_set.attr_size
        gen_pattern = GP()

        h5f = h5py.File(self.d_set.h5_file, 'r')
        grp_name = 'dataset/' + self.d_set.step_name + '/rank_matrix'
        ranks = h5f[grp_name][:]  # [:] TO BE REMOVED

        main_bin = ranks[:, pattern.gradual_items[0].attribute_col]
        for i in range(len(pattern.gradual_items)):
            gi = pattern.gradual_items[i]
            if i == 0:
                if gi.is_decrement():
                    main_bin = np.where(main_bin == 0.5, 1, np.where(main_bin == 1, 0.5, 0))
                gen_pattern.add_gradual_item(gi)
                continue
            else:
                bin_2 = ranks[:, gi.attribute_col].copy()
                if gi.is_decrement():
                    bin_2 = np.where(bin_2 == 0.5, 1, np.where(bin_2 == 1, 0.5, 0))

                # Rank multiplication
                temp_bin = np.where(main_bin == bin_2, main_bin, 0)
                # print(str(main_bin) + ' + ' + str(bin_2) + ' = ' + str(temp_bin))
                supp = float(np.count_nonzero(temp_bin)) / float(n * (n - 1.0) / 2.0)
                if supp >= min_supp:
                    main_bin = temp_bin.copy()
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
