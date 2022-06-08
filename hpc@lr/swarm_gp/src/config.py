# -*- coding: utf-8 -*-

# Configurations for Gradual Patterns:
# INITIALIZATIONS = 3
ALGORITHM = 'pls'  # aco, ga, pso, prs, pls
MIN_SUPPORT = 0.5
CPU_CORES = 4

# Uncomment for Main:
DATASET = "../data/DATASET.csv"
# DATASET = "../data/hcv_data.csv"
# DATASET = "../data/hungary_chickenpox.csv"
# DATASET = "../data/AirQualityUCI.csv"
# DATASET = "../data/c2k.csv"

# Uncomment for Terminal:
# DATASET = "data/hcv_data.csv"

# Global Swarm Configurations
MAX_ITERATIONS = 5
MAX_EVALUATIONS = 10
N_VAR = 1  # DO NOT CHANGE

# ACO-GRAD Configurations:
EVAPORATION_FACTOR = 0.5

# GA-GRAD Configurations:
N_POPULATION = 1
PC = 0.1
GAMMA = 0.1  # Cross-over
MU = 0.1  # Mutation
SIGMA = 0.1  # Mutation

# PSO-GRAD Configurations:
VELOCITY = 0.9  # higher values helps to move to next number in search space
PERSONAL_COEFF = 0.01
GLOBAL_COEFF = 0.9
TARGET = 1
TARGET_ERROR = 1e-6
N_PARTICLES = 5

# PLS-GRAD Configurations
STEP_SIZE = 0.5

# VISUALIZATIONS
SHOW_P_MATRIX = False  # ONLY FOR: aco
SHOW_EVALUATIONS = False  # FOR aco, prs, pls, pso
SHOW_ITERATIONS = True  # FOR aco, prs, pls, pso
SAVE_RESULTS = True  # FOR aco, prs, pls, pso

TUNE_VAL = 1
