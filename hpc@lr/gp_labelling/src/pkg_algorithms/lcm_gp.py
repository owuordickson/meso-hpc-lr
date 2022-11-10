from so4gp import ExtGP, GI, DataGP, analyze_gps

from itertools import takewhile

import numpy as np
import pandas as pd
from sortedcontainers import SortedDict


class LcmGP(DataGP):

    def __init__(self, *args, max_depth=20):
        super(LcmGP, self).__init__(*args)
        self.max_depth = int(max_depth)
        self.gi_to_tids = None
        # self.min_len = int(self.d_gp.row_count * self.min_supp)

    def fit(self):
        self.fit_tids()
        self.gi_to_tids = SortedDict(self.valid_tids)

    def fit_discover(self, return_tids=False, return_depth=False):
        # fit
        # if self.gp_labels is None:
        #    self.fit()
        self.fit()

        # reverse order of support
        supp_sorted_items = sorted(
            self.gi_to_tids.items(), key=lambda e: len(e[1]), reverse=True
        )

        # dfs = Parallel(n_jobs=self.n_jobs, prefer="processes")(
        #    delayed(self._explore_root)(item, tids) for item, tids in supp_sorted_items
        # )
        gps = [self._explore_root(item, tids) for item, tids in supp_sorted_items]

        # make sure we have something to concat
        gps.append(pd.DataFrame(columns=["itemset", "support", "tids", "depth"]))
        df = pd.concat(gps, axis=0, ignore_index=True)

        df, gps = self._filter_gps(df)

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
        n = self.row_count
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
                yield np.nan, len(tids), tids, depth
            else:
                yield raw_gp, len(tids), tids, depth

            candidates = self.gi_to_tids.keys() - p_prime
            candidates = candidates[: candidates.bisect_left(limit)]
            for new_limit in candidates:
                ids = self.gi_to_tids[new_limit]
                intersection_ids = tids.intersection(ids)
                # tids_len = len(intersection_ids)  # (tids_len * 0.5) * (tids_len - 1)
                supp = float(len(intersection_ids)) / float(n * (n - 1.0) / 2.0)

                if supp >= self.thd_supp:  # (self.min_len/2):
                    # new pattern and its associated tids
                    new_p_tids = (p_prime, intersection_ids)
                    yield from self._inner(new_p_tids, new_limit, depth + 1)

    def _filter_gps(self, df):
        lst_gp = []
        unique_ids = []
        total_len = (self.row_count*0.5) * (self.row_count-1)

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
                pat_len = len(raw_gps[i][2])
                raw_gps[i][1] = pat_len / total_len  # dfs approach
                # bfs approach
                # pat_ij = (pat_len*0.5) * (pat_len - 1)
                # total_ij = (total_len*0.5) * (total_len - 1)
                # raw_gps[i][1] = pat_ij / total_ij
            else:
                pat_len = int(obj[1])
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

            if (not gp.is_duplicate(lst_gp)) and (len(gp.gradual_items) > 1) and (gp.support >= self.thd_supp):
                unique_ids.append(i)
                lst_gp.append(gp)
                # print(str(gp.to_string()) + ': ' + str(gp.support))

        raw_gps = raw_gps[unique_ids]
        new_df = pd.DataFrame(data=raw_gps, columns=["itemset", "support", "tids", "depth"])

        return new_df, lst_gp


filePath = '../../data/DATASET.csv'
minSup = 0.4
mine_obj = LcmGP(filePath, minSup)
mine_obj.fit()
res_df, lst_gps = mine_obj.fit_discover()
print(res_df)

print(analyze_gps(filePath, minSup, lst_gps, approach='dfs'))
