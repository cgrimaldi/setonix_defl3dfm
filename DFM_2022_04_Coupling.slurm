#!/bin/bash -l
#SBATCH --job-name=JOBname
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --exclusive
#SBATCH --time=24:00:00


module load singularity/3.8.6
module load intel-oneapi-mpi/2021.4.0-3d6azb6
export SINGULARITY_BINDPATH=/scratch,/software
export SINGULARITYENV_LD_LIBRARY_PATH=$I_MPI_ROOT/lib:$I_MPI_ROOT/lib/release:$I_MPI_ROOT/libfabric/lib
unset SINGULARITYENV_LD_PRELOAD
export SINGULARITYENV_APPEND_PATH=$I_MPI_ROOT/bin
export OMP_NUM_THREADS=24
./run_singularity.sh
