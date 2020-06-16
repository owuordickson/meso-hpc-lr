#!/bin/bash
#
#SBATCH --job-name=aco-grad
#SBATCH --output=res_aco_tgrad.txt
#SBATCH -n 10
#SBATCH --time=72:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.7.2
srun -n 10 python3 ant/src/init_acotgrad_mpi.py -f data/Omnidir_site100k.csv
