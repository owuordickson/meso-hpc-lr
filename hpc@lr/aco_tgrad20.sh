#!/bin/bash
#
#SBATCH --job-name=aco-temporal
#SBATCH --output=res_acot.txt
#SBATCH -n 28
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acotgrad.py -f data/Omnidir_site20k.csv
