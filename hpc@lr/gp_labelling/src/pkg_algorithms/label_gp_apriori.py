import gc
import numpy as np
import pandas as pd
import so4gp as sgp


class MlDataGP(sgp.DataGP):

    def __init__(self, *args):
        super(MlDataGP, self).__init__(*args)
        self.valid_cols, self.net_bitmap = self.construct_net_bitmap()
        """:type valid_cols: ndarray"""
        """:type net_bitmap: ndarray"""

    def construct_net_bitmap(self):
        # (check) implement parallel multiprocessing
        # 1. Transpose csv array data
        attr_data = self.data.T
        self.attr_size = self.row_count

        # 2. Construct and store 1-item_set bins
        n = self.attr_size
        net_mat = list()
        valid_cols = list()
        for col in self.attr_cols:
            col_data = np.array(attr_data[col], dtype=float)
            # incr = np.array((col, '+'), dtype='i, S1')
            # decr = np.array((col, '-'), dtype='i, S1')

            # 2a. Generate 1-itemset gradual items
            with np.errstate(invalid='ignore'):
                temp_pos = col_data > col_data[:, np.newaxis]
                # temp_pos[temp_pos] = 1
                # temp_pos[temp_pos == False] = 0

                # 2b. Estimate net-win from diagonal (left) wins
                supp = float(np.sum(temp_pos)) / float(n * (n - 1.0) / 2.0)
                if supp >= self.thd_supp:
                    valid_cols.append(col)
                    prob = []
                    for i in range(temp_pos.shape[0]):
                        p = np.sum(temp_pos[i, i:]) / (n - (i+1))
                        if (np.sum(temp_pos[i, i:]) == 0) and (np.sum(temp_pos[i, :i]) == 0):
                            sub = -5
                            # if temp_pos[i, i:].size > temp_pos[i, :i].size:
                            #    sub = 5
                            # else:
                            #    sub = -5
                        else:
                            sub = np.sum(temp_pos[i, i:]) - np.sum(temp_pos[i, :i])
                        prob.append(p)
                        print(sub)
                        # print(temp_pos[i, :i])
                    print(temp_pos)
                    print(col)
                    print(prob)
                    print("\n")
        return np.array([valid_cols]), np.array([net_mat])


def generate_gp_labels_v2(data_gp):
    # 1. Generate labels
    labels = []
    features = np.array(data_gp.data, dtype=np.float64)
    sel_nwm = data_gp.net_win_mat[::2]
    sel_nwm[sel_nwm == -1] = 2  # encode -1 as 2 in the net-win matrix

    # print(sel_nwm.shape[1])
    for i in range(sel_nwm.shape[1]):  # all columns
        temp_label = ''.join(str(x) for x in sel_nwm[:, i])
        labels.append(temp_label)

    # 2. Add labels to data-frame
    # 2a. get the titles
    column_names = []
    for col_title in data_gp.titles:
        try:
            col = str(col_title.value.decode())
        except AttributeError:
            col = str(col_title[1].decode())
        column_names.append(col)
    column_names.append('GP Label')
    # print(column_names)

    # 2b. add labels column to data set
    col_labels = np.array(labels, dtype='U')
    col_labels = col_labels[:, np.newaxis]
    new_data = np.concatenate([features, col_labels], axis=1)

    # 2c. create data-frame
    return pd.DataFrame(new_data, columns=column_names)


def estimate_net_win_mat(gp_labels):
    gp_mat = [list(str(obj)) for obj in gp_labels]
    gp_mat = np.array(gp_mat, dtype=int)
    gp_mat[gp_mat == 2] = -1
    return gp_mat


def calculate_support(gp_mat, gi_obj):
    n = gp_mat.shape[0]
    cols = [x[0] for x in gi_obj]
    dirs = np.array([1 if x[1].decode() == '+' else -1 for x in gi_obj])
    mat = gp_mat[:, cols]
    match_rows = np.where((((mat[:, 0] == dirs[0]) & (mat[:, 1] == dirs[1])) | ((mat[:, 0] == dirs[1]) &
                                                                                (mat[:, 1] == dirs[0]))))
    sup = match_rows[0].size/n

    # print(gi_obj)
    # print(cols)
    # print(dirs)
    # print(mat)
    # print(match_rows)
    # print(match_rows[0].size)
    # print(sup)
    # print("\n")
    return sup


def inv(g_item):
    if g_item[1] == '+':
        temp = tuple([g_item[0], '-'])
    else:
        temp = tuple([g_item[0], '+'])
    return temp


