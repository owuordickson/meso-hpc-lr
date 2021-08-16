#!/bin/bash
#
#SBATCH --job-name=aco-gp
#SBATCH --output=res_acogp.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv

python3 aco_gp/src/main.py -a 'ga' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pso' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'pls' -c 14 -f data/c2k_06k.csv
python3 aco_gp/src/main.py -a 'prs' -c 14 -f data/c2k_06k.csv
