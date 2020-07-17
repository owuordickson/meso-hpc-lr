#!/bin/bash
#
#SBATCH --job-name=lcmgrad
#SBATCH --output=res_lcmgrad.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_lcmgrad.py -f data/c2k_02k.csv -c 14 -s 0.9
python3 ant/src/init_lcmgrad.py -f data/c2k_02k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/c2k_02k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/c2k_02k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/c2k_02k.csv -c 14 -s 0.8
