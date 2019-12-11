#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_acograd.txt
#SBATCH -n 28
#SBATCH --time=03:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acograd.py -f data/x_data15k.csv -c 28
