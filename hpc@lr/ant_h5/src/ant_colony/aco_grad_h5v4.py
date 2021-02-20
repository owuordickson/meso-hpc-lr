# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Thomas Runkler, Edmond Menya, and Anne Laurent,"
@license: "MIT"
@version: "5.4"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "17 Feb 2021"

Breath-First Search for gradual patterns (ACO-GRAANK)

"""
import os
import h5py
import numpy as np
from itertools import combinations
from common.gp_v4 import GI, GP
from common.dataset_h5v4 import Dataset


class GradACO:

    def __init__(self, f_path, min_supp):
        self.d_set = Dataset(f_path, min_supp)
        self.d_set.init_gp_attributes()
        self.attr_index = self.d_set.attr_cols
        self.e_factor = 0.5  # evaporation factor
        self.iteration_count = 0
        self.attr_keys = self.d_set.valid_gis
        self.d = self.generate_d()  # distance matrix (d) & attributes corresponding to d

    def generate_d(self):
        # 1a. Retrieve/Generate distance matrix (d)
        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        d = self.d_set.read_h5_dataset(grp_name)
        if d.size > 0:
            return d

        # 2. Initialize an empty d-matrix
        attr_keys = self.attr_keys
        n = len(attr_keys)
        d = np.zeros((n, n), dtype=float)  # cumulative sum of all segments
        attr_combs = list(combinations(attr_keys, 2))
        h5f = h5py.File(self.d_set.h5_file, 'r+')

        for str_i, str_j in attr_combs:
            gi_1 = GI.parse_gi(str_i)
            gi_2 = GI.parse_gi(str_j)
            if gi_1.attribute_col == gi_2.attribute_col:
                # Ignore similar attributes (+ or/and -)
                continue
            else:
                # Cumulative sum of all segments for 2x2 (all attributes) gradual items
                col_data_1 = self.d_set.attr_data[gi_1.attribute_col]
                col_data_2 = self.d_set.attr_data[gi_2.attribute_col]

                grp1 = 'dataset/' + self.d_set.step_name + '/temp_bin1'
                if gi_1.symbol == '+':
                    bin_1 = h5f.create_dataset(grp1, data=col_data_1 > col_data_1[:, np.newaxis], chunks=True)
                else:
                    bin_1 = h5f.create_dataset(grp1, data=col_data_1 < col_data_1[:, np.newaxis], chunks=True)

                grp2 = 'dataset/' + self.d_set.step_name + '/temp_bin2'
                if gi_2.symbol == '+':
                    bin_2 = h5f.create_dataset(grp2, data=col_data_2 > col_data_2[:, np.newaxis], chunks=True)
                else:
                    bin_2 = h5f.create_dataset(grp2, data=col_data_2 < col_data_2[:, np.newaxis], chunks=True)

                for k in bin_1.iter_chunks():
                    i = attr_keys.index(gi_1.as_string())
                    j = attr_keys.index(gi_2.as_string())
                    bin_sum = np.sum(np.multiply(bin_1[k], bin_2[k]))
                    d[i][j] += bin_sum
                    d[j][i] += bin_sum
                del h5f[grp1]
                del h5f[grp2]

        # 3. Save d_matrix in HDF5 file
        h5f.close()
        grp_name = 'dataset/' + self.d_set.step_name + '/d_matrix'
        self.d_set.add_h5_dataset(grp_name, d)
        return d

    def run_ant_colony(self):
        pass
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
        combs = list(combinations(idx, 2))
        for i, j in combs:
            p_matrix[i][j] += 1
            p_matrix[j][i] += 1
        return p_matrix

    def validate_gp(self, pattern):
        # pattern = [('2', '+'), ('4', '+')]
        n = self.d_set.attr_size
        attr_data = self.d_set.attr_data
        min_supp = self.d_set.thd_supp
        gen_pattern = GP()

        h5f = h5py.File(self.d_set.h5_file, 'r+')

        if len(pattern.gradual_items) >= 2:
            temp_file = 'temp.dat'
            gi = pattern.gradual_items[0]
            col_data = attr_data[gi.attribute_col]
            grp1 = 'dataset/' + self.d_set.step_name + '/temp_bin1'
            if gi.symbol == '+':
                bin_1 = h5f.create_dataset(grp1, data=col_data > col_data[:, np.newaxis], chunks=True)
            else:
                bin_1 = h5f.create_dataset(grp1, data=col_data < col_data[:, np.newaxis], chunks=True)
            gen_pattern.add_gradual_item(gi)
            temp_bin = np.memmap(temp_file, dtype=bool, mode='w+', shape=bin_1.shape)

            for i in range(1, len(pattern.gradual_items)):
                bin_sum = 0
                gi = pattern.gradual_items[i]
                col_data = attr_data[gi.attribute_col]
                grp2 = 'dataset/' + self.d_set.step_name + '/temp_bin2'
                if gi.symbol == '+':
                    bin_2 = h5f.create_dataset(grp2, data=col_data > col_data[:, np.newaxis], chunks=True)
                else:
                    bin_2 = h5f.create_dataset(grp2, data=col_data < col_data[:, np.newaxis], chunks=True)

                for k in bin_1.iter_chunks():
                    temp_bin[k] = np.multiply(bin_1[k], bin_2[k])
                    bin_sum += np.sum(temp_bin[k])
                supp = float(bin_sum) / float(n * (n - 1.0) / 2.0)
                if supp >= min_supp:
                    gen_pattern.add_gradual_item(gi)
                    gen_pattern.set_support(supp)
                    for s in bin_1.iter_chunks():
                        bin_1[s] = temp_bin[s]
                del h5f[grp2]
            os.remove(temp_file)
            del h5f[grp1]
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
