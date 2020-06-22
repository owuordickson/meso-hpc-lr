#!/bin/bash
#
#SBATCH --job-name=pre-process
#SBATCH --output=res_clean.txt
#SBATCH -n 112
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/cure_file.py -f data/Directio.csv
