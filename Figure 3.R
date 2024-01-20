#Figure 3 Potential nitrification rate
subsetted_data_V8 <- PotentialN22_N67_3 %>%
  filter( Growth.stage == "V8") 

subsetted_data_VT <- PotentialN22_N67_3 %>%
  filter( Growth.stage == "VT") 


# V8 plot
p5 <- ggplot(subsetted_data_V8, aes(N.dosages, Potential_N, fill = Genotype)) +
  geom_violin(outlier.shape = 19, position = position_dodge(width = 0.75)) +
  stat_summary(
    fun = mean,
    geom = "point",
    size = 2,
    position = position_dodge(width = 0.75)
  ) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    width = 0.2,
    position = position_dodge(width = 0.75),
    size = 1
  ) +  
  scale_fill_manual(values = MG) +
  mytheme +
  facet_grid(rows = vars(Inoculant), scales = "free_y", switch = 'y') +
  xlab(NULL) +
  ggtitle("V8-2022 Nitrification potential") +
  theme(strip.text.x = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.text.y = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.background = element_rect(colour = "white", fill = "gray98"))

# VT plot
p6 <- ggplot(subsetted_data_VT, aes(N.dosages, Potential_N, fill = Genotype)) +
  geom_violin(outlier.shape = 19, position = position_dodge(width = 0.75)) +
  stat_summary(
    fun = mean,
    geom = "point",
    size = 2,
    position = position_dodge(width = 0.75)
  ) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    width = 0.2,
    position = position_dodge(width = 0.75),
    size = 1
  ) +  
  scale_fill_manual(values = MG) +
  mytheme +
  facet_grid(rows = vars(Inoculant), scales = "free_y", switch = 'y') +
  xlab(NULL) +
  ggtitle("VT-2022 Nitrification potential") +
  theme(strip.text.x = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.text.y = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"),
        strip.background = element_rect(colour = "white", fill = "gray98"))

# Arrange and display the plots
x11()
ggarrange(p5, p6, ncol = 2, nrow = 1, common.legend = T, legend = "top")
