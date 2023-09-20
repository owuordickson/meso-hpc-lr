# -*- coding: utf-8 -*-
"""
@author: "Dickson Owuor"
@created: "06 Jul 2023"
Usage:
    $python main.py -f ../data/DATASET.csv -s 0.5
Description:
    f -> file path (CSV)
    s -> minimum support
    a -> tiny_gp algorithm
"""

import sys
# import so4gp
from pkg_algorithms.so4gp_update import write_file
from optparse import OptionParser
import config as cfg

if __name__ == "__main__":
    if not sys.argv:
        filePath = sys.argv[0]
        minSup = sys.argv[1]
        algChoice = sys.argv[2]
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
        numCores = options.numCores

    import time
    # from memory_profiler import memory_usage
    from pkg_algorithms import ona_grad, graank

    if algChoice == 'onagrad':
        # ONAGRAD
        start = time.time()
        res_text = ona_grad.online_gp(filePath, minSup, cfg.MIN_BATCH_SIZE, cfg.BATCH_STEP, cfg.CONFIDENCE,
                                      cfg.MAX_HOEF_BOUND, numCores, dev=True)
        end = time.time()
        # mem_use = memory_usage((graank.execute, (filePath, minSup, numCores)), interval=10)

        wr_text = "Algorithm: ONA-GRAD \n"
        wr_text += ("Run-time: " + str(end - start) + " seconds\n")
        # wr_text += ("Memory Usage (MiB): " + str(mem_use) + " \n")
        wr_text += str(res_text)
        f_name = str('res_tiny' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=True)
        # print(wr_text)
    elif algChoice == 'graank':
        start = time.time()
        res_text = graank.execute(filePath, minSup, numCores)
        end = time.time()
        # mem_use = memory_usage((graank.execute, (filePath, minSup, numCores)), interval=10)

        wr_text = ("Run-time: " + str(end - start) + " seconds\n")
        # wr_text += ("Memory Usage (MiB): " + str(mem_use) + " \n")
        wr_text += str(res_text)
        f_name = str('res_graank' + str(end).replace('.', '', 1) + '.txt')
        write_file(wr_text, f_name, wr=True)
        # print(wr_text)
    else:
        print("Invalid Algorithm Choice!")
