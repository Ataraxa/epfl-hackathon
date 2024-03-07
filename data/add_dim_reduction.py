import anndata
import numpy as np
import scanpy
from sklearn.decomposition import TruncatedSVD

dataset = 'data/scrna_seq.h5ad'
data = scanpy.read_h5ad(dataset)

# Perform Halko PCA (2009)
n_components=50
svd = TruncatedSVD(n_components=n_components)
principal_components = svd.fit_transform(data.X)
print(np.shape(principal_components))

# Add and save to file
data.obsm['X_pca'] = principal_components
data.write_h5ad("full_data.h5ad")
