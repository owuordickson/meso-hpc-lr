#!/bin/bash
#
#SBATCH --job-name=CLU-GP
#SBATCH --output=res_main1.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 spectral_gp/src/main.py -a 'clugrad' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -c 14 -f data/power_consumption50k.csv -e 0.9