def remove_existing_gi(cand_gp):
    cols = []
    new_cand = set()
    for gi_obj in cand_gp:
        if not cols:
            cols.append(gi_obj[0])
            new_cand.add(gi_obj)
        elif gi_obj[0] not in cols:
            cols.append(gi_obj[0])
            new_cand.add(gi_obj)
        # else:
        #    print(str(gi_obj[0]) + ' is already in ' + str(cand_gp))
    return new_cand


def gen_apriori_candidates(lst_gi):
    res = []
    all_candidates = []
    if len(lst_gi) < 2:
        return []
    try:
        set_gi = [{x} for x in lst_gi]
    except TypeError:
        set_gi = [set(x) for x in lst_gi]

    for i in range(len(lst_gi) - 1):
        for j in range(i + 1, len(lst_gi)):
            try:
                gi_i = {lst_gi[i]}
                gi_j = {lst_gi[j]}
                gi_o = {lst_gi[0]}
            except TypeError:
                gi_i = set(lst_gi[i])
                gi_j = set(lst_gi[j])
                gi_o = set(lst_gi[0])
            gp_cand = gi_i | gi_j  # set union i.e., gi_i.union(gi_j)
            gp_cand = remove_existing_gi(gp_cand)  # remove gi from same column

            inv_gp_cand = {inv(x) for x in gp_cand}
            if (len(gp_cand) == len(gi_o) + 1) and (not (all_candidates != [] and gp_cand in all_candidates)) \
                    and (not (all_candidates != [] and inv_gp_cand in all_candidates)):
                is_valid_candidate = True
                for k in gp_cand:
                    try:
                        k_set = {k}
                    except TypeError:
                        k_set = set(k)
                    gp_cand_2 = gp_cand - k_set
                    inv_gp_cand_2 = {inv(x) for x in gp_cand_2}
                    if gp_cand_2 not in set_gi and inv_gp_cand_2 not in set_gi:
                        is_valid_candidate = False
                        break
                if is_valid_candidate:
                    # m = R[i][1] * R[j][1]
                    # t = float(np.sum(m)) / float(n * (n - 1.0) / 2.0)
                    # if t > sup:
                    #    res.append([gp_cand, m])
                    res.append(gp_cand)
                all_candidates.append(gp_cand)
                gc.collect()
    return res


def estimate_gps(gp_mat, min_sup):

    patterns = []
    """:type patterns: GP list"""
    str_winner_gps = []
    # n = d_set.attr_size
    # valid_gps = d_set.valid_gps

    valid_gps = []
    n = gp_mat.shape[1]
    for a in range(n):
        pos = np.array((a, '+'), dtype='i, S1')
        neg = np.array((a, '-'), dtype='i, S1')
        valid_gps.append(pos.tolist())
        valid_gps.append(neg.tolist())

    while len(valid_gps) > 0:
        valid_gps = gen_apriori_candidates(valid_gps)
        # print(valid_gps)
        i = 0
        while i < len(valid_gps) and valid_gps != []:
            gi_tuple = valid_gps[i]
            sup = calculate_support(gp_mat, gi_tuple)
            if sup < min_sup:
                del valid_gps[i]
            else:
                gp = sgp.GP()
                """:type gp: GP"""
                for obj in valid_gps[i]:
                    gi = sgp.GI(obj[0], obj[1].decode())
                    """:type gi: GI"""
                    gp.add_gradual_item(gi)
                gp.set_support(sup)
                patterns.append(gp)
                # str_winner_gps.append(gp.print(d_set.titles))
                i += 1
                # print(str(gp.to_string()) + ': ' + str(gp.support))
    return str_winner_gps, patterns


ds1 = sgp.ClusterGP('../../data/DATASET.csv', e_prob=0)
# ds1 = sgp.ClusterGP('../../data/c2k_02k.csv', e_prob=0)
# ds1 = sgp.ClusterGP('../../data/breast_cancer.csv', e_prob=0)

df1 = generate_gp_labels_v2(ds1)
print(df1)
gpLabels = df1['GP Label']
gpMat = estimate_net_win_mat(gpLabels)
# gpMat = np.array([[1, -1, 0, -1], [1, 1, -1, -1], [1, 1, -1, -1], [0, 1, 0, 0], [-1, -1, 1, 1]])
# print(gpMat.shape)

y, gps = estimate_gps(gpMat, 0.5)
for pat in gps:
    print(str(pat.to_string()) + ': ' + str(pat.support))


# ds = MlDataGP('../data/DATASET.csv')


# out_json, gps = sgp.graank('../data/breast_cancer.csv', return_gps=True)
# print(out_json)
# for pat in gps:
#    print(str(pat.to_string()) + ': ' + str(pat.support))
