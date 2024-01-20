Figure 4a-b Network

VT_B73_none <- subset_samples(VT_ps, Genotype == "B73" | N.dosage == "N:0" | Inoculant == "None")
VT_NIL 1_none<- subset_samples(VT_ps, Genotype == "NIL 1" | N.dosage == "N:0" | Inoculant == "None")
VT_NIL 2_none<- subset_samples(VT_ps, Genotype == "NIL 2" | N.dosage == "N:0" | Inoculant == "None")


VT_B73_none <- subset_samples(VT_ps, Genotype == "B73" | N.dosage == "N:67" | Inoculant == "Proven")
VT_NIL 1_none<- subset_samples(VT_ps, Genotype == "NIL 1" | N.dosage == "N:67" | Inoculant == "Proven")
VT_NIL 2_none<- subset_samples(VT_ps, Genotype == "NIL 2" | N.dosage == "N:67" | Inoculant == "Proven")

VT_B73_none.rel <- microbiome::transform (VT_B73_none , "compositional")

VT_B73_none.rel<- prune_taxa(taxa_sums(VT_B73_none.rel) > 0.01, VT_B73_none.rel)    

VT_B73_none.rel.f <- microbiomeutilities::format_to_besthit(VT_B73_none.rel)


##extract the taxonomy information

otu.c <- t(otu_table(VT_B73_none.rel.f)) #extract the otu table from phyloseq object
tax.c <- as.data.frame(tax_table(VT_B73_none.rel.f))#extract the taxonomy information
head(tax.c)


##########
# mb method


pargs2 <- list(rep.num=100, seed=10010, ncores=32)
t2 <- system.time(
spiec300.01 <- spiec.easi(VT_B73_none.rel.f, method='mb', lambda.min.ratio=1e-3, nlambda=300,
                                pulsar.select=TRUE, pulsar.params=pargs2))

getStability(spiec300.01)
sum(getRefit(spiec300.01))/2 

vsize<- 100000*(apply( otu.c, 2, mean)) # add log abundance as properties of vertex/nodes.)
range(vsize)

adjacency_spiec <- getRefit(spiec300.01)

spiec.ig <- graph.adjacency(adjacency_spiec, mode='undirected', add.rownames = TRUE, weighted = TRUE)
spiec.ig # we can see all the attributes and weights
