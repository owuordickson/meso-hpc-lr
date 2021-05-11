#!/bin/bash
#
#SBATCH --job-name=gps
#SBATCH --output=res_mainc.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.6

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.6



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.6

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.6



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.6

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.6



# --------------------------------------------------------------------------------
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.7

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.7



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.7

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.7



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.7

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.7






# --------------------------------------------------------------------------------
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.8

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.8



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.8

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.8



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.8

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.8







# --------------------------------------------------------------------------------
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.9

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.9



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.9

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.9



python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/c2k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/Directio_site15k.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'graank' -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.9

python3 ant/src/pkg_main/mainc.py -a 'acolcm' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant/src/pkg_main/mainc.py -a 'lcm' -f data/breast_cancer.csv -c 14 -s 0.9
