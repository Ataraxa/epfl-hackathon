# loaded_data <- readRDS("PhD_test_obj.rds")
# str(loaded_data)
# df = loaded_data$metadata
library(SingleCellExperiment)

loaded <- readRDS("sce_obj.rds")
print(loaded)
# df_sorted <- df[order(df$cell_type), ]
# indices_ventral <- which(df_sorted$cell_type == "Ventral")
# print(indices_ventral)
# print(df_sorted[43267,])

# Check that all cells have a cell type
# all_non_empty <- all(!is.na(df$cell_type) & nzchar(df$cell_type))

# if (all_non_empty) {
#   print("All rows have a non-empty cell_type.")
# } else {
#   print("Some rows have an empty cell_type.")
# }

# print("Done!")


