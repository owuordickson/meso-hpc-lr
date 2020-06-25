#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_acograd.txt
#SBATCH -n 112
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2
python3 ant/src/init_acograd.py -f data/Directio_site32k.csv -c 112 -s 0.6
python3 ant/src/init_acograd.py -f data/Directio_site32k.csv -c 112 -s 0.7
python3 ant/src/init_acograd.py -f data/Directio_site32k.csv -c 112 -s 0.8
python3 ant/src/init_acograd.py -f data/Directio_site32k.csv -c 112 -s 0.9
