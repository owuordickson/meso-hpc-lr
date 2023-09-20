# Configurations for Gradual Patterns:
ALGORITHM = 'onagrad'  # onagrad or clugrad or acograd or graank
MIN_SUPPORT = 0.6
CPU_CORES = 1  # Depends on your computer

# Dataset Selection
# DATASET = "../../data/DATASET.csv"
# DATASET = "../../data/hcv_data.csv"

# Uncomment for Main:
# DATASET = "../data/DATASET.csv"
# DATASET = '../data/breast_cancer.csv'
# DATASET = '../data/air_quality.csv'
# DATASET = '../data/aps_01k.csv'
# DATASET = '../data/air_quality1k.csv'
DATASET = '../data/power_consumption19k.csv'
# DATASET = '../data/c2k.csv'
# DATASET = '../data/directio15k.csv'

# Uncomment for Terminal:
# DATASET = "data/DATASET.csv"

# TinyGP Configurations
MIN_BATCH_SIZE = 10
BATCH_STEP = 1
MAX_HOEF_BOUND = 0.005
CONFIDENCE = 0.95
