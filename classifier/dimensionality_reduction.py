import scanpy
from sklearn.decomposition import TruncatedSVD
import numpy as np
from scipy.sparse import csr_matrix

dataset = 'test.h5ad'
data = scanpy.read_h5ad(dataset)

n_components=50
# Apply TruncatedSVD
svd = TruncatedSVD(n_components=n_components)
principal_components = svd.fit_transform(data.X)
print(np.shape(principal_components))
# The resulting 'principal_components' matrix has the principal components in the columns

# Access the explained variance ratio
# explained_variance_ratio = svd.explained_variance_ratio_

# # Access the singular values
# singular_values = svd.singular_values_
