# Rhizosphere-nitrogen-fate

**Management and rhizosphere microbial associations modulate genetic-driven nitrogen fate**

Mitra Ghotbi<sup> 1,2*</sup>, Marjan Ghotbi<sup> 3</sup>, Yakov Kuzyakov<sup> 4,5</sup>, William R. Horwath<sup> 6</sup>,

**Affiliations:**

**Mitra Ghotbi**

<sup>1</sup> Department of Natural Resources & Environmental Sciences, University of Illinois at Urbana-Champaign, IL, USA

<sup>2</sup> Department of Biology, Middle Tennessee State University at Murfreesboro, TN, USA


**Marjan Ghotbi**

<sup>3</sup> GEOMAR Helmholtz Centre for Ocean Research at Kiel, Germany


**Yakov Kuzyakov**

<sup>4</sup> Department of Soil Science of Temperate Ecosystems and Department of Agricultural Soil Science, Georg-August-University of Göttingen at Göttingen, Germany


<sup>5</sup> Peoples Friendship University of Russia (RUDN University), 117198 Moscow, Russia

**William R. Horwath**

<sup>6</sup> Plant and Environmental Sciences Building, Department of Land, Air & Water Resources, University of California Davis, at Davis, CA, USA


**Corresponding author:**
- Dr. Mitra Ghotbi, Department of Biology, Middle Tennessee State University at Murfreesboro, TN, USA.
  - Email: mitra.ghotbi@mtsu.edu
  - ORCID ID: [0000-0001-9185-9993](https://orcid.org/0000-0001-9185-9993)
  - Web of Science ResearcherID: [G-4323-2013](https://publons.com/researcher/G-4323-2013/)



![Graphical Abstract](https://github.com/mghotbi/Rhizosphere-Nitrogen-Fate/blob/Rhizosphere-nitrogen-fate/Graphical%20Abstract.png)



Abstract

The interplay between plant genotype and nutrient management affects rhizodeposition, which in turn affects the rhizosphere-microbiome and microbe-mediated functions. Substituting mineral nitrogen (N) with an N-fixing inoculant reduces reliance on N fertilizer while supplying N to crops. We assessed the efficacy of integrating teosinte-maize near-isogenic lines (NIL 1 and NIL 2) with the biological nitrification inhibition (BNI) phenotype into management. This involved synthesizing insights from amplicon sequencing data and evaluating nitrification rates and maize N use efficiency. Management strategies included mineral N inputs (0 and 67 kg ha⁻¹) with and without an N-fixing inoculant. Nitrification rate in the maize rhizosphere was interactively mediated by genotype and management strategy across plant development stages (p= 0.01). The nitrification rate was decoupled from the nitrifiers' population size. The increase in N level, irrespective of resources, triggered the BNI capacity of NILs, facilitated by rhizosphere priming, the recruitment of competent microbes, and shifts in microbial associations. Despite NIL 2 having higher N content (72.3 kg ha⁻¹) compared to NIL 1 (65.0 kg ha⁻¹), similar nitrification rates in their rhizosphere suggest diverse N retention strategies. The superior N uptake of NIL 2, characterized by the presence of keystone taxa such as Archangium (bacteria) and Trichoderma (fungi), coincided with high inter-module connectivity in response to elevated N levels. This can be attributed to a broader niche adaptation within NIL 2's rhizosphere and possible metabolic synergy within this microhabitat. BNI-NILs reduced N loss, yet the extent of reduction varied with genotype and management, underscoring the importance of genotype-specific approaches when integrating BNI into agroecosystems.

Keywords: phenotype, nitrification, near-isogenic lines, biological nitrification inhibition, plant nitrogen uptake, plant-microbe association




**The R codes relevant to each figure have been published here to assist readers in navigating and reproducing them easily.**



# Prerequisites: Ensure that the required packages are installed and loaded.

suppressPackageStartupMessages({
  library(reshape2)
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
  library(lmerTest)
})


<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/mghotbi/Rhizosphere-Nitrogen-Fate">Rhizosphere-nitrogen-fate</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.linkedin.com/in/mitra-ghotbi-78b34030/">Mitra Ghotbi</a> is licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution-ShareAlike 4.0 International<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1"></a></p>
