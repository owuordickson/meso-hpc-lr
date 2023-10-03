
ssh owuord@muse-login.hpc-lr.univ-montp2.fr

scp -r owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/res_\* x_Projects/meso-hpc-lr/results

scp -r x_Projects/meso-hpc-lr/test_data/AirQualityUCI_1K.csv owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/data/

scp -r x_Projects/meso-hpc-lr/hpc@lr/swarmgp1.sh owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/


1. Create a virtual environment using your desired version of Python:
    python3.8 -m venv owuor_env

2. Activate the virtual environment:
    source owuor_env/bin/activate

3. Install/Uninstall packages:
    pip install numpy

4. Deactivate the environment by simply entering:
    deactivate

5. Activating the virtual environment in a job
    If you want to run a Python script called main.py on the Slurm cluster, 
    the bash script for submitting your job (usually called submit.sh) should include the following commands.

    source owuor_env/bin/activate
    python main.py
    deactivate


python spectral_gp/src/main.py -a 'clugrad' -k 1 -f data/breast_cancer.csv -e 0.8
python spectral_gp/src/main.py -a 'clugrad' -k 1 -f data/air_quality.csv -e 0.8
python spectral_gp/src/main.py -a 'clugrad' -k 1 -f data/c2k.csv -e 0.8
python spectral_gp/src/main.py -a 'clugrad' -k 1 -f data/directio15k.csv -e 0.8
python spectral_gp/src/main.py -a 'clugrad' -k 1 -f data/aps_16k.csv -e 0.95