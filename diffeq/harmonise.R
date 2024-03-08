library(SingleCellExperiment)
library(Seurat)

loaded <- readRDS("classifier/data/epfl/PhD_test_obj.rds")
seurat <- CreateSeuratObject(counts = loaded$count, meta = loaded$metadata)
seurat <- FindVariableFeatures(seurat_obj, selection.method = "vst", nfeatures = 2000)
seurat <- NormalizeData(seurat)
seurat <- ScaleData(seurat)
# seurat <- SCTransform(seurat, vst.flavor = "v2") # Too power-hungry   
seurat <- RunPCA(seurat)
# seurat <- IntegrateLayers(object = seurat, method = HarmonyIntegration,
#                        orig.reduction = "pca", new.reduction = 'harmony',
#                        assay = "RNA", verbose = FALSE)

seurat <- FindNeighbors(seurat, dims = 1:30, reduction = "pca")
seurat <- FindClusters(seurat, resolution = 2, cluster.name = "unintegrated_clusters")
seurat <- RunUMAP(seurat, dims = 1:30, reduction = "pca", reduction.name = "umap.unintegrated")

p1 <- DimPlot(seurat, reduction = "umap.unintegrated", group.by = c("label", "replicate"))

print(dim_plot)

mito <- PercentageFeatureSet(seurat, pattern='^MT-')
