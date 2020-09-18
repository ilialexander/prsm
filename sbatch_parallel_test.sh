#!/bin/bash
#SBATCH --partition=bgfsqdr
#SBATCH --job-name=paralle_rsm
#SBATCH --time=00:01:00
#SBATCH --output=test_results.%j
#SBATCH --nodes=1-1
#SBATCH --ntasks=2
#SBATCH --mem=4096

module load apps/matlab/r2019b

date

matlab -nodisplay -nosplash -r "run('parallel_test')"

date


