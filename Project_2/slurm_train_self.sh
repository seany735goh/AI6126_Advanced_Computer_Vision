#!/bin/bash
#SBATCH --partition=SCSEGPU_M1
#SBATCH --qos=q_amsai
#SBATCH --nodes=1
#SBATCH --gres=gpu:2
#SBATCH --mem=4G
#SBATCH --job-name=MyJob
#SBATCH --output=output_%x_%j.out
#SBATCH --error=error_%x_%j.err

CONFIG=$1


module load anaconda/anaconda3
eval "$(conda shell.bash hook)"
conda activate msai_acv
python tools/train.py ${CONFIG} --resume
