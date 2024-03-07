library(SingleCellExperiment)

loaded_data <- readRDS("PhD_test_obj.rds")

# Extract count matrix and metadata
count_matrix <- loaded_data$count
metadata <- loaded_data$metadata

# Create a SingleCellExperiment object  
sce <- SingleCellExperiment(
  assays = list(counts = count_matrix),
  colData = DataFrame(metadata)
)

# Check the structure of the resulting SingleCellExperiment object
str(sce)

saveRDS(sce, file = "output_file.rds")