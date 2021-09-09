#!/bin/bash
#
#SBATCH --job-name=swarm-gp
#SBATCH --output=res_swarmgp.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/AirQualityUCI_1K.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/AirQualityUCI_1K.csv
