library(dplyr)
library(magrittr)
library(pbmcapply)
library(Seurat)
# From calculate_auc.R
library(tibble)
library(recipes)
library(purrr, include.only = c("map", "map2", "map_lgl", "pmap", "map2_df"))
library(magrittr, include.only = c("%>%", "%<>%", "extract", "extract2", "set_rownames", "set_colnames"))
library(parsnip, include.only = c("set_engine", "logistic_reg", "rand_forest", "fit", "translate"))
library(yardstick, include.only = c("metric_set", "accuracy", "precision", "recall", "sens", "spec", "npv", "ppv", "roc_auc", "ccc", "huber_loss_pseudo", "huber_loss", "mae", "mape", "mase", "rpd", "rpiq", "rsq_trad", "rsq", "smape", "rmse"))
library(methods, include.only = c("is"))
library(pbmcapply, include.only = c("pbmclapply"))
library(parallel, include.only = c("mclapply"))
library(tester, include.only = c("is_numeric_matrix", "is_numeric_dataframe"))
library(randomForest, include.only = c("randomForest"))
library(Matrix)

# For v-fold
library(rsample)
library(tidyselect, include.only = c("vars_select"))
library(rlang, include.only = c("enquo"))

# Calculate variance 
library(lmtest, include.only = c("coxtest"))
library(stats, include.only = c("loess", "quantile","setNames", "predict", "sd"))
library(sparseMatrixStats, include.only = c("rowSds", "colVars"))
 
source("Augur/R/calculate_auc.R")
source("Augur/R/custom_vfold_cv.R")
source("Augur/R/custom_vfold_replicate.R")
source("Augur/R/select_variance.R")
source("Augur/R/select_random.R")
source("Augur/R/subsampling_utils.R")

data <- readRDS("classifier/data/epfl/PhD_test_obj.rds")
seurat_object <- CreateSeuratObject(counts = data$count, meta = data$metadata)
seurat_object_subset <- subset(seurat_object, subset = cell_type == "Ventral")
# seurat_object_subset <- FindVariableFeatures(seurat_object_subset, nfeatures = 15000)
# selected_genes <- head(rownames(seurat_object_subset), 15000)
# seurat_object_sliced <- seurat_object_subset[, selected_genes]
cat("Going into Augur \n")

# sc_sim <- load(file="Augur/data/sc_sim.rda")
augur <- calculate_auc(seurat_object_subset)
augur$AUC
saveRDS(augur, "augur_res.rds")