library(Libra)
library(DESeq2)
library(cowplot)
library(dplyr)

# Setting 
data <- readRDS("PhD_test_obj.rds")

# Run the differential expression test
DE = run_de(data$count, meta = data$metadata)
print(colnames(DE))
significant_rows <- DE[DE$p_val < 0.05, ]   
print(significant_rows)  