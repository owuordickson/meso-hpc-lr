"""

@author: Dickson Owuor
@credits: Thomas Runkler and Anne Laurent
@license: MIT
@version: 0.1.0
@email: owuordickson@gmail.com
@created: 12 October 2022
@modified: 13 October 2022

Gradual Pattern Labelling
-------------------------

A gradual pattern (GP) is a set of gradual items (GI) and its quality is measured by its computed support value. A GI is
a pair (i,v) where i is a column and v is a variation symbol: increasing/decreasing. Each column of a data set yields 2
GIs; for example, column age yields GI age+ or age-. For example given a data set with 3 columns (age, salary, cars) and
10 objects. A GP may take the form: {age+, salary-} with a support of 0.8. This implies that 8 out of 10 objects have
the values of column age 'increasing' and column 'salary' decreasing.

The nature of data sets used in gradual pattern mining do not provide target labels/classes among their features so that
intelligent classification algorithms may be applied on them. Therefore, most of the existing gradual pattern mining
techniques rely on optimized algorithms for the purpose of mining gradual patterns. In order to allow the possibility of
employing machine learning algorithms to the task of classifying gradual patterns, the need arises for labelling
features of data sets. First, we propose an approach for generating gradual pattern labels from existing features of a
data set. Second, we introduce a technique for extracting estimated gradual patterns from the generated labels.

In this study, we propose an approach that produces GP labels for data set features. In order to test the effectiveness
of our approach, we further propose and demonstrate how these labels may be used to extract estimated GPs with an
acceptable accuracy. The approach for extracting GPs is adopted from LCM: Linear time Closed item set Miner as
described in `http://lig-membres.imag.fr/termier/HLCM/hlcm.pdf`.
Here is the GitHub URL: https://github.com/scikit-mine/scikit-mine/tree/master/skmine

"""


import gc
from itertools import takewhile
# import multiprocessing as mp
import numpy as np
import pandas as pd
# import so4gp as sgp
from sortedcontainers import SortedDict

from .so4gp import ClusterGP, ExtGP, GI, get_num_cores


class LabelGP:

    def __init__(self, file, min_supp=0.5, predict=False):  # , n_jobs=1):
        self.d_gp = ClusterGP(file, min_supp, no_prob=True)
        self.ml_model = None
        if not predict:
            self.gp_labels = self._generate_labels()
        else:
            self.gp_labels = None  # predicted labels

    def _generate_labels(self):
        # 1. Generate labels
        labels = []
        features = self.d_gp.data
        # nodes_mat = self.d_gp.nodes_mat
        win_mat = self.d_gp.win_mat
        row_count = self.d_gp.row_count

        weight_vec_pos = np.array([np.count_nonzero(vec > 0) for vec in win_mat])
        weight_vec_neg = np.array([np.count_nonzero(vec < 0) for vec in win_mat])
        weight_vec = weight_vec_pos / np.add(weight_vec_neg, weight_vec_pos)

        # print(win_mat)
        # print("weight: " + str(weight_vec))
        # print("\n")

        for i in range(win_mat.shape[1]):  # all columns
            temp_label = ''
            gi = 1
            for wins_count in win_mat[:, i]:
                supp = float(abs(wins_count)) / float(row_count)
                # print(wins_count)
                # print(supp)
                weight = weight_vec[gi - 1]
                if (wins_count > 0) and (weight >= 0.5) and (supp >= self.d_gp.thd_supp):
                    temp_label += str(gi) + '+'
                elif (wins_count < 0) and ((1 - weight) >= 0.5) and (supp >= self.d_gp.thd_supp):
                    temp_label += str(gi) + '-'
                gi += 1
            labels.append(temp_label)

        # 2. Add labels to data-frame
        # 2a. get the titles
        # column_names = []
        # for col_title in self.data.titles:
        #    try:
        #        col = str(col_title.value.decode())
        #    except AttributeError:
        #        print(type(col_title))
        #        col = str(col_title[1].decode())
        #    column_names.append(col)
        column_names = [str(col_title.value.decode()) for col_title in self.d_gp.titles]
        column_names.append('GP Label')
        # print(column_names)

        # 2b. add labels column to data set
        col_labels = np.array(labels, dtype='U')
        col_labels = col_labels[:, np.newaxis]
        new_data = np.concatenate([features, col_labels], axis=1)

        # 2c. create data-frame
        self.d_gp.data = pd.DataFrame(new_data, columns=column_names)
        return self.d_gp.data['GP Label']

    def train_labels(self):
        pass

    def predict_labels(self):
        pass


