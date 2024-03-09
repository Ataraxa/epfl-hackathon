library(Libra)
library(DESeq2)
library(cowplot)
library(Seurat)

## Setting 
loaded <- readRDS("classifier/data/epfl/PhD_test_obj.rds")
seurat <- CreateSeuratObject(counts = loaded$count, meta = loaded$metadata)
cat("Seurat Object Creation: done \n")

## Quality Control
# seurat[["percent.mt"]] <- PercentageFeatureSet(seurat, )
# VlnPlot(seurat, features = c("nFeature_RNA", "nCount_RNA"), group.by = "replicate")
seurat <- subset(seurat, subset = nFeature_RNA > 200 & nFeature_RNA < 6000)
cat("Quality Control: done \n")

## Standard Processing
seurat <- NormalizeData(seurat)
seurat <- FindVariableFeatures(seurat, selection.method = "vst", nfeatures = 2000)
seurat <- ScaleData(seurat)
cat("Pre-processing: done! \n")

## Dimensionality Reduction
seurat <- RunPCA(seurat)
seurat <- FindNeighbors(seurat, dims = 1:30, reduction = "pca")
seurat <- FindClusters(seurat, resolution = 2, cluster.name = "unintegrated_clusters")
seurat <- RunUMAP(seurat, dims = 1:30, reduction = "pca", reduction.name = "umap.unintegrated")
cat("Dimensionality Reduction: done! \n")

## Run differential expression analysis
DE <- run_de(seurat,
    de_family='pseudobulk', de_method='DESeq2', de_type='LRT'
    )
saveRDS(DE, "DE_results.rds")
cat("Differential Expression Analysis: done! \n")

# print(colnames(DE))
# significant_rows <- DE[DE$p_val < 0.05, ]   
# print(significant_rows)  