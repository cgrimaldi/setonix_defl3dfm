#!/bin/bash -l
#SBATCH --job-name=ScottReef
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=4-00:00:00
#SBATCH --partition=long


module use /software/projects/pawsey0106/cgrimaldi/setonix/2023.08/modules/zen3/gcc/12.2.0
module load intel-oneapi-mpi/2021.7.1-3twpgcv
module load singularity/4.1.0
export SINGULARITY_BINDPATH=/scratch,/software
export SINGULARITYENV_LD_LIBRARY_PATH=$I_MPI_ROOT/lib:$I_MPI_ROOT/lib/release:$I_MPI_ROOT/libfabric/lib
unset SINGULARITYENV_LD_PRELOAD
export SINGULARITYENV_APPEND_PATH=$I_MPI_ROOT/bin
export OMP_NUM_THREADS=32
./run_singularity.sh
