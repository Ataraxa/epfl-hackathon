library(DESeq2)
library(dplyr)
library(Libra)

# Settings
loaded <- readRDS("classifier/data/epfl/PhD_test_obj.rds")

seurat <- CreateSeuratObject(counts = loaded$count, meta = loaded$metadata)
# seurat[["percent.mt"] <- PercentageFeatureSet(seuat, pattern)]

# # Get pseudobulk matrix
# mat <- to_pseudobulk(data$count, meta = data$metadata)
# dummy <- vector("numeric", length = 27271)
# pseudobulk_matrix <- cbind(dummy)

# cat("Going into post processing! \n")
# for (cell_type in names(mat)) {
#     cat(cell_type)
#     for (replicate in names(mat[[cell_type]]))
#         cat(replicate)
#         pseudobulk_matrix <- cbind(pseudobulk_matrix, mat[[cell_type]][[replicate]])
# }
# # print(pseudobulk_matrix)
# res <- prcomp(t(pseudobulk_matrix[,-1]))
# # print(res)
# biplot(res, cex=0.5)

# Convert to DESeq Object
# dds <- DESeqDataSetFromMatrix(
#     data$count,
#     colData = data$metadata,
#     design = ~ group_id
# )

# Batch Effect Correction 

# Gene enrichement 
