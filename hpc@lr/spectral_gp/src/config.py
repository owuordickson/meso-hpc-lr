# -*- coding: utf-8 -*-

# Configurations for Gradual Patterns:
ALGORITHM = 'clugrad'  # clugrad or acograd or graank
MIN_SUPPORT = 0.5
CPU_CORES = 1  # Depends on your computer

# DATASET = "../../data/DATASET.csv"
# DATASET = "../../data/hcv_data.csv"

# Uncomment for Main:
# DATASET = "../data/DATASET.csv"
DATASET = '../data/breast_cancer.csv'
# DATASET = '../data/air_quality.csv'
# DATASET = '../data/air_quality1k.csv'
# DATASET = '../data/power_consumption19k.csv'
# DATASET = '../data/c2k.csv'
# DATASET = '../data/directio15k.csv'


# Uncomment for Terminal:
# DATASET = "data/DATASET.csv"

# ACO-GRAD Configurations:
EVAPORATION_FACTOR = 0
MAX_ITERATIONS = 500

# Clustering Configurations
CLUSTER_ALGORITHM = 'kmeans'  # selects algorithm to be used for clustering the net-win matrices
ERASURE_PROBABILITY = 0  # determines the number of pairs to be ignored
SCORE_VECTOR_ITERATIONS = 2  # maximum iteration for score vector estimation
