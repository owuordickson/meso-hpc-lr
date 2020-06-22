#!/bin/bash
#
#SBATCH --job-name=graank
#SBATCH --output=res_graank.txt
#SBATCH -n 10
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_graank_h5.py -f data/Omnidir_site200k.csv -c 10
