# -*- coding: utf-8 -*-
"""
@author: Dickson Owuor

@credits: Thomas Runkler, Lesley Bonyo and Anne Laurent

@license: MIT

@version: 0.1.5

@email: owuordickson@gmail.com

@created: 01 March 2022

@modified: 25 April 2022

Clustering Gradual Items
------------------------

A gradual pattern (GP) is a set of gradual items (GI) and its quality is measured by its computed support value. A GI is
a pair (i,v) where i is a column and v is a variation symbol: increasing/decreasing. Each column of a data set yields 2
GIs; for example, column age yields GI age+ or age-. For example given a data set with 3 columns (age, salary, cars) and
10 objects. A GP may take the form: {age+, salary-} with a support of 0.8. This implies that 8 out of 10 objects have
the values of column age 'increasing' and column 'salary' decreasing.

We borrow the net-win concept used in the work 'Clustering Using Pairwise Comparisons' proposed by R. Srikant to the
problem of extracting gradual patterns (GPs). In order to mine for GPs, each feature yields 2 gradual items which we use
to construct a bitmap matrix comparing each row to each other (i.e., (r1,r2), (r1,r3), (r1,r4), (r2,r3), (r2,r4),
(r3,r4)).

In this approach, we convert the bitmap matrices into 'net-win matrices'. Finally, we apply spectral clustering to
determine which gradual items belong to the same group based on the similarity of gradual dependency. Gradual items in
the same cluster should have almost similar score vector.

"""
import json
import math
import numpy as np
from ypstruct import structure
from sklearn.cluster import KMeans

import so4gp as sgp

# Clustering Configurations
MIN_SUPPORT = 0.5
ERASURE_PROBABILITY = 0.5  # determines the number of pairs to be ignored
SCORE_VECTOR_ITERATIONS = 10  # maximum iteration for score vector estimation


def clugps(f_path, min_sup=MIN_SUPPORT, e_probability=ERASURE_PROBABILITY,
           sv_max_iter=SCORE_VECTOR_ITERATIONS, return_gps=False, testing=False):
    # 1. Create a DataGP object
    d_gp = sgp.DataGP(f_path, min_sup)
    """:type d_gp: DataGP"""

    # 2. Generate net-win matrices
    mat_obj = construct_matrices(d_gp, e=e_probability)
    s_matrix = mat_obj.nwin_matrix  # Net-win matrix (S)
    # print(s_matrix)

    # 3a. Spectral Clustering: perform SVD to determine the independent rows
    u, s, vt = np.linalg.svd(s_matrix)

    # 3b. Spectral Clustering: compute rank of net-wins matrix
    r = np.linalg.matrix_rank(s_matrix)  # approximated r

    # 3c. Spectral Clustering: rank approximation
    s_matrix_approx = u[:, :r] @ np.diag(s[:r]) @ vt[:r, :]

    # 3d. Clustering using K-Means
    kmeans = KMeans(n_clusters=r, random_state=0)
    y_pred = kmeans.fit_predict(s_matrix_approx)

    # 4. Infer GPs
    str_gps, gps = infer_gps(y_pred, d_gp, mat_obj, sv_max_iter)
    # print(str_gps)

    # 5. Output - DO NOT ADD TO PyPi Package
    out = structure()
    out.estimated_gps = gps
    out.max_iteration = sv_max_iter
    out.titles = d_gp.titles
    out.col_count = d_gp.col_count
    out.row_count = d_gp.row_count
    out.e_prob = e_probability
    if testing:
        return out

    # Output
    out = json.dumps({"Algorithm": "Clu-GRAD", "Patterns": str_gps})
    """:type out: object"""
    if return_gps:
        return out, gps
    else:
        return out


def construct_matrices(d_gp, e):

    # 1. Sample pairs using erasure-probability
    n = d_gp.row_count
    total_pair_count = int(n * (n - 1) * 0.5)
    prob = 1 - e  # Sample probability
    sampled_idx = np.random.choice(total_pair_count, int(prob*total_pair_count), replace=False)  # Sampled pairs
    # sampled_idx = np.array([0, 9, 6, 7, 3])  # For testing

    # 2. Variable declarations
    attr_data = d_gp.data.T  # Feature data objects
    lst_gis = []  # List of GIs
    s_mat = []  # S-Matrix (made up of S-Vectors)
    cum_wins = []  # Cumulative wins
    pair_count = sampled_idx.shape[0]  # Number of sampled pairs
    get_ij = np.zeros((pair_count, 2), dtype=np.int)  # ij pair values

    # 3. Compute i and j values from sampled indices
    for k in range(pair_count):
        idx = sampled_idx[k]
        g, i_g = get_pair_partition(n, idx)
        i = (g - 1)
        j = (g + i_g)
        get_ij[k][0] = i
        get_ij[k][1] = j

    # 4. Construct S matrix from data set
    for col in d_gp.attr_cols:
        col_data = np.array(attr_data[col], dtype=np.float)  # Feature data objects
        s_vec = np.zeros((n,), dtype=np.int)  # S-vector
        temp_cum_wins = np.zeros((pair_count, ), dtype=np.int)  # Cumulative wins

        for k in range(pair_count):
            i = get_ij[k][0]
            j = get_ij[k][1]
            # print(str(i) + "," + str(j))

            # Construct S-vector (net-win vector)
            if col_data[i] < col_data[j]:
                s_vec[i] += 1  # i wins
                s_vec[j] += -1  # j loses
                temp_cum_wins[k] = 1  # For estimation of score-vector
            elif col_data[i] > col_data[j]:
                s_vec[i] += -1  # i loses
                s_vec[j] += 1  # j wins
                temp_cum_wins[k] = -1  # For estimation of score-vector

        # Normalize S-vector
        if np.count_nonzero(s_vec) > 0:
            s_vec[s_vec > 0] = 1  # Normalize net wins
            s_vec[s_vec < 0] = -1  # Normalize net loses

            lst_gis.append(sgp.GI(col, '+'))
            cum_wins.append(temp_cum_wins)
            s_mat.append(s_vec)

            lst_gis.append(sgp.GI(col, '-'))
            cum_wins.append(-temp_cum_wins)
            s_mat.append(-s_vec)

    res = structure()
    res.gradual_items = np.array(lst_gis)
    res.cum_wins = np.array(cum_wins)
    res.nwin_matrix = np.array(s_mat)
    res.ij = get_ij
    # print(get_ij)
    # print(np.array(cum_wins).T)
    # print(np.array(s_mat))
    # print(sampled_idx)
    return res


