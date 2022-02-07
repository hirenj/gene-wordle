if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biomaRt")

library(biomaRt)
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")
x<-getBM(attributes= "hgnc_symbol", mart=ensembl)


#not much logic to this, but get rid of gene with a '-'
filteredGenes<-x[!grepl("-", x$hgnc_symbol),]

#max length 5 letter
filteredGenes5<-filteredGenes[nchar(filteredGenes) <=5]
filteredGenes3to5<-filteredGenes5[nchar(filteredGenes5) > 2]


filteredGenes3to5[nchar(filteredGenes3to5)==4]<-paste0(filteredGenes3to5[nchar(filteredGenes3to5)==4]," ")
filteredGenes3to5[nchar(filteredGenes3to5)==3]<-paste0(filteredGenes3to5[nchar(filteredGenes3to5)==3],"  ")

write.table(paste0("'",tolower(filteredGenes3to5),"'"),file = 'genes.csv',col.names=FALSE, row.names=FALSE, quote=FALSE, eol = ",\r\n\t")
