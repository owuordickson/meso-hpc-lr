# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@created: "18 Aug 2023"
Usage:
    $python main.py -f ../data/DATASET.csv -s 0.5
Description:
    f -> file path (CSV)
    s -> minimum support
    a -> clustering algorithm
    e -> erasure probability
    i -> maximum iteration
"""

import json
import time
from memory_profiler import memory_usage
from pkg_algorithms.clu_grad import ClusterGP
from config_loader import load, alg_names, clus_alg_names
from pkg_algorithms.so4gp_update import AntGRAANK, GRAANK, get_num_cores, analyze_gps, write_file

if __name__ == "__main__":

    options, config = load()
    filePath = options.file
    minSup = options.minSup
    algChoice = options.algChoice
    eProb = options.eProb
    itScoreMax = options.itMax
    clusterAlg = options.clusterAlg
    numCores = options.numCores

    # Ant Colony Optimization
    eVap = float(config.get('ant_colony', 'evaporation_factor'))
    itMax = int(config.get('ant_colony', 'max_iterations'))

    alg_options = {
        '1': ClusterGP(filePath, minSup, max_iter=itScoreMax, e_prob=eProb),
        '2': AntGRAANK(filePath, minSup, max_iter=itMax, e_factor=eVap),
        '3': GRAANK(filePath, minSup)
    }

    alg = alg_options.get(str(algChoice))
    alg_name = alg_names.get(str(algChoice))

    try:
        if numCores > 1:
            num_cores = numCores
        else:
            num_cores = get_num_cores()

        start = time.time()
        res = alg.discover(algorithm=clusterAlg)
        duration = time.time() - start
        mem_use = memory_usage((alg.discover, (clusterAlg,)), interval=10)
        # mem_use=memory_usage((clu_grad.execute, (filePath, minSup, eProb, itMax, clusterAlg, numCores)), interval=10)

        json_res = json.loads(res)
        list_gp = alg.gradual_patterns
        wr_line = ("Run-time: " + str(duration) + " seconds\n")
        wr_line += ("Memory Usage (MiB): " + str(mem_use) + " \n")

        wr_line += str('Algorithm: %s' % json_res['Algorithm']) + "\n"
        wr_line += "No. of (dataset) attributes: " + str(alg.col_count) + '\n'
        wr_line += "No. of (dataset) objects: " + str(alg.row_count) + '\n'

        if alg_name == 'clugrad':
            wr_line += "Erasure probability: " + str(eProb) + '\n'
            wr_line += "Score vector iterations: " + str(itScoreMax) + '\n'
            wr_line += "Clustering Algorithm: " + str(clus_alg_names.get(str(clusterAlg))) + '\n'
        elif alg_name == 'acograd':
            wr_line += "Evaporation factor: " + str(eVap) + '\n'
            wr_line += "Number of iterations: " + str(itMax) + '\n'
        elif alg_name == 'graank':
            pass
        else:
            pass

        wr_line += "Minimum support: " + str(minSup) + '\n'
        wr_line += "Number of cores: " + str(num_cores) + '\n'
        wr_line += "Number of patterns: " + str(len(list_gp)) + '\n'

        for txt in alg.titles:
            try:
                wr_line += (str(txt.key) + '. ' + str(txt.value.decode()) + '\n')
            except AttributeError:
                wr_line += (str(txt[0]) + '. ' + str(txt[1].decode()) + '\n')

        wr_line += str("\nFile: " + filePath + '\n')
        wr_line += str("\nPattern : Support" + '\n')

        for gp in list_gp:
            wr_line += (str(gp.to_string()) + ' : ' + str(round(gp.support, 3)) + '\n')

        if alg_name == 'clugrad':
            res_compare = analyze_gps(filePath, minSup, alg.gradual_patterns)
            wr_line += str(res_compare)
        f_name = str('res_' + str(alg_name) + str(start).replace('.', '', 1) + '.txt')
        write_file(wr_line, f_name, wr=True)
        # print(wr_line)

    except ArithmeticError as error:
        wr_line = "Failed: " + str(error)
        print(error)
