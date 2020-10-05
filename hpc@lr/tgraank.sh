#!/bin/bash
#
#SBATCH --job-name=temporal
#SBATCH --output=res_temp.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.5 -r 0.9
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.6 -r 0.9
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.7 -r 0.9
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.8 -r 0.9
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.9

python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.5
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.6
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.7
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.8
python3 ant/src/init_tgraank.py -f data/UCI_household_power_consumption10k.csv -s 0.9 -r 0.9
