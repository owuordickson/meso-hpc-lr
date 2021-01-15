#!/bin/bash
#
#SBATCH --job-name=graank-all
#SBATCH --output=res_graankall.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2

# ACO-GRAANK 1
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 2
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 3
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 4
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-GRAANK 8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9


# GRAANK 1
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 2
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 3
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 4
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# GRAANK 8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9