def get_pair_partition(n, i):
    # Retrieve group from: (n-1), (n-2), (n-3) ..., (n-(n-1)) using index i
    lb = 0
    k = 1
    x = n - k
    while k < n:
        if i < x:
            return k, (i-lb)
        else:
            lb = x
            k += 1
            x += (n - k)
    return -1, -1


def infer_gps(clusters, d_gp, mat_obj, max_iter):

    patterns = []
    str_patterns = []

    n = d_gp.row_count
    all_gis = mat_obj.gradual_items
    cum_wins = mat_obj.cum_wins
    ij_cols = mat_obj.ij

    lst_indices = [np.where(clusters == element)[0] for element in np.unique(clusters)]
    # lst_indices = list([np.array([0, 5, 7])])  # Hard coded - for testing
    # print(lst_indices)
    for grp_idxs in lst_indices:
        if grp_idxs.size > 1:
            # 1. Retrieve all cluster-pairs and the corresponding GIs
            cluster_gis = all_gis[grp_idxs]
            cluster_cum_wins = cum_wins[grp_idxs]  # All the rows of selected groups

            # 2. Compute score vector from R matrix
            score_vectors = []  # Approach 2
            for c_win in cluster_cum_wins:
                temp = estimate_score_vector(n, c_win, ij_cols, max_iter)
                score_vectors.append(temp)

            # 3. Estimate support
            est_sup = estimate_support(n, score_vectors)

            # 4. Infer GPs from the clusters
            if est_sup >= d_gp.thd_supp:
                gp = sgp.GP()
                for gi in cluster_gis:
                    gp.add_gradual_item(gi)
                gp.set_support(est_sup)
                patterns.append(gp)
                str_patterns.append(gp.print(d_gp.titles))
                # print(gp.print(d_gp.titles))
    return str_patterns, patterns


def estimate_score_vector(n, c_wins, arr_ij, max_iter):
    # Estimate score vector from pairs
    score_vector = np.ones(shape=(n,))

    # Construct a win-matrix
    temp_vec = np.zeros(shape=(n,))
    pair_count = arr_ij.shape[0]
    # print(c_wins)

    # Compute score vector
    for k in range(max_iter):
        if np.count_nonzero(score_vector == 0) > 1:
            break
        else:
            for pr in range(pair_count):
                pr_val = c_wins[pr]
                i = arr_ij[pr][0]
                j = arr_ij[pr][1]
                # print(str(i)+","+str(j)+": "+str(pr_val))
                if pr_val == 1:
                    log = math.log(math.exp(score_vector[i]) / (math.exp(score_vector[i]) + math.exp(score_vector[j])),
                                   10)
                    temp_vec[i] += pr_val * log
                elif pr_val == -1:
                    log = math.log(math.exp(score_vector[j]) / (math.exp(score_vector[i]) + math.exp(score_vector[j])),
                                   10)
                    temp_vec[j] += -pr_val * log
            score_vector = abs(temp_vec / np.sum(temp_vec))
    return score_vector


def estimate_support(n, score_vectors):
    # Estimate support - use different score-vectors to construct pairs
    bin_mat = np.ones((n, n), dtype=np.bool)
    for vec in score_vectors:
        temp_bin = vec < vec[:, np.newaxis]
        bin_mat = np.multiply(bin_mat, temp_bin)

    est_sup = float(np.sum(bin_mat)) / float(n * (n - 1.0) / 2.0)
    # print(est_sup)
    return est_sup


# DO NOT ADD TO PyPi Package
def execute(f_path, min_supp, e_prob, max_iter, cores):
    try:
        if cores > 1:
            num_cores = cores
        else:
            num_cores = sgp.get_num_cores()

        out = clugps(f_path, min_supp, e_prob, max_iter, testing=True)
        list_gp = out.estimated_gps

        wr_line = "Algorithm: Clu-GRAD (v1.5)\n"
        wr_line += "No. of (dataset) attributes: " + str(out.col_count) + '\n'
        wr_line += "No. of (dataset) tuples: " + str(out.row_count) + '\n'
        wr_line += "Erasure probability: " + str(out.e_prob) + '\n'
        wr_line += "Score vector iterations: " + str(max_iter) + '\n'

        wr_line += "Minimum support: " + str(min_supp) + '\n'
        wr_line += "Number of cores: " + str(num_cores) + '\n'
        wr_line += "Number of patterns: " + str(len(list_gp)) + '\n'

        for txt in out.titles:
            try:
                wr_line += (str(txt.key) + '. ' + str(txt.value.decode()) + '\n')
            except AttributeError:
                wr_line += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')

        wr_line += str("\nFile: " + f_path + '\n')
        wr_line += str("\nPattern : Support" + '\n')

        for gp in list_gp:
            wr_line += (str(gp.to_string()) + ' : ' + str(round(gp.support, 3)) + '\n')

        return wr_line, list_gp
    except ArithmeticError as error:
        wr_line = "Failed: " + str(error)
        print(error)
        return wr_line, None
