# Load eigenvectors
pca <- read.table("pca_all_chr.eigenvec", header=FALSE)
colnames(pca) <- c("FID", "IID", paste0("PC", 1:10))

# Load phenotype (to get study/disease info)
pheno <- read.table("CaseControlStudy.txt", header=TRUE)

# Merge PCA with phenotype
merged <- merge(pca, pheno, by.x="IID", by.y="IID")

# Plot PC1 vs PC2
pdf("pca_PC1_PC2.pdf")
plot(merged$PC1, merged$PC2,
     col=as.factor(merged$Study),
     pch=19,
     xlab="PC1", ylab="PC2",
     main="PC1 vs PC2 by Study")
legend("topright", legend=c("Study 1", "Study 2"), col=1:2, pch=19)
dev.off()

# Plot PC2 vs PC3
pdf("pca_PC2_PC3.pdf")
plot(merged$PC2, merged$PC3,
     col=as.factor(merged$Study),
     pch=19,
     xlab="PC2", ylab="PC3",
     main="PC2 vs PC3 by Study")
legend("topright", legend=c("Study 1", "Study 2"), col=1:2, pch=19)
dev.off()
