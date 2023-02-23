# -*- coding: utf-8 -*-

# Configurations for Gradual Patterns:
ALGORITHM = 'clugrad'  # clugrad or acograd or graank
MIN_SUPPORT = 0.5
CPU_CORES = 1  # Depends on your computer

# DATASET = "../../data/DATASET.__init__"
# DATASET = "../../data/hcv_data.csv"

# Uncomment for Main:
# DATASET = "../data/DATASET.csv"
# DATASET = '../data/breast_cancer.csv'
# DATASET = '../data/air_quality.csv'
# DATASET = '../data/aps_01k.csv'
# DATASET = '../data/air_quality1k.csv'
# DATASET = '../data/power_consumption19k.csv'
# DATASET = '../data/c2k.csv'
# DATASET = '../data/directio15k.csv'


# Uncomment for Terminal:
# DATASET = "data/DATASET.csv"
DATASET = 'data/air_quality1k.csv'

# ACO-GRAD Configurations:
EVAPORATION_FACTOR = 0.5
MAX_ITERATIONS = 500

# Clustering Configurations
CLUSTER_ALGORITHM = 'kmeans'  # kmeans / agglo / spectral / birch / dbscan
ERASURE_PROBABILITY = 0.9  # determines the number of pairs to be ignored
SCORE_VECTOR_ITERATIONS = 2  # maximum iteration for score vector estimation
