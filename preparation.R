#Preperation
mytheme <- theme_bw() + 
  theme(panel.grid.minor=element_blank(), #gets rid of grey and lines in the middle
        panel.grid.major=element_blank(), #gets rid of grey and lines in the middle
        panel.background=element_rect(fill="white"),#gets rid of grey and lines in the middle. Makes entire background white
        plot.background = element_rect(fill='white', color="#e1deda"),
        panel.border= element_rect(linetype = "solid", fill = NA), #gets rid of square going around the entire graph
        axis.line.x = element_line(colour = 'black', size = 0.6),#sets the axis line size
        axis.line.y = element_line(colour = 'black', size = 0.6),#sets the axis line size
        axis.ticks=element_line(colour = 'black', size = 0.35),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 13), 
        legend.key.size = unit(1, 'cm'),#sets the tick lines
        axis.title.x = element_text(family="Times New Roman", size=12, color="black",face="bold"), #size of x-axis title
        axis.title.y = element_text(family="Times New Roman", size=12, color="black",face="bold"), #size of y-axis title
        axis.text.x = element_text(family="Times New Roman", size=11, angle = 15, color="black",face="bold"), #size of x-axis text
        axis.text.y = element_text(family= "Times New Roman", size=11, color="black", face="bold"),
        plot.title = element_text(color="black", size = 12, face = "bold"),
        plot.subtitle = element_text(size = 11))#size of y-axis text

myshape= c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)
MG=c("#66a182","#2e4057","#8d96a0","#0e669b","#00798c","dodgerblue4", "steelblue2","lightskyblue4","#82cfd0","#b2e0e4","honeydew3","mintcream","#a6cee3", "#1f78b4", "#b2df8a", "#33a02c","#8d96a3","lavender","#CC6686","lavenderblush2","mistyrose3","#e1deda","darkgoldenrod","burlywood","papayawhip","wheat4","cornsilk3","khaki2","beige","gray60","gray80","gray96")

library("phyloseq"); library("grid");library(microbiome)

tidy_phyloseq <- function(my_phyloseq) {
  # Set ranks for taxonomy table
  colnames(tax_table(my_phyloseq)) <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")
  
  # Fix taxa names by removing the leading characters denoting taxonomic ranks
  tax_table(my_phyloseq) <- apply(tax_table(my_phyloseq), 2, function(x) gsub("[a-z]__", "", x))
  
  # Handle missing Phylum entries by replacing them with "Unidentified"
  missing_phylum <- is.na(tax_table(my_phyloseq)[,"Phylum"])
  tax_table(my_phyloseq)[missing_phylum, "Phylum"] <- "Unidentified"
  
  return(my_phyloseq)
}



