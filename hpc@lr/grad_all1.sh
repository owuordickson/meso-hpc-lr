#!/bin/bash
#
#SBATCH --job-name=grad-all
#SBATCH --output=res_gradall.txt
#SBATCH -n 14
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acograd.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acograd.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/init_acograd.py -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/init_acograd.py -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/init_acograd.py -f data/c2k.csv -c 14 -s 0.8

python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_graank.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/init_graank.py -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/init_graank.py -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/init_graank.py -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/init_graank.py -f data/c2k.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_acolcm.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/init_acolcm.py -f data/c2k.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/breast_cancer.csv -c 14 -s 0.9

python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 14 -s 0.5
python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 14 -s 0.6
python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 14 -s 0.7
python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 14 -s 0.8
python3 ant/src/init_lcmgrad.py -f data/c2k.csv -c 14 -s 0.9
