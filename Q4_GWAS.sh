#!/bin/bash
#SBATCH -p markov_cpu
#SBATCH -c 8 
#SBATCH --mem 20G
#SBATCH --job-name Q4_GWAS
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yxz3103@case.edu 
#SBATCH -e Q4_GWAS.err

./../HW-Programs/plink --bfile HW2_All \
      --pheno CaseControlStudy.txt \
      --pheno-name disX \
      --covar final_covariates.txt \
      --covar-name Study,PC1,PC2,PC3,PC4,PC5 \
      --logistic hide-covar \
      --maf 0.05 \
      --allow-no-sex \
      --out gwas_final
