# result <- a %>%
#   group_by(cell_type) %>%
#   summarise(
#     num_gene_DE = sum(p_val_adj < 0.05, na.rm = TRUE),
#     avg = sum(abs(avg_logFC) * (p_val_adj < 0.05), na.rm = TRUE) / sum(p_val_adj < 0.05, na.rm = TRUE)
#   ) %>%
#   arrange(desc(avg))


result <- a %>%
group_by(cell_type) %>%
summarise(
perce = sum(p_val_adj < 0.05, na.rm = TRUE) / n() * 100,
av = sum(abs(avg_logFC) * -log10(p_val_adj), na.rm = TRUE) / sum(p_val_adj < 0.05, na.rm = TRUE)
) %>%
arrange(desc(av))
print(result)
