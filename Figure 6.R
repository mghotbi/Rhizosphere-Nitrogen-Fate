#merged 16S rRNA and ITS seq read with the same depth 19000

# Subset taxa based on specified species
key <- subset_taxa(merged4net22, Species %in% c("s__Gemmatimonadetes_bacterium", "s__Trichoderma_viride", "s__Mortierella_elongata", "s__bacterium", "s__uncultured_crenarchaeote", "s__Vitiosangium_sp."))

# Extract factors for analysis
factors_data <- data.frame(
  Genotype = as.factor(sample_data(key)$Genotype),
  N.dosage = as.factor(sample_data(key)$N.dosage),
  Inoculant = as.factor(sample_data(key)$Inoculant),
  Growth.stage = factor(sample_data(key)$Growth.stage, ordered(c("V8", "VT")))
)

# Subset samples for VT growth stage
merg.vt <- subset_samples(physeq1, Growth.stage == "VT")

# Taxonomic analysis
ph.vt <- tax_glom(merg.vt, taxrank = "Genus")
ph.vt <- prune_taxa(taxa_sums(ph.vt) > 0, ph.vt)
ph.glom <- tax_glom(ph.vt, taxrank = "Genus")
top_vt <- names(sort(taxa_sums(ph.glom), TRUE)[1:10])

# Plotting
x11()
sample_data(top_vt)$N.dosages <- factor(sample_data(physeq.v8)$N.dosages, levels = c("N:0", "N:67"))
sample_data(top_vt)$Genotype <- factor(sample_data(physeq.v8)$Genotype, levels = c("B73", "NIL 1", "NIL 2"))
sample_data(top_vt)$Inoculant <- factor(sample_data(physeq.v8)$Inoculant, levels = c("None", "Proven"))

o <- plot_bar(top_vt, x = "Genotype", fill = "Phylum") +
  scale_fill_manual(values = MG) +
  theme(legend.position = "bottom", strip.text.x = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.text.y = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.background = element_rect(colour = "black", fill = "gray98")) +
  guides(fill = guide_legend(nrow = 10)) +
  mytheme +
  labs(x = "", y = "Relative Abundance (%)") +
  facet_grid(cols = vars(Inoculant), rows = vars(N.dosages), scales = "free_y", switch = 'y') +
  ggtitle("Networkhub taxa relative abundance across the factors")
