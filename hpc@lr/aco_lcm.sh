#!/bin/bash
#
#SBATCH --job-name=aco-lcm
#SBATCH --output=res_acolcm.txt
#SBATCH -n 28
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 28 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 28 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 28 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 28 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 28 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k.csv -c 28 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 28 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 28 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 28 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 28 -s 0.9

python3 ant/src/init_acolcm.py -f data/Directio_site15k.csv -c 28 -s 0.5
python3 ant/src/init_acolcm.py -f data/Directio_site15k.csv -c 28 -s 0.6
python3 ant/src/init_acolcm.py -f data/Directio_site15k.csv -c 28 -s 0.7
python3 ant/src/init_acolcm.py -f data/Directio_site15k.csv -c 28 -s 0.8
python3 ant/src/init_acolcm.py -f data/Directio_site15k.csv -c 28 -s 0.9

python3 ant/src/init_acolcm.py -f data/UCI_household_consumption50k.csv -c 28 -s 0.5
python3 ant/src/init_acolcm.py -f data/UCI_household_consumption50k.csv -c 28 -s 0.6
python3 ant/src/init_acolcm.py -f data/UCI_household_consumption50k.csv -c 28 -s 0.7
python3 ant/src/init_acolcm.py -f data/UCI_household_consumption50k.csv -c 28 -s 0.8
python3 ant/src/init_acolcm.py -f data/UCI_household_consumption50k.csv -c 28 -s 0.9
