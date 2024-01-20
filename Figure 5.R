# Figure 5

# Scale specified numerical columns in the dataframe and melt it
Net.melted <- selected_df %>%
  mutate(across(c(Closeness, Betweenness, modularity), ~scale(.) %>% as.vector)) %>%
  melt(id.vars = c("management", "Genotype"))


# Plotting 
one <- ggplot(meltdf, aes(variable, value, colour = Genotype)) +
  geom_boxplot(aes(group = Genotype)) +
  geom_jitter(position = position_jitter(width = 0.2), alpha = 0.3) +  # Add jitter here
  mytheme +
  facet_grid(cols = vars(NM), scales = "free_y", switch = 'y') +
  ylim(0, 2.5) +
  scale_color_manual(values = MG) +
  xlab("") +
  ylab("Scaled network topological properties")

