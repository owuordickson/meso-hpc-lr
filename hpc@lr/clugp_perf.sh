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


python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/aps_2k.csv -e 0.9




python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/aps_2k.csv -e 0.9





python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'kmeans' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'agglo' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'spectral' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'birch' -c 14 -f data/aps_2k.csv -e 0.9

python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/breast_cancer.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/air_quality.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/c2k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio8k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/directio15k.csv -e 0.9
python3 spectral_gp/src/main.py -a 'clugrad' -k 'dbscan' -c 14 -f data/aps_2k.csv -e 0.9




