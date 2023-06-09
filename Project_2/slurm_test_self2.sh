#!/bin/bash
#SBATCH --partition=SCSEGPU_M2
#SBATCH --qos=q_dmsai
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --mem=2G
#SBATCH --job-name=MyTest2
#SBATCH --output=output_%x_%j.out
#SBATCH --error=error_%x_%j.err

CONFIG=$1
CHECKPOINT=$2

module load anaconda/anaconda3
eval "$(conda shell.bash hook)"
conda activate msai_acv
python tools/test.py ${CONFIG} ${CHECKPOINT}