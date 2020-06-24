#!/bin/bash
#
#SBATCH --job-name=graank
#SBATCH --output=res_graank.txt
#SBATCH -n 112
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_graank.py -f data/ICU_household_power_consumption116k.csv -c 112 -s 0.8
