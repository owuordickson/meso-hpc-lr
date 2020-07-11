#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_acolcm.txt
#SBATCH -n 10
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 10 -s 0.5
