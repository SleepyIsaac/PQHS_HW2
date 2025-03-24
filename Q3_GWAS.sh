#!/bin/bash
#SBATCH -p markov_cpu
#SBATCH -c 8 
#SBATCH --mem 20G
#SBATCH --job-name Q3_GWAS
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yxz3103@case.edu 
#SBATCH -e Q3_GWAS.err

./../HW-Programs/plink --bfile HW2_All \
      --chr 1-22 \
      --exclude range pca_regions.txt \
      --pca 10 \
      --out pca_all_chr
