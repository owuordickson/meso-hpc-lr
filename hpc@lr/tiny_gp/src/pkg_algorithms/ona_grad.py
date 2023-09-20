# -*- coding: utf-8 -*-

"""
@author: Dickson Owuor

@credits: Thomas Runkler, Anne Laurent

@license: MIT

@version: 0.0.1

@email: owuordickson@gmail.com

@created: 05 July 2023

@modified: 05 July 2023


--- Ideas ---

* Compute the suitable batch-size for each sample (dynamically vary size based on the hoeffding error bound - correct chunk-size should guarantee a bound less than user-defined threshold).

* Predict the GPs of next/previous chunks using hoeffding error bound to guarantee the prediction values.

"""


import math
import numpy as np
import pandas as pd
# import so4gp as sgp
from .so4gp_update import DataGP, GRAANK, analyze_gps, get_num_cores
from .stream_gp import StreamGP


def online_gp(f_path, min_sup, min_batch_size, batch_step, min_conf, max_hoef, cores, dev=False):
    df_stream = pd.read_csv(f_path, sep=";|,|' '|\t", engine='python')
    buffer = []
    # stream_gps = []
    # stream_dict = {'hoef': 0, 'patterns': []}
    batch_count = 1
    batch_size = min_batch_size
    output = ""

    if cores > 1:
        num_cores = cores
    else:
        num_cores = get_num_cores()

    for index, data_row in df_stream.iterrows():
        buffer.append(data_row)

        if len(buffer) == batch_size:
            df_buffer = pd.DataFrame(buffer)
            stream_dict = process_batch_gps(df_buffer, min_sup, min_conf, max_hoef)
            is_ok = stream_dict['satisfies']
            hoef_e = stream_dict['hoef']
            patterns = stream_dict['patterns']
            # print("Batch No: " + str(batch_count) + ", Temp Hoef Bound: " + str(hoef_e))

            if not is_ok:
                batch_size = batch_size + batch_step
            else:
                output += "--- START ---\n"
                output += ("Batch No: " + str(batch_count) + "\n")
                output += ("Batch size: " + str(batch_size) + "\n")
                output += ("Hoef Bound: " + str(hoef_e) + "\n")
                output += "Minimum support: " + str(min_sup) + '\n'
                output += "Number of cores: " + str(num_cores) + '\n'
                output += str("\nFile: " + f_path + '\n')
                if dev:
                    tabulated_res = analyze_gps(f_path, min_sup, patterns)
                    output += (str(tabulated_res) + "\n")
                else:
                    for gp in patterns:
                        output += (str(gp.to_string()) + ": " + str(gp.support) + ", " + str(gp.appearance_count) + "\n")
                output += "--- END ---\n\n"

                batch_count += 1
                batch_size = min_batch_size
                buffer = []
                print("Batch " + str(batch_count) + " completed\n")
            # print(output)
    return output


def process_batch_gps(batch, min_sup, confidence, max_hoef):
    """--- method description ---"""

    hoef_bounds = []
    is_ok = True
    d_set = DataGP(batch, min_sup)
    d_set.fit_bitmap()
    n = d_set.attr_size
    total_pair_count = int(n * (n - 1.0) / 2.0)
    delta = 1 - confidence

    # print(batch)
    # print(total_pair_count)
    for gi_bin in d_set.valid_bins:
        sum_plus = np.sum(np.triu(gi_bin[1]))
        # sum_minus = total_pair_count - sum_plus
        # diff = abs(sum_plus - sum_minus)
        diff = abs((2*sum_plus) - total_pair_count)

        # Compute Hoeffding Bound
        # hoef_bound = sqrt((R^2 * ln(1/δ)) / (2 * n)): R=max(sups)-min(sups); n=batch * (batch-1)/2; δ=1-confidence
        # so we compute R (the maximum possible difference between class proportions/gradual items)
        r = (diff / total_pair_count)
        h_bound = math.sqrt((r * r * np.log(1 / delta)) / (n * (n - 1)))
        hoef_bounds.append(h_bound)
        if h_bound > max_hoef:
            is_ok = False
        # print(gi_bin[0])
        # print(sum_plus)
        # print(gi_bin[1])
        # print(h_bound)
        # print("\n")

    if is_ok:
        extracted_gps = extract_gps(batch, min_sup)
    else:
        extracted_gps = []
    return {'satisfies': is_ok, 'hoef': hoef_bounds, 'patterns': extracted_gps}


def extract_gps(batch, min_supp):
    stream_gps = []
    mine_obj = GRAANK(data_source=batch, min_sup=min_supp, eq=False)
    mine_obj.discover()

    sum_sup = 0
    max_sup = 0
    min_sup = 1
    for gp in mine_obj.gradual_patterns:
        str_gp = StreamGP()
        str_gp.gradual_items = gp.gradual_items
        str_gp.support = gp.support
        str_gp.freq_count = gp.freq_count
        str_gp.appearance_count = 1
        # str_gp.total_count = 0

        # for pat in stream_gps:
        #    result1 = set(str_gp.get_pattern()) == set(pat.get_pattern())
        #    result2 = set(str_gp.inv_pattern()) == set(pat.get_pattern())
        #    result3 = set(str_gp.get_pattern()).issubset(set(pat.get_pattern()))
        #    result4 = set(str_gp.inv_pattern()).issubset(set(pat.get_pattern()))
        #    if result1 or result2 or result3 or result4:
        #        pat.appearance_count += 1
        min_sup = gp.support if gp.support < min_sup else min_sup
        max_sup = gp.support if gp.support > max_sup else max_sup

        exists = str_gp.is_duplicate(stream_gps)
        if not exists:
            stream_gps.append(str_gp)
            sum_sup += gp.support
    return stream_gps


""" NOT USED (for now)
def compare_gps(curr_gps, prev_gps):
    sum_sup = 0
    for gp in curr_gps:
        sum_sup += gp.support
        # Pattern exists in previous (maybe a subset in prev_gps)
        if not gp.check_am(prev_gps, subset=True):
            # if len(prev_gps) > 0:
            #    gp.total_count = prev_gps[0].total_count
            prev_gps.append(gp)
    mean_curr = (sum_sup / len(curr_gps) if sum_sup > 0 else 0)

    sum_sup = 0
    for gp in prev_gps:
        sum_sup += gp.support
        # Pattern exists in current (maybe a subset in curr_gps)
        # gp.total_count += 1
        if gp.check_am(curr_gps, subset=True):
            gp.appearance_count += 1
    mean_prev = (sum_sup / len(prev_gps) if sum_sup > 0 else 0)

    return prev_gps, mean_prev, mean_curr
"""
