# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@created: "16 Mar 2022"
Usage:
    $python main.py -f ../data/DATASET.csv -s 0.5
Description:
    f -> file path (CSV)
    s -> minimum support
    a -> clustering algorithm
    e -> erasure probability
    i -> maximum iteration
"""

import sys
# import so4gp
from pkg_algorithms.so4gp_update import DataGP, write_file
from optparse import OptionParser
import config as cfg


def compare_gps(file, min_sup,  est_gps):
    d_set = DataGP(file, min_sup)
    d_set.fit_bitmap()  # d_set.init_attributes()
    wr_line = "\n\nComparison : Estimated Support, True Support" + '\n'
    for est_gp in est_gps:
        est_sup = est_gp.support
        est_gp.set_support(0)
        true_gp = est_gp.validate_graank(d_set)  # so4gp.validategp(d_set, est_gp)
        true_sup = true_gp.support
        # if true_sup == 0:
        #    true_sup = -1
        if len(true_gp.gradual_items) == len(est_gp.gradual_items):
            wr_line += (str(est_gp.to_string()) + ' : ' + str(round(est_sup, 3)) + ', ' + str(round(true_sup, 3)) + '\n')
        else:
            wr_line += (str(est_gp.to_string()) + ' : ' + str(round(est_sup, 3)) + ', -1\n')
    return wr_line


if __name__ == "__main__":
    if not sys.argv:
        filePath = sys.argv[0]
        minSup = sys.argv[1]
        algChoice = sys.argv[2]
        eProb = sys.argv[3]
        itMax = sys.argv[4]
        clusterAlg = sys.argv[5]
        numCores = sys.argv[6]
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
                             help='select GP algorithm',
                             default=cfg.ALGORITHM,
                             type='string')
        optparser.add_option('-e', '--eProb',
                             dest='eProb',
                             help='erasure probability',
                             default=cfg.ERASURE_PROBABILITY,
                             type='float')
        optparser.add_option('-i', '--maxIteration',
                             dest='itMax',
                             help='maximum iteration for score vector estimation',
                             default=cfg.SCORE_VECTOR_ITERATIONS,
                             type='int')
        optparser.add_option('-k', '--clusteringAlgorithm',
                             dest='clusterAlg',
                             help='select clustering algorithm',
                             default=cfg.CLUSTER_ALGORITHM,
                             type='string')
        optparser.add_option('-c', '--cores',
                             dest='numCores',
                             help='number of cores',
                             default=cfg.CPU_CORES,
                             type='int')
        (options, args) = optparser.parse_args()

        if options.file is None:
            print("Usage: $python3 main.py -f filename.csv -a 'clugrad'")
            sys.exit('System will exit')
        else:
            filePath = options.file
        minSup = options.minSup
        algChoice = options.algChoice
        eProb = options.eProb
        itMax = options.itMax
        clusterAlg = options.clusterAlg
        numCores = options.numCores

    import time
    from pkg_algorithms import clu_grad_v2

    if algChoice == 'clugrad':
        # CLU-GRAD
        start = time.time()
        res_text, gps = clu_grad_v2.execute(filePath, minSup, eProb, itMax, clusterAlg, numCores)
        end = time.time()
        mem_usage = ""
        # = memory_usage((clu_grad.execute, (filePath, minSup, eProb, itMax, clusterAlg, numCores)), interval=10)
        res_compare = compare_gps(filePath, minSup, gps)

        wr_text = ("Run-time: " + str(end - start) + " seconds\n")
        wr_text += ("Memory Usage (MiB): " + str(mem_usage) + " \n")
        wr_text += str(res_text)
        wr_text += str(res_compare)
        f_name = str('res_clu' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=True)
        print(wr_text)
    else:
        print("Invalid Algorithm Choice!")