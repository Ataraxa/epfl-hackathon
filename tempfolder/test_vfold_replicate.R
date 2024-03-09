source("Augur/R/custom_vfold_replicate.R")
source("Augur/R/custom_vfold_cv.R")
source("Augur/R/subsampling_utils.R")

X0 <- readRDS("x0.rds")
categories <- c("Disease_4", "Disease_9", "Control_10", "Control_2", "Control_3" )
random_vector <- sample(categories, 40, replace = TRUE)
X0$replicate <- random_vector
vfolds <- my_vfold_cv(X0, v = 5)
vfolds2 <- vfold_cv(X0, v = 5)
str(vfolds[1,])
str(vfolds2[1,])

# data <- readRDS("classifier/data/epfl/PhD_test_obj.rds")
# seurat_object <- CreateSeuratObject(counts = data$count, meta = data$metadata)
# seurat_object_subset <- subset(seurat_object, subset = cell_type == "Ventral")

# a <- subsample_by_replicate(seurat_object_subset)