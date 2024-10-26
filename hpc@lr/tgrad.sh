#!/bin/bash
#
#SBATCH --job-name=TGRAD
#SBATCH --output=res_main.txt
#SBATCH -n 14
#SBATCH --time=576:00:00
#SBATCH --partition=lirmm
#SBATCH --account=pgpm
#SBATCH --mail-user=dickson-odhiambo.owuor@lirmm.fr

module load python/3.9.13
source owuor_env/bin/activate

python tgraank/src/TemporalGP/cli_tgp.py -c 14 -f data/hungary_chickenpox.csv
python tgraank/src/TemporalGP/cli_tgp.py -c 14 -f data/power_consumption10k.csv
python tgraank/src/TemporalGP/cli_tgp.py -c 14 -f data/air_quality.csv
python tgraank/src/TemporalGP/cli_tgp.py -c 14 -f data/directio15k.csv
