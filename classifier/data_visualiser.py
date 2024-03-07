import anndata
import scanpy
import numpy as np

id_dict = {'Healthy': 1, 'Disease': 0}
# Load an h5ad file
dataset = 'test.h5ad'
pca = False

# Access expression matrix
data = scanpy.read_h5ad(dataset)
if pca == True:
    origin = data.obsm['X_pca']
else:
    origin = data.layers['raw']

patient_id = data.obs['patient_id']
labels = data.obs['Outcome']
cell_type = data.obs['cell_type']


labels_ = np.array(labels.map(id_dict))

l_dict = {}
indices = np.arange(origin.shape[0])
p_ids = sorted(set(patient_id))
p_idx = []

for i in p_ids:
    idx = indices[patient_id == i]
    if len(set(labels_[idx])) > 1:   # one patient with more than one labels
        for ii in sorted(set(labels_[idx])):
            if ii > -1:
                iidx = idx[labels_[idx] == ii]
                tt_idx = iidx
                if len(tt_idx) < 500:  # exclude the sample with the number of cells fewer than 500
                    continue
                p_idx.append(tt_idx)
                l_dict[labels_[iidx[0]]] = l_dict.get(labels_[iidx[0]], 0) + 1
    else:
        if labels_[idx[0]] > -1:
            tt_idx = idx
            if len(tt_idx) < 500:  # exclude the sample with the number of cells fewer than 500
                continue
            p_idx.append(tt_idx)
            l_dict[labels_[idx[0]]] = l_dict.get(labels_[idx[0]], 0) + 1