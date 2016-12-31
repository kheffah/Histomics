# Clear all variables from workspace
rm(list = ls())

# load relevant packages
library(data.table) 

#############################################################################################################################

# Read genomic data
threshold_genes <- fread("/home/mohamed/Desktop/CooperLab_Research/PanCan_Project/Data/all_thresholded.by_genes_whitelisted.tsv");
genes_count = as.data.frame(threshold_genes); #Converted to dataframe

# Read histomic data
histo_all <- fread("/home/mohamed/Desktop/CooperLab_Research/PanCan_Project/Data/Pancan.Slide.Pleo.txt");
histo <- as.data.frame(histo_all) 
colnames(histo)[1] <- "TCGA.ID"#changed column names for uniformity
histo$TCGA.ID <- gsub("TCGA-..-", "", histo$TCGA.ID)#trimmed the patient barcodes to the third field
head(histo)


