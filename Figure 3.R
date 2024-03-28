# Define a function to create the plots for different growth stages
create_combined_plot <- function(subsetted_data, title, y_label) {
  combined_plot <- ggplot(subsetted_data, aes(x = N.dosages, y = Potential_N_micro, fill = Genotype)) +
    geom_violin(width = 2.3, trim = FALSE, alpha = 1, position = position_dodge(width = 0.75)) +
    geom_jitter(aes(color = Genotype), height = 0, width = .3, alpha = 1) +
    stat_summary(aes(group = Genotype), fun.y = median, geom = "point", size = 2, position = position_dodge(width = 0.75)) +
    stat_summary(aes(group = Genotype), fun.data = mean_sd, geom = "errorbar", width = 0.2, position = position_dodge(width = 0.75), color = "black", size = 0.5) +
    scale_color_manual(values = MG) +
    scale_fill_manual(values = MG) +
    mytheme +
    facet_grid(cols = vars(Inoculant), scales = "free_y", switch = 'x') +
    labs(x = NULL, y = y_label) +
    ggtitle(title) +
    theme(strip.text.y = element_text(family = "Arial", size = 12, color = "black", face = "bold"),
          strip.background = element_rect(colour = "white", fill = "gray98"))
  
  return(combined_plot)
}

# Filter out data points with N.dosages as "N:34"
PotentialN22_N67_3 <- PotentialN22_N67_3 %>% 
  filter(N.dosages != "N:34")

# Convert variables to factors
Genotype <- as.factor(PotentialN22_N67_3$Genotype)
Inoculant <- as.factor(PotentialN22_N67_3$Inoculant)
Growth.stage <- as.factor(PotentialN22_N67_3$Growth.stage)
N.dosages <- as.factor(PotentialN22_N67_3$N.dosages)
Rep <- as.factor(PotentialN22_N67_3$Rep)

# Subset data for Growth.stage == "V8"
subsetted_data_V8 <- PotentialN22_N67_3 %>%
  filter(Growth.stage == "V8")

# Subset data for Growth.stage == "VT"
subsetted_data_VT <- PotentialN22_N67_3 %>%
  filter(Growth.stage == "VT")

# Create combined plots for V8 and VT
combined_plot_V8 <- create_combined_plot(subsetted_data_V8, "V8-2022 Nitrification Potential", expression("Potential Nitrification Rate" ~ "(µg g"^"-1"~ "soil)"))
combined_plot_VT <- create_combined_plot(subsetted_data_VT, "VT-2022 Nitrification Potential", NULL)

# Arrange plots
arranged_plots <- ggarrange(combined_plot_V8, combined_plot_VT, ncol = 2, nrow = 1, common.legend = TRUE, legend = "top")

# Final plot
arranged_plots