class LabelGRITE:

    def __init__(self, lbl_obj, min_supp=0.5, max_depth=20):
        self.min_supp = min_supp  # provided by user
        self.max_depth = int(max_depth)
        self.label_obj = lbl_obj
        # self.gp_labels = lbl_obj.gp_labels
        # self.row_count = lbl_obj.gp_labels.shape[0]
        self.gi_to_tids = None

    def fit_label_bitmap(self):
        gp_labels = self.label_obj.gp_labels  # self.gp_labels
        # 1. Construct set of all the GIs
        set_gps = [set(str(obj).replace('+', '+,').replace('-', '-,').split(',')) for obj in gp_labels]
        u = set.union(*set_gps)
        u.discard('')
        # arr = np.array(list(u), dtype=int)

        # print(set_gps)
        # print(u)
        # print(arr)
        # print("\n")
        self.fit_tids(u)

    def fit_tids(self, all_gi):
        gp_labels = self.label_obj.gp_labels
        # self.n_transactions = 0  # reset for safety

        # 1. Construct set of all the GIs
        # set_gps = [set(str(obj).replace('+', '+,').replace('-', '-,')[:-1].split(',')) for obj in gp_labels]
        # set_gps = [set(str(obj).replace('+', '+,').replace('-', '-,').split(',')) for obj in self.gp_labels]
        # print(set_gps)
        # u = set.union(*set_gps)
        # u.discard('')

        # 2. Generate Transaction IDs
        arr_ids = [[int(x[0])
                    if x[1] == '+'
                    else (-1 * int(x[0])),
                    set(gp_labels.index[gp_labels.str.contains(pat=str(x[0]+'['+x[1]+']'), regex=True)]
                        .tolist())] for x in all_gi]

        self.gi_to_tids = SortedDict(np.array(arr_ids, dtype=object))
        # print(self.gi_to_tids)
        gc.collect()

    def discover(self, return_tids=False, return_depth=False):
        # fit
        self.fit_label_bitmap()
        # if self.gi_to_tids is None:
        #    self.fit_tids()

        # reverse order of support
        supp_sorted_items = sorted(
            self.gi_to_tids.items(), key=lambda e: len(e[1]), reverse=True
        )

        # dfs = Parallel(n_jobs=self.n_jobs, prefer="processes")(
        #    delayed(self._explore_root)(item, tids) for item, tids in supp_sorted_items
        # )
        res_data = [self._explore_root(item, tids) for item, tids in supp_sorted_items]
        # for r in res_data:
        #    print(r)

        # make sure we have something to concat
        res_data.append(pd.DataFrame(columns=["itemset", "support", "tids", "depth"]))
        df = pd.concat(res_data, axis=0, ignore_index=True)

        df, gps = self._extract_gps(df)

        if not return_tids:
            df.drop("tids", axis=1, inplace=True)

        if not return_depth:
            df.drop("depth", axis=1, inplace=True)
        return df, gps

    def _explore_root(self, item, tids):
        it = self._inner((frozenset(), tids), item)
        df = pd.DataFrame(data=it, columns=["itemset", "support", "tids", "depth"])
        return df

    def _inner(self, p_tids, limit, depth=0):
        if depth >= self.max_depth:
            return
        p, tids = p_tids
        total_len = self.label_obj.d_gp.row_count  # self.row_count
        # project and reduce DB w.r.t P
        cp = (
            item
            for item, ids in reversed(self.gi_to_tids.items())
            if tids.issubset(ids)
            if item not in p
        )

        # items are in reverse order, so the first consumed is the max
        max_k = next(takewhile(lambda e: e >= limit, cp), None)

        if max_k and max_k == limit:
            p_prime = (
                p | set(cp) | {max_k}
            )  # max_k has been consumed when calling next()
            # sorted items in output for better reproducibility
            raw_gp = np.array(list(p_prime))
            # print(str(len(raw_gp)) + ': ' + str(tids))
            if raw_gp.size <= 1:
                yield np.nan, 0, {}, 0
            else:
                yield raw_gp, len(tids), tids, depth

            candidates = self.gi_to_tids.keys() - p_prime
            candidates = candidates[: candidates.bisect_left(limit)]
            for new_limit in candidates:
                ids = self.gi_to_tids[new_limit]
                intersection_ids = tids.intersection(ids)
                supp = float(len(intersection_ids)) / float(total_len)

                if supp >= (self.min_supp/1):  # 0.2 (determines no. of candidates)
                    # new pattern and its associated tids
                    new_p_tids = (p_prime, intersection_ids)
                    yield from self._inner(new_p_tids, new_limit, depth + 1)

    def _extract_gps(self, df):
        lst_gp = []
        unique_ids = []
        total_len = self.label_obj.d_gp.row_count  # self.row_count

        # Remove useless GP items
        df = df[df.itemset.notnull()]

        # Store in Numpy
        raw_gps = df.to_numpy()

        # Remove repeated GPs (when inverted)
        for i in range(raw_gps.shape[0]):
            obj = raw_gps[i]
            res_set = [item[2] for item in raw_gps if (set(item[0]).issuperset(set(-obj[0])) or
                                                       (set(item[0]) == set(-obj[0])))]

            if len(res_set) > 0:
                for temp in res_set:
                    raw_gps[i][2] = set(obj[2]).union(set(temp))
                pat_len = len(raw_gps[i][2])+1  # remember first node has 2 tids
                # pat_len = pat_len+1 if pat_len > 1 else pat_len
                raw_gps[i][1] = pat_len / total_len  # dfs approach
                # bfs approach
                # pat_ij = (pat_len*0.5) * (pat_len - 1)
                # total_ij = (total_len*0.5) * (total_len - 1)
                # raw_gps[i][1] = pat_ij / total_ij
            else:
                pat_len = int(obj[1])+1  # remember first node has 2 tids
                # pat_len = pat_len+1 if pat_len > 1 else pat_len
                raw_gps[i][1] = pat_len / total_len  # dfs approach
                # bfs approach
                # pat_ij = (pat_len * 0.5) * (pat_len - 1)
                # total_ij = (total_len * 0.5) * (total_len - 1)
                # raw_gps[i][1] = pat_ij / total_ij

            gp = ExtGP()
            for g in obj[0]:
                if g > 0:
                    sym = '+'
                else:
                    sym = '-'
                gi = GI((abs(g) - 1), sym)
                if not gp.contains_attr(gi):
                    gp.add_gradual_item(gi)
                    gp.set_support(obj[1])

            raw_gps[i][0] = gp.to_string()

            if (not gp.is_duplicate(lst_gp)) and (len(gp.gradual_items) > 1) and (gp.support >= self.min_supp):
                unique_ids.append(i)
                lst_gp.append(gp)
                # print(str(gp.to_string()) + ': ' + str(gp.support))

        raw_gps = raw_gps[unique_ids]
        new_df = pd.DataFrame(data=raw_gps, columns=["itemset", "support", "tids", "depth"])

        return new_df, lst_gp


