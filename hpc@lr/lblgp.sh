#!/bin/bash
#
#SBATCH --job-name=LBL-GP
#SBATCH --output=res_main.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/breast_cancer.csv -s 0.2
python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/air_quality.csv
python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/c2k.csv
python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/directio8k.csv
python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/directio15k.csv
python3 gp_labelling/src/main.py -a 'lblgp' -c 14 -f data/aps_2k.csv
