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

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hungary_chickenpox.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/air_quality.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/aps_2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/breast_cancer.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/c2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/directio8k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hcv_data.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/Omnidir_site2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/power_consumption10k.csv




python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hungary_chickenpox.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/air_quality.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/aps_2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/breast_cancer.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/c2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/directio8k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hcv_data.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/Omnidir_site2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/power_consumption10k.csv






python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hungary_chickenpox.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/air_quality.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/aps_2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/breast_cancer.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/c2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/directio8k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hcv_data.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/Omnidir_site2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/power_consumption10k.csv





python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hungary_chickenpox.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hungary_chickenpox.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/air_quality.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/air_quality.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/aps_2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/aps_2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/breast_cancer.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/breast_cancer.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/c2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/c2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/directio8k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/directio8k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/hcv_data.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/hcv_data.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/Omnidir_site2k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/Omnidir_site2k.csv

python3 swarm_gp/src/main.py -a 'ga' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pso' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'pls' -c 14 -f data/power_consumption10k.csv
python3 swarm_gp/src/main.py -a 'prs' -c 14 -f data/power_consumption10k.csv
