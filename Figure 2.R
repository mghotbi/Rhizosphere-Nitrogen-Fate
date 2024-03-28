# Re-build the phyloseq object with the sum of the factors (sum up replications)
#introduce the Rep as a factor
Rep<-as.factor(physeq_rel22)$Rep
#summerize metadata based on replications

sum.net2=physeq_rel22 %>% 
  group_by(Rep) %>% 
  select_if(is.numeric) %>%
  summarise_all(list(mean = ~mean(.)))

#now re-merge metadata with biome file

# Compositional data
physeq_rel22 <- transform_sample_counts(physeq22, function(x) 100 * x / sum(x))
saveRDS(physeq_rel22, file = "physeq_rel22.rds")
physeq_rel22 <- readRDS(file = "physeq_rel22.rds")

# Extract Nitrifiers
Nitrifiers.tax22 <- subset_taxa(physeq_rel22, Genus %in% c("g__Nitrosospira", "g__Candidatus_Nitrososphaera", "g__Nitrososphaeraceae", "s__Nitrospira_japonica", "g__Nitrobacter", "g__Nitrosomonas", "g__Nitrosospira", "g__Nitrospira"))

# Subset V8 and VT
nit_V8 <- subset_samples(Nitrifiers.tax22, Growth.stages == "V8")
nit_VT <- subset_samples(Nitrifiers.tax22, Growth.stages == "VT")

# Using glom function for clean-up
nit.glom22_V8 <- tax_glom(nit_V8, taxrank = "Genus")

# Re-introducing the factors (independent variables)
sample_data(nit.glom22_V8)$N.dosage <- factor(sample_data(physeq22sum)$N.dosage, levels = c("N:0", "N:67"))
sample_data(nit.glom22_V8)$Genotype <- factor(sample_data(physeq22sum)$Genotype, levels = c("B73", "NIL 1", "NIL 2"))
sample_data(nit.glom22_V8)$Inoculant <- factor(sample_data(physeq22sum)$Inoculant, levels = c("None", "Proven"))



e <- plot_bar(nit.glom22_V8, x = "Genotype", fill = "Genus") +
  scale_fill_manual(values = MG) +
  theme(legend.position = "bottom", strip.text.x = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"), strip.text.y = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"), strip.background = element_rect(colour = "black", fill = "gray98")) +
  guides(fill = guide_legend(nrow = 10)) +
  mytheme +
  labs(x = "", y = "Relative Abundance (%)") +
  facet_grid(cols = vars(Inoculant), rows = vars(N.dosage), scales = "free_y", switch = 'y') +
  ggtitle("V8-2022")
