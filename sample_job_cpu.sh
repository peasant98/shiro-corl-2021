#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=03-23
#SBATCH --partition=shas      
#SBATCH --qos=long
#SBATCH --output=sample-%j.out

module load singularity/3.6.4

# the below line is an example
singularity exec --bind /projects/mast4878/shiro-corl-2021:/shiro-corl-2021 shiro.simg bash /shiro-corl-2021/run_container_supercomputer.sh