#!/bin/bash
#
#SBATCH --job-name=border
#SBATCH --output=res_border.txt
#SBATCH -n 10
#SBATCH --time=03:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 trenc/init_bordertgraank.py -f data/ICU_household_power_consumption5k.csv -m 10
