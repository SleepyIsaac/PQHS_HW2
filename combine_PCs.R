pca <- read.table("pca_all_chr.eigenvec", header=FALSE)
colnames(pca) <- c("FID", "IID", paste0("PC", 1:10))
pheno <- read.table("CaseControlStudy.txt", header=TRUE)
merged <- merge(pca[, 1:7], pheno[, c("IID", "Study")], by="IID")

write.table(merged[, c("FID", "IID", "Study", "PC1", "PC2", "PC3", "PC4", "PC5")],
            file="final_covariates.txt", quote=FALSE, row.names=FALSE)
