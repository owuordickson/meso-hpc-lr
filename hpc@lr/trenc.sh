#!/bin/bash
#
#SBATCH --job-name=trenc
#SBATCH --output=res_trenc.txt
#SBATCH -n 28
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 trenc/init_trenc.py -f data/ICU_household_power_consumption15k.csv -m 28
