#!/bin/bash
#
#SBATCH --job-name=trenc
#SBATCH --output=res_trenc.txt
#SBATCH -n 112
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 emerging/src/init_trenc.py -f data/ICU_household_power_consumption116k.csv -m 112 -s 0.5
