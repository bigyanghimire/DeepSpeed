#!/bin/bash
#SBATCH --job-name=deepspeed-conda
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=256G
#SBATCH --time=04:00:00
#SBATCH --output=deepspeed-conda-slurm-%j.output
#SBATCH --error=deepspeed-conda-slurm-%j.err

module load cuda/11.8.0
module load anaconda3

# -------------------------------------------------------

conda install -n base -c conda-forge mamba -y

# -------------------------------------------------------
mamba env create -n deepspeed -f ../environment.yml --force

echo "Environment creation complete."
