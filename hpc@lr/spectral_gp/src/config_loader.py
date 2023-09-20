import configparser
import sys
from optparse import OptionParser
from os import path
import pathlib


alg_names = {
            '1': 'clugrad',
            '2': 'acograd',
            '3': 'graank',
}


clus_alg_names = {
            '1': 'Standard KMeans',
            '2': 'PDC DP-Means',    # improved KMeans
            '3': 'Fuzzy CMeans',
            '4': 'PC'  # density-based clustering
}


def load():
    # Load configuration from file
    config_file = pathlib.Path(__file__).parent.absolute() / "options.cfg"
    config = configparser.SafeConfigParser()
    config.read(config_file)
    print(config.sections())

    # Dataset
    datadir = config.get('data', 'datadir')
    dataset = config.get('data', 'dataset')
    file_path = path.join(datadir, dataset)

    # Gradual Patterns
    main_alg = int(config.get('gradual_pattern', 'main_algorithm'))
    min_sup = float(config.get('gradual_pattern', 'minimum_support'))
    cpus = int(config.get('gradual_pattern', 'cpu_cores'))

    # Clustering
    clus_alg = int(config.get('clustering', 'clustering_algorithm'))
    e_prob = float(config.get('clustering', 'erasure_probability'))
    max_score_it = int(config.get('clustering', 'max_vector_score_iterations'))

    # Ant Colony Optimization
    # e_factor = float(config.get('ant_colony', 'evaporation_factor'))
    # max_it = int(config.get('ant_colony', 'max_iterations'))

    optparser = OptionParser()
    optparser.add_option('-f', '--inputFile',
                         dest='file',
                         help='path to file containing csv',
                         default=file_path,
                         type='string')
    optparser.add_option('-s', '--minSupport',
                         dest='minSup',
                         help='minimum support value',
                         default=min_sup,
                         type='float')
    optparser.add_option('-a', '--algorithmChoice',
                         dest='algChoice',
                         help='select GP algorithm',
                         default=main_alg,
                         type='string')
    optparser.add_option('-e', '--eProb',
                         dest='eProb',
                         help='erasure probability',
                         default=e_prob,
                         type='float')
    optparser.add_option('-i', '--maxIteration',
                         dest='itMax',
                         help='maximum iteration for score vector estimation',
                         default=max_score_it,
                         type='int')
    optparser.add_option('-k', '--clusteringAlgorithm',
                         dest='clusterAlg',
                         help='select clustering algorithm',
                         default=clus_alg,
                         type='string')
    optparser.add_option('-c', '--cores',
                         dest='numCores',
                         help='number of cores',
                         default=cpus,
                         type='int')
    (options, args) = optparser.parse_args()

    if options.file is None:
        print("Usage: $python3 main.py -f filename.csv -a 'clugrad'")
        sys.exit('System will exit')

    return options, config
