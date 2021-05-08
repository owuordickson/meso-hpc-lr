#!/bin/bash
#
#SBATCH --job-name=swarm-gp
#SBATCH --output=res_main.txt
#SBATCH -n 28
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.8.2

python3 ant/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/Directio_site6k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/UCI_household_power_consumption19k.csv -c 28 -s 0.5



python3 ant/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/Directio_site6k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/UCI_household_power_consumption19k.csv -c 28 -s 0.5



python3 ant/src/pkg_main/main.py -a 'pso' -f data/breast_cancer.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/c2k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/Directio_site6k.csv -c 28 -s 0.5
python3 ant/src/pkg_main/main.py -a 'pso' -f data/UCI_household_power_consumption19k.csv -c 28 -s 0.5
