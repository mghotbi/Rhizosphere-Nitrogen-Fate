# my pallet
MG <- c("#66a182","#2e4057","#8d96a0","#0e669b","#00798c","dodgerblue4", "steelblue2","lightskyblue4","#82cfd0","#b2e0e4","honeydew3","mintcream","#8d96a3","lavender","#CC6686","lavenderblush2","mistyrose3","#e1deda","darkgoldenrod","burlywood","papayawhip","wheat4","cornsilk3","khaki2","beige","gray60","gray80","gray96")

# my custom theme
mytheme <- theme_bw() + 
  theme(
    panel.grid.minor = element_blank(), #gets rid of grey and lines in the middle
    panel.grid.major = element_blank(), #gets rid of grey and lines in the middle
    panel.background = element_rect(fill = "white"), #gets rid of grey and lines in the middle. Makes entire background white
    plot.background = element_rect(fill = 'white', color = "#e1deda"),
    panel.border = element_rect(linetype = "solid", fill = NA), #gets rid of square going around the entire graph
    axis.line.x = element_line(colour = 'black', size = 0.6), #sets the axis line size
    axis.line.y = element_line(colour = 'black', size = 0.6), #sets the axis line size
    axis.ticks = element_line(colour = 'black', size = 0.35),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 13), 
    legend.key.size = unit(1.2, 'cm'), #sets the tick lines
    axis.title.x = element_text(family = "Times New Roman", size = 12, color = "black"), #size of x-axis title
    axis.title.y = element_text(family = "Times New Roman", size = 12, color = "black", face = "bold"), #size of y-axis title
    axis.text.x = element_text(family = "Times New Roman", size = 11, angle = 0, color = "black", face = "bold"), #size of x-axis text
    axis.text.y = element_text(family = "Times New Roman", size = 11, color = "black", face = "bold"),
    plot.title = element_text(color = "black", size = 12, face = "bold"),
    plot.subtitle = element_text(size = 11),
    strip.background = element_rect(colour = "white", fill = "white"), # Set strip background color to white
    legend.position = "top", # Set legend position to top
    legend.key = element_blank() # Remove legend key
  )

# Filter out N:34 
Plantdata22 <- Plantdata22 %>% filter(N.dosages != "N:34")

# Convert to factors
Genotype <- as.factor(Plantdata22$Genotype)
Inoculant <- as.factor(Plantdata22$Inoculant)
N.dosages <- as.factor(Plantdata22$N.dosages)

# Create Management variable
Management <- paste(Inoculant, N.dosages, sep = "_")

# Function to create plots
create_plot <- function(data, x_var, y_var, y_label, title) {
  ggplot(data, aes_string(x = x_var, y = y_var, fill = "Genotype")) +
    geom_boxplot(width = 0.7, position = position_dodge(width = 0.75), notch = FALSE, outlier.shape = NA) +
    geom_jitter(aes(color = Genotype), height = 0, width = .3, alpha = 0.8) + 
    stat_summary(fun = mean, geom = "point", size = 0, position = position_dodge(width = 0.75)) + 
    scale_fill_manual(values = MG) +
    scale_color_manual(values = MG) +  # Set color scale to match fill scale
    mytheme +
    facet_grid(cols = vars(Inoculant), scales = "free_y", switch = 'x') +
    labs(x = NULL, y = y_label) +  
    ggtitle(title)
}

# Create plots
a <- create_plot(Plantdata22, "N.dosages", "Grain.Protein", "Grain protein %", "(a)")
b <- create_plot(Plantdata22, "N.dosages", "VT.Plant.Biomass_kg", "Plant biomass (kg ha^-1)", "(b)")
c <- create_plot(Plantdata22, "N.dosages", "VT.Plant.N.Content_kg", "Plant N content (kg ha^-1)", "(c)")
d <- create_plot(Plantdata22, "N.dosages", "Kernel.Weight..kg.kernel.", "Kernel weight (kg kernel^-1)", "(d)")

# Arrange them
ggarrange(a, b, c, d, ncol = 4, common.legend = TRUE, legend = "top")
