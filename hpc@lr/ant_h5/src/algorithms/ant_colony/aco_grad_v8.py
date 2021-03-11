# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@credits: "Anne Laurent,"
@license: "MIT"
@version: "8.0"
@email: "owuordickson@gmail.com"
@created: "12 July 2019"
@modified: "10 Mar 2021"

Breath-First Search for gradual patterns (ACO-GRAANK)

Changes
-------
1. Initiates reading of CSV file in chunks
2. Calculates Binary Ranks and Multiplication of the Binaries

"""
import numpy as np
from algorithms.common.gp_v4 import GI, GP
from algorithms.common.dataset_v8 import Dataset


class GradACO:

    def __init__(self, f_path, c_size, min_supp):
        self.thd_supp = min_supp
        self.chunk_size = c_size
        self.d_set = Dataset(f_path)
        self.e_factor = 0.5  # evaporation factor
        self.iteration_count = 0
        self.d, self.attr_keys = self.generate_d()  # distance matrix (d) & attributes corresponding to d

    def generate_d(self):
        # 1. Fetch valid attribute keys
        attr_keys = []
        for a in self.d_set.attr_cols:
            attr_keys.append(GI(a, '+').as_string())
            attr_keys.append(GI(a, '-').as_string())

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
                    d[i][j] = 1

        return d, attr_keys

    def run_ant_colony(self):
        min_supp = self.thd_supp
        d = self.d
        # a = self.d_set.row_count
        winner_gps = list()  # subsets
        loser_gps = list()  # supersets
        repeated = 0
        it_count = 0

        # 1. Remove d[i][j] < frequency-count of min_supp
        # fr_count = ((min_supp * a * (a - 1)) / 2)
        # d[d < fr_count] = 0

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
        while it_count < 2:
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
        # 1a. Initiate minimum support and size of data set (row count)
        min_supp = self.thd_supp
        n = 0

        # 1b. Retrieve columns to be used (from generated pattern)
        cols = [gi.attribute_col for gi in pattern.gradual_items]
        sum_dict = pattern.to_dict()

        # 1c. Initialize empty validated pattern (to be stored as a dict)
        gen_pattern = GP()
        gen_gp_dict = {}

        # 2. Execute binary rank for selected columns in chunks (read csv columns in chunks)
        rank_1 = None
        tmp_pattern = GP()
        skip_columns = []
        first_gi = None
        for chunk_1 in self.d_set.read_csv_data(cols, self.chunk_size):
            # 2a. Count total number of rows
            n += chunk_1.values.shape[0]
            for chunk_2 in self.d_set.read_csv_data(cols, self.chunk_size):
                self.d_set.used_chunks += 1

                # 2b. For each 2-sets of csv chunks: loop through all columns to determine rank and binary product
                is_restarted = True
                for i in range(len(pattern.gradual_items)):
                    # Get gradual item
                    gi = pattern.gradual_items[i]

                    # Replace invalid values with 0
                    chunk_1 = chunk_1.replace(to_replace=['?', np.NAN], value='0').astype(np.float)
                    chunk_2 = chunk_2.replace(to_replace=['?', np.NAN], value='0').astype(np.float)
                    # print(chunk_1)

                    # Get column name
                    col_name = self.d_set.get_col_name(gi)
                    # print(str(col_name) + str(chunk_1[col_name].values))
                    # print(str(col_name) + str(chunk_2[col_name].values))

                    if first_gi is None:
                        # print(chunk_1.columns.tolist())
                        is_restarted = False
                        if gi.is_decrement():
                            rank_1 = chunk_1[col_name].values > chunk_2[col_name].values[:, np.newaxis]
                        else:
                            rank_1 = chunk_1[col_name].values < chunk_2[col_name].values[:, np.newaxis]
                        skip_columns.append(i)
                        if np.sum(rank_1) <= 0:
                            continue
                        else:
                            # print(gi.to_string() + str(rank_1))
                            first_gi = gi
                            tmp_pattern.add_gradual_item(gi)
                    else:
                        if gi.is_decrement():
                            rank_2 = chunk_1[col_name].values > chunk_2[col_name].values[:, np.newaxis]
                        else:
                            rank_2 = chunk_1[col_name].values < chunk_2[col_name].values[:, np.newaxis]
                        # print(gi.to_string() + str(rank_2))
                        if np.sum(rank_2) <= 0:
                            skip_columns.append(i)
                            continue
                        else:
                            if is_restarted:
                                # print("Rank_1 re-initialized")
                                is_restarted = False
                                tmp_pattern = GP()
                                gi_1 = first_gi
                                tmp_pattern.add_gradual_item(gi_1)
                                if gi_1.attribute_col == gi.attribute_col:
                                    rank_1 = rank_2.copy()
                                    continue
                                else:
                                    col_name_1 = self.d_set.get_col_name(gi_1)
                                    if gi_1.is_decrement():
                                        rank_1 = chunk_1[col_name_1].values > chunk_2[col_name_1].values[:, np.newaxis]
                                    else:
                                        rank_1 = chunk_1[col_name_1].values < chunk_2[col_name_1].values[:, np.newaxis]

                            tmp_rank = np.multiply(rank_1, rank_2)
                            tmp_sum = np.sum(tmp_rank)
                            # print("Sum of bin AND: " + str(tmp_sum))
                            # print(str(rank_1) + ' + ' + str(rank_2) + ' = ' + str(tmp_rank))
                            if tmp_sum > 0:
                                rank_1 = tmp_rank.copy()
                                tmp_pattern.add_gradual_item(gi)

                                str_pat = ''
                                for tmp_gi in tmp_pattern.gradual_items:
                                    sum_dict[tmp_gi.as_string()] += tmp_sum
                                    if str_pat == '':
                                        str_pat += tmp_gi.as_string()
                                    else:
                                        str_pat += ',' + tmp_gi.as_string()

                                try:
                                    gen_gp_dict[str_pat] += tmp_sum
                                except KeyError:
                                    gen_gp_dict.update({str_pat: tmp_sum})
                    # print("\n")
        # 3. Store row count
        if self.d_set.row_count == 0:
            self.d_set.row_count = n

        # 4. Check support of each bin_rank
        for key, value in gen_gp_dict.items():
            supp = float(value) / float(n * (n - 1.0) / 2.0)
            if supp >= min_supp:
                tmp_lst = key.split(',')
                for txt_gi in tmp_lst:
                    gen_gi = GI.parse_gi(txt_gi)
                    if not gen_pattern.contains_attr(gen_gi):
                        gen_pattern.add_gradual_item(gen_gi)
                gen_pattern.set_support(supp)

        # 5. Update invalid attributes/columns in the d_matrix
        for key, value in sum_dict.items():
            supp = float(value) / float(n * (n - 1.0) / 2.0)
            if supp <= 0:
                inv_gi = GI.parse_gi(key)
                idx = self.attr_keys.index(inv_gi.as_string())
                self.d[:, idx] = 0
        # print(pattern.to_string())
        # print(gen_pattern.to_string())
        # print(gen_gp_dict)
        # print(sum_dict)
        # print("---\n")

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
