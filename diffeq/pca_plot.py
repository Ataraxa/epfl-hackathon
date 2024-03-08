import scanpy

# Get PCA matrix
data = scanpy.read_h5ad("../classifier/data/epfl/full_data.h5ad")
data.obsm["X_pca"]

