# Rhizosphere-nitrogen-fate-
Management and rhizosphere microbial associations modulate genetic-driven nitrogen fate 

Mitra Ghotbi 1, 2 *, Yakov Kuzyakov 3,4, Marjan Ghotbi 5, William R. Horwath 6

1 Department of Natural Resources & Environmental Sciences, University of Illinois at Urbana-Champaign, IL, USA
2 Department of Biology, Middle Tennessee State University at Murfreesboro, TN, USA 
3 Department of Soil Science of Temperate Ecosystems and Department of Agricultural Soil Science, Georg-August-University of Göttingen at Göttingen, Germany
4 Peoples Friendship University of Russia (RUDN University), 117198 Moscow, Russia
5 GEOMAR Helmholtz Centre for Ocean Research at Kiel, Germany
6 Plant and Environmental Sciences Building, Department of Land, Air & Water Resources, University of California Davis, at Davis, CA, USA

*Corresponding author: Dr. Mitra Ghotbi, Department of Biology, Middle Tennessee State University at Murfreesboro, TN, USA. Phone: +1 313 707 6077, mitra.ghotbi@mtsu.edu
ORCID ID 0000-0001-9185-9993, Web of Science ResearcherID: G-4323-2013

![Graphical Abstract](https://github.com/mghotbi/Rhizosphere-Nitrogen-Fate/blob/main/Rhizosphere-nitrogen-fate/GA.png)



Abstract
The interplay between genotype and nutrient management influences plant rhizodeposition, modulating the plant-microbiome associations and microbe-mediated functions in rhizosphere. Substituting mineral nitrogen (N) with an N-fixing inoculant reduces reliance on N fertilizer while supplying N to crops. We explored how teosinte-maize near-isogenic lines (NIL 1 and NIL 2) with the biological nitrification inhibition (BNI) phenotype respond to different management strategies, including mineral N input (0 and 67 kg ha-1) with and without an N-fixing inoculant. Using DNA amplicon sequencing, nitrification rate measurements, and assessments of maize N uptake, partitioning, and yield, we aimed to compare rhizosphere N retention efficiency between BNI-NILs and B73 inbred maize (lacking BNI). The nitrification rate in maize rhizosphere was interactively mediated by genotype and management. Elevated N levels triggered BNI capacity in NILs, potentially through rhizosphere priming, competent microbes recruitment, and association dysbiosis. Despite NIL 2's higher N content (72.3 kg ha-1) compared to NIL 1 (65.0 kg ha-1) and higher grain N content in NIL 1 (8.4%) than NIL 2 (7.8%), similar nitrification rates suggest their diverse N retention strategies. NIL 2's superior N uptake, with Archangium and Trichoderma as keystone taxa, elevated among-module-connectivity in response to high N level, can underscore broad niche compliance and potential metabolic synergy in its rhizosphere. NILs retained rhizosphere N by reducing nitrification and increasing N uptake and use efficiency. Yet, their efficacy fluctuated with management across growth stages. This highlights the importance of choosing genotype-specific strategies for successful BNI integration. 
Keywords: phenotype, nitrification, near-isogenic lines, biological nitrification inhibition, plant nitrogen uptake, plant-microbe association



The R codes relevant to each figure have been published here to assist readers in navigating and reproducing them easily.


#prerequisites
#Install packages

suppressPackageStartupMessages({
library(reshape2)
library(fantaxtic)
library(igraph)
library(microbiome)
library(ggnet)
library(microbiomeutilities)
library(intergraph)
library(network)
library(SpiecEasi) 
library(microbiome)
library(data.table)
library(decontam)
library(ggtext)
library(dplyr)
library(devtools)
library(dada2)
library(ggplot2)
library(phyloseq)
library(vegan)
library(ggpubr)
library(agridat)
library(lme4)
library(rstatix)
library(emmeans)
library(ape)
library(microbiomeMarker)
library(lmerTest)})

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/mghotbi/Rhizosphere-Nitrogen-Fate">Rhizosphere-nitrogen-fate</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.linkedin.com/in/mitra-ghotbi-78b34030/">Mitra Ghotbi</a> is licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution-ShareAlike 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"></a></p>
