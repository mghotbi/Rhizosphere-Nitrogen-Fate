## **Figure 1a-b:** Cladogram of fungal taxa contributing significantly to community composition variation (a) and abundance of top 10 genera for each of the top 3 phyla across genotypes (B73, NIL 1, and NIL 2) at V8 and VT growth stages (b), irrespective of management.

# Make your phyloseq object
mydata16S <- import_biom(BIOMfilename = "taxonomy.feature-table.biom", treefilename = "tree.nwk", parseFunction = parse_taxonomy_default)
mapfile16S <- import_qiime_sample_data("metadata.txt")
physeq <- merge_phyloseq(mydata16S, mapfile16S)

# Subset the levels of the factors
VT_N0 <- subset_samples(physeq, Growth.stage == "VT" | N.dosages == "N:0" | Inoculant == "none")

## a)
mm_lefse <- run_lefse(
  VT_N0,
  wilcoxon_cutoff = 0.01,
  group = "Genotype",
  kw_cutoff = 0.01,
  multigrp_strat = TRUE,
  lda_cutoff = 4
)
plot_cladogram(mm_lefse, color = MG)

## b)
top_nested <- nested_top_taxa(
  VT_N0,
  top_tax_level = "Phylum",
  nested_tax_level = "Genus",
  n_top_taxa = 3,
  n_nested_taxa = 3,
  nested_merged_label = "NA and other <tax>"
)

top_nested$top_taxa %>%
  mutate(top_abundance = round(top_abundance, 3),
         nested_abundance = round(nested_abundance, 3)) %>%
  kable(format = "markdown")

plot_nested_bar(top_nested$ps_obj,
                top_level = "Phylum",
                nested_level = "Genus",
                nested_merged_label = "NA and other <tax>",
                legend_title = "Phylum and species") +
  facet_wrap(~Genotype, scales = "free_x") +
  labs(title = "Relative abundances of the top 3 Genera for each of the top 3 phyla") +
  theme(plot.title = element_text(hjust = 0.5, size = 9, face = "bold"),
        legend.key.size = unit(10, "points"))



