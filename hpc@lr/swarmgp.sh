#!/bin/bash
#
#SBATCH --job-name=swarm-gp
#SBATCH --output=res_main.txt
#SBATCH -n 10
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2
python3 swarm_gp/src/main.py -a 'ga'

python3 swarm_gp/src/main.py -a 'pso'

python3 swarm_gp/src/main.py -a 'pls'

python3 swarm_gp/src/main.py -a 'prs'
