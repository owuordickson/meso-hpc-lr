
ssh owuord@muse-login.hpc-lr.univ-montp2.fr

scp -r owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/res_* x_Projects/meso-hpc-lr/results

scp -r x_Projects/meso-hpc-lr/test_data/AirQualityUCI_1K.csv owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/data/

scp -r x_Projects/meso-hpc-lr/hpc@lr/swarmgp1.sh owuord@muse-login.hpc-lr.univ-montp2.fr:~/scratch/


1. Create a virtual environment using your desired version of Python:
    module load python/3.9.13
    python3.9.13 -m venv owuor_env

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
