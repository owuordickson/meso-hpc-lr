#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_acograd.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acograd.py -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.8
