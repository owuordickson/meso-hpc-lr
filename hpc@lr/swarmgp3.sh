#!/bin/bash
#
#SBATCH --job-name=lcm-gp
#SBATCH --output=res_lcm.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/aps_5k.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/directio15k.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/Omnidir_site10k.csv
python3 swarm_gp/src/main.py -a 'lcm' -c 14 -f data/power_consumption19k.csv
