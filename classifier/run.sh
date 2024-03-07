python main.py  \
    --model Transformer \
    --epochs 100 \
    --norm_first False \
    --seed 100 \
    --task custom \
    --all 0 \
    --h_dim 128 \
    --heads 8 \
    --layers 1 \
    --dropout 0.3 \
    --min_size 10000 \
    --inter_only True \
    --batch_size 256 \
    --same_pheno -1 \
    --n_splits 2 \
    --augment_num 300 \
    --pca True \
    --warmup False \
    --learning_rate 0.01 \
    --alpha 0.5 \
    --mix_type 1 \
    --repeat 1 \
    --train_sample_cells=500  --test_sample_cells=500  --train_num_sample=20 --test_num_sample=50
