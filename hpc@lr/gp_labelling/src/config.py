# -*- coding: utf-8 -*-

# Configurations for Gradual Patterns:
ALGORITHM = 'lblgp'  # lblgp or acogra or graank
MIN_SUPPORT = 0.5  # 0.5 (default), 0.2 (b_c), 0.4 (c2k)
CPU_CORES = 1  # Depends on your computer

# DATASET = "../../data/DATASET.csv"
# DATASET = "../../data/hcv_data.csv"

# Uncomment for Main:
DATASET = "../data/DATASET.csv"
# DATASET = '../data/breast_cancer.csv'
# DATASET = '../data/c2k_02k.csv'
# DATASET = '../data/air_quality.csv'
# DATASET = '../data/aps_01k.csv'
# DATASET = '../data/air_quality1k.csv'
# DATASET = '../data/power_consumption19k.csv'
# DATASET = '../data/c2k.csv'
# DATASET = '../data/directio15k.csv'

# Uncomment for Terminal:
# DATASET = "data/DATASET.csv"

# ACO-GRAD Configurations:
EVAPORATION_FACTOR = 0.5
MAX_ITERATIONS = 1
