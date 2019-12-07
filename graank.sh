#!/bin/bash
#
#SBATCH --job-name=graank
#SBATCH --output=res_graank.txt
#SBATCH --cpus-per-task=28
#SBATCH --time=1:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_graank.py -f data/Omnidir_site8.csv
