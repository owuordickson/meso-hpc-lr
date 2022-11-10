# -*- coding: utf-8 -*-
"""

@author: "Dickson Owuor"
@created: "13 Oct 2022"
Usage:
    $python main.py -f ../data/DATASET.csv -s 0.5
Description:
    f -> file path (CSV)
    s -> minimum support
    a -> algorithm

"""

import sys
from optparse import OptionParser
# import so4gp


import config as cfg

if __name__ == "__main__":
    if not sys.argv:
        filePath = sys.argv[0]
        minSup = sys.argv[1]
        algChoice = sys.argv[2]
        numCores = sys.argv[3]
    else:
        optparser = OptionParser()
        optparser.add_option('-f', '--inputFile',
                             dest='file',
                             help='path to file containing csv',
                             default=cfg.DATASET,
                             type='string')
        optparser.add_option('-s', '--minSupport',
                             dest='minSup',
                             help='minimum support value',
                             default=cfg.MIN_SUPPORT,
                             type='float')
        optparser.add_option('-a', '--algorithmChoice',
                             dest='algChoice',
                             help='select algorithm for clustering',
                             default=cfg.ALGORITHM,
                             type='string')
        optparser.add_option('-c', '--cores',
                             dest='numCores',
                             help='number of cores',
                             default=cfg.CPU_CORES,
                             type='int')
        (options, args) = optparser.parse_args()

        if options.file is None:
            print("Usage: $python3 main.py -f filename.csv -a 'lblgrad'")
            sys.exit('System will exit')
        else:
            filePath = options.file
        minSup = options.minSup
        algChoice = options.algChoice
        numCores = options.numCores

    import time
    from memory_profiler import memory_usage
    from pkg_algorithms import aco_graank, graank, label_gp
    from pkg_algorithms.so4gp import analyze_gps, write_file

    if algChoice == 'lblgp':
        # LBL-GP

        start = time.time()
        lgp = label_gp.LabelGP(filePath, min_supp=minSup)
        end = time.time()
        wr_text = "Labels successfully generated\n"
        wr_text += ("Labels Run-time: " + str(end - start) + " seconds\n")
        wr_text += "\n\n"

        # --------------------------------------------------------

        start = time.time()
        mineObj = label_gp.LabelGRITE(lgp, min_supp=minSup)
        res_text, est_gps = label_gp.execute(filePath, mineObj, numCores)
        end = time.time()
        # mem_usage = memory_usage((label_gp.execute, (filePath, mineObj, numCores)), interval=10)
        sup = minSup/2
        res_compare = analyze_gps(filePath, sup, est_gps, approach='dfs')

        wr_text += ("Mining Run-time: " + str(end - start) + " seconds\n")
        # wr_text += ("Memory Usage (MiB): " + str(mem_usage) + " \n")
        wr_text += str(res_text)
        wr_text += "\n\n Analysis of estimated GPs\n"
        wr_text += str(res_compare)
        f_name = str('res_lbl' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=True)
        print(wr_text)
    elif algChoice == 'acogra':
        # ACO-GRAANK
        start = time.time()
        res_text = aco_graank.execute(filePath, minSup, numCores, cfg.EVAPORATION_FACTOR, cfg.MAX_ITERATIONS)
        end = time.time()
        mem_usage = memory_usage((aco_graank.execute, (filePath, minSup, numCores, cfg.EVAPORATION_FACTOR,
                                                       cfg.MAX_ITERATIONS)), interval=10)

        wr_text = ("Run-time: " + str(end - start) + " seconds\n")
        wr_text += ("Memory Usage (MiB): " + str(mem_usage) + " \n")
        wr_text += str(res_text)
        f_name = str('res_aco' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=False)
        print(wr_text)
    elif algChoice == 'graank':
        # GRAANK
        start = time.time()
        res_text = graank.execute(filePath, minSup, numCores)
        end = time.time()
        mem_usage = memory_usage((graank.execute, (filePath, minSup, numCores)), interval=10)

        wr_text = ("Run-time: " + str(end - start) + " seconds\n")
        wr_text += ("Memory Usage (MiB): " + str(mem_usage) + " \n")
        wr_text += str(res_text)
        f_name = str('res_graank' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=False)
        print(wr_text)
    else:
        print("Invalid Algorithm Choice!")
