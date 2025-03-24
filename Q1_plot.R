assoc <- read.table("gwas_unadjusted.assoc.logistic", header=TRUE)

assoc <- assoc[!is.na(assoc$P), ]

chisq <- qchisq(assoc$P, df=1, lower.tail=FALSE)

lambda <- median(chisq) / qchisq(0.5, df=1)
cat("Genomic control lambda:", lambda, "\n")

pdf("qqplot_adjusted_study.pdf")

observed <- sort(-log10(assoc$P))
expected <- -log10(ppoints(length(observed)))
plot(expected, observed,
     pch=20, cex=0.5,
     xlab="Expected -log10(P)", ylab="Observed -log10(P)",
     main="QQ Plot of GWAS P-values (adjusted study)")
abline(0, 1, col="red")

dev.off()
