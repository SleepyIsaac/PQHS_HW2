#!/bin/bash
#SBATCH -p markov_cpu
#SBATCH -c 8 
#SBATCH --mem 20G
#SBATCH --job-name Q1_GWAS
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yxz3103@case.edu 
#SBATCH -e Q1_GWAS.err

./../HW-Programs/plink --bfile HW2_All \
      --pheno CaseControlStudy.txt \
      --pheno-name disX \
      --covar CaseControlStudy.txt \
      --covar-name Study \
      --logistic hide-covar \
      --maf 0.05 \
      --allow-no-sex \
      --out gwas_adjusted_study
