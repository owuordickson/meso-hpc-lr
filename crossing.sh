#!/bin/bash
#
#SBATCH --job-name=crossing
#SBATCH --output=res_x.txt
#SBATCH --cpus-per-task=28
#SBATCH --time=1:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 crossing/src/init_fuzztx_csv.py -a 0 -f 'data/GPS_site8.csv,data/Omnidir_site8.csv'
