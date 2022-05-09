#!/bin/bash
#
#SBATCH --job-name=CLU-GP
#SBATCH --output=res_main.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/breast_cancer.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/air_quality.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/c2k.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/directio15k.csv

python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/breast_cancer.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/air_quality.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/c2k.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/directio15k.csv

python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/breast_cancer.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/air_quality.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/c2k.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/directio15k.csv

python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/breast_cancer.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/air_quality.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/c2k.csv
python3 spectral_gp/src/main.py -a 'acograd' -c 14 -f data/directio15k.csv