def execute(f_path, mine_obj, cores):
    try:
        res_df, estimated_gps = mine_obj.discover(return_depth=True)
        d_gp = mine_obj.label_obj.d_gp

        if cores > 1:
            num_cores = cores
        else:
            num_cores = get_num_cores()

        wr_line = "Algorithm: LBL-GP \n"
        wr_line += "No. of (dataset) attributes: " + str(d_gp.col_count) + '\n'
        wr_line += "No. of (dataset) tuples: " + str(d_gp.row_count) + '\n'
        wr_line += "Minimum support: " + str(d_gp.thd_supp) + '\n'
        wr_line += "Number of cores: " + str(num_cores) + '\n'
        wr_line += "Number of patterns: " + str(len(estimated_gps)) + '\n\n'

        for txt in d_gp.titles:
            wr_line += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')

        wr_line += str("\nFile: " + f_path + '\n')
        wr_line += str("\nPattern : Support" + '\n')

        for gp in estimated_gps:
            wr_line += (str(gp.to_string()) + ' : ' + str(gp.support) + '\n')

        return wr_line, estimated_gps
    except ArithmeticError as error:
        wr_line = "Failed: " + str(error)
        print(error)
        return wr_line


# filePath = '../../data/DATASET.csv'  # 0.25
# filePath = '../../data/breast_cancer.csv'  # 0.2
# filePath = '../../data/c2k_02k.csv'  # 0.5
# # filePath = '../../data/c2k.csv'  # 0.5
# minSup = 0.5
# lgp = LabelGP(filePath, min_supp=minSup)
# mineObj = LabelGRITE(lgp, min_supp=minSup)

# lgp.fit()
# res_df1, estimated_gps1 = mineObj.discover(return_depth=True)

# print(lgp.d_gp.data)
# print("\n")
# print(res_df1)

# minSup = -1
# print(sgp.analyze_gps(filePath, minSup, estimated_gps1, approach='bfs'))
