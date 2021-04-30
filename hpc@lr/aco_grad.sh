#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_acograd.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5



python3 ant/src/algorithms/aco/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/aco/init_acograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/ga/init_gagrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/ga/init_gagrad.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5

python3 ant/src/algorithms/pso/init_psograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/Directio_site15k.csv -c 14 -s 0.5
python3 ant/src/algorithms/pso/init_psograd.py -f data/UCI_household_power_consumption50k.csv -c 14 -s 0.5
