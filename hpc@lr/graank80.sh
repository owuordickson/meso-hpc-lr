#!/bin/bash
#
#SBATCH --job-name=graank
#SBATCH --output=res_graank.txt
#SBATCH -n 28
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_graank.py -f data/ICU_household_power_consumption80k.csv -c 28
