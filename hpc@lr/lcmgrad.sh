#!/bin/bash
#
#SBATCH --job-name=lcmgrad
#SBATCH --output=res_lcmgrad.txt
#SBATCH -n 10
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 10 -s 0.5

python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 10 -s 0.5
