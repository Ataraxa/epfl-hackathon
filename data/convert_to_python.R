library(SingleCellExperiment)

# Extract data
loaded_data <- readRDS("data/PhD_test_obj.rds")
count_matrix <- loaded_data$count
metadata <- loaded_data$metadata

# Create a SingleCellExperiment object  
sce <- SingleCellExperiment(
  assays = list(counts = count_matrix),
  colData = DataFrame(metadata)
)

# Write into a python-readable format
writeH5AD(sce, "scrna_seq.h5ad")