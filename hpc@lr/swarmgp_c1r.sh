#!/bin/bash
#
#SBATCH --job-name=swarm-gp
#SBATCH --output=res_main.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.6





# --------------------------------------------------------------------------------
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.7

python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.7





# --------------------------------------------------------------------------------
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.8

python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 14 -s 0.8








# --------------------------------------------------------------------------------
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.9
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/Directio_site15k.csv -c 14 -s 0.9

python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.9

python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 14 -s 0.9
python3 ant_m/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 14 -s 0.9
