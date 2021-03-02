#!/bin/bash
#
#SBATCH --job-name=aco-v7
#SBATCH --output=res_acogradv7.txt
#SBATCH -n 28
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2
# python3 ant_h5/src/init_acograd_v4.py -f data/c2k.csv -c 14 -s 0.6
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption116k.csv -c 14 -s 0.6
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption500k.csv -c 14 -s 0.6

# python3 ant_h5/src/init_acograd_v5.py -f data/c2k.csv -c 14 -s 0.6
# python3 ant_h5/src/init_acograd_v5.py -f data/UCI_household_power_consumption116k.csv -c 14 -s 0.6
python3 ant_h5/src/init_acograd_v7.py -f data/UCI_household_power_consumption500k.csv -c 28 -s 0.9
