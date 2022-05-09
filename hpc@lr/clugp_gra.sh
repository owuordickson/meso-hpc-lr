#!/bin/bash
#
#SBATCH --job-name=CLU-GP
#SBATCH --output=res_graank0905.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 spectral_gp/src/main.py -a 'graank' -c 14 -f data/directio15k.csv
python3 spectral_gp/src/main.py -a 'graank' -c 14 -f data/power_consumption50k.csv
