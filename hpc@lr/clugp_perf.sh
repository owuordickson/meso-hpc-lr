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


python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/aps_16k.csv -e 0.95





python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/aps_16k.csv -e 0.95






python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 1 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 2 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 3 -c 14 -f data/aps_16k.csv -e 0.95

python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/breast_cancer.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/air_quality.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/c2k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/directio15k.csv -e 0.8
python3 spectral_gp/src/main_launcher.py -a 1 -k 4 -c 14 -f data/aps_16k.csv -e 0.95





