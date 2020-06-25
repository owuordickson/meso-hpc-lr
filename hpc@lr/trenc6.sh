#!/bin/bash
#
#SBATCH --job-name=trenc
#SBATCH --output=res_trenc.txt
#SBATCH -n 56
#SBATCH --time=72:00:00
#SBATCH --partition=muse-smp
#SBATCH --account=testowuord
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 emerging/src/init_trenc.py -f data/Directio_site6k.csv -m 56 -s 0.6
python3 emerging/src/init_trenc.py -f data/Directio_site6k.csv -m 56 -s 0.7
python3 emerging/src/init_trenc.py -f data/Directio_site6k.csv -m 56 -s 0.8
python3 emerging/src/init_trenc.py -f data/Directio_site6k.csv -m 56 -s 0.9
