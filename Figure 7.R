
# Function to add ablines to boxplots
add_ablines <- function(plot, fit) {
  plot + 
    geom_abline(intercept = coef(fit)[1], slope = coef(fit)[3], size = 1, alpha = 0.8, color = "cadetblue4") +
    geom_abline(intercept = coef(fit)[1] + coef(fit)[2], 
                slope = coef(fit)[3] + coef(fit)[4],
                size = 1, color = "lightsteelblue")
}

## Plot for Plant N content (kg/ha)
p1 <- Plantdata22 %>% 
  ggplot(aes(y = V8.Plant.N.Content, x = Genotype, fill = Genotype)) +
  geom_boxplot() +
  scale_fill_manual(values = MG) +
  labs(x = NULL, y = "Plant N content (kg/ha)") +
  theme(axis.text.y = element_blank(), legend.position = "bottom") +
  mytheme +
  facet_grid(cols = vars(Inoculant), rows = vars(N.dosages), scales = "free_y", switch = 'y') +
  ggtitle("Plant N content (kg/ha)")

# Plot for Grain Protein%
p2 <- Plantdata22 %>% 
  ggplot(aes(y = Grain.Protein, x = Genotype, fill = Genotype)) +
  geom_boxplot() +
  scale_fill_manual(values = MG) +
  labs(x = NULL, y = "Grain Protein%") +
  theme(axis.text.y = element_blank(), legend.position = "bottom") +
  mytheme +
  facet_grid(cols = vars(Inoculant), rows = vars(N.dosages), scales = "free_y", switch = 'y') +
  ggtitle("Grain Protein%")

# Plot for Kernel weight (mg)
p3 <- Plantdata22 %>% 
  ggplot(aes(y = Kernel.Weight..mg.kernel., x = Genotype, fill = Genotype)) +
  geom_boxplot() +
  scale_fill_manual(values = MG) +
  labs(x = NULL, y = "Kernel weight (mg)") +
  theme(axis.text.y = element_blank(), legend.position = "bottom") +
  mytheme +
  facet_grid(cols = vars(Inoculant), rows = vars(N.dosages), scales = "free_y", switch = 'y') +
  ggtitle("Kernel weight (mg)")

# Arrange ggplots
figure <- ggarrange(p1, p2, p3, ncol = 3, nrow = 1, common.legend = TRUE, legend = "right")
figure