#!/bin/bash
#
#SBATCH --job-name=lcm-all
#SBATCH --output=res_lcmall.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2

# ACO-LCM 1
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 2
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 3
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 4
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# ACO-LCM 8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k_02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9





# LCM 1
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 2
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 3
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 4
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9

# LCM 8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/Directio_site02k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/UCI_household_power_consumption1k.csv -c 14 -s 0.9
