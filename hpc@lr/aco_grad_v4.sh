#!/bin/bash
#
#SBATCH --job-name=aco-v4
#SBATCH --output=res_acogradv4.txt
#SBATCH -n 14
#SBATCH --time=288:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2
python3 ant_h5/src/init_acograd_v4.py -f data/c2k.csv -c 14 -s 0.1
python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption10k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption116k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption500k.csv -c 14 -s 0.1

python3 ant_h5/src/init_acograd_v4.py -f data/c2k.csv -c 14 -s 0.1
python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption10k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption116k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption500k.csv -c 14 -s 0.1

python3 ant_h5/src/init_acograd_v4.py -f data/c2k.csv -c 14 -s 0.1
python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption10k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption116k.csv -c 14 -s 0.1
# python3 ant_h5/src/init_acograd_v4.py -f data/UCI_household_power_consumption500k.csv -c 14 -s 0.1