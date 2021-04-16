#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=10:00:00
#SBATCH --partition=sgpu      
#SBATCH --qos=normal
#SBATCH --output=sample-%j.out

module load singularity/3.6.4

# the below line is an example
singularity exec --nv --bind /projects/mast4878/shiro-corl-2021:/shiro-corl-2021 shiro.simg bash /shiro-corl-2021/run_container_supercomputer.sh