##16s rRNA-seq analysis of CRC metagenomes
#Quality check: R
path <- "/home/laitanawe/github/data/16s_crc/fastqs_16s"
setwd("/home/laitanawe/github/Colorectal-Metagenomics/data")
list.files(path=path, pattern=".fastq")

#Assign Sample Names:
sample.names <- c("SRR15182562", "SRR15182563", "SRR15182564", "SRR15182565", "SRR15182566", "SRR15182567", "SRR15182568", "SRR15182569", "SRR15182570", "SRR15182571", "SRR15182572", "SRR15182573", "SRR15182574", "SRR15182575", "SRR15182576", "SRR15182577", "SRR15182578", "SRR15182579", "SRR15182580", "SRR15182581", "SRR15182582", "SRR15182583", "SRR15182584", "SRR15182585", "SRR15182586", "SRR15182587", "SRR15182588", "SRR15182589", "SRR15182590", "SRR15182591", "SRR15182592", "SRR15182593", "SRR15182594", "SRR15182595", "SRR15182596", "SRR15182597", "SRR15182598", "SRR15182599", "SRR15182600", "SRR15182601", "SRR15182602", "SRR15182603", "SRR15182604", "SRR15182605", "SRR15182606", "SRR15182607", "SRR15182608", "SRR15182609", "SRR15182610", "SRR15182611", "SRR15182612", "SRR15182613", "SRR15182614", "SRR15182615", "SRR15182616", "SRR15182617", "SRR15182618", "SRR15182619", "SRR15182620", "SRR15182621", "SRR15182622", "SRR15182623", "SRR15182624", "SRR15182625", "SRR15182626", "SRR15182627", "SRR15182628", "SRR15182629", "SRR15182630", "SRR15182631")

#Plot Quality Control charts:
plotQualityProfile(fnFs[1:4])
plotQualityProfile(fnFs[1:4])

#Assign names of the Filtered sequences:
filtFs <- file.path(path, "filtered", paste0(sample.names, "_1_filt.fastq.gz"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_2_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names

#Trimming of the sequences:
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(290,200), maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE, compress=TRUE, multithread=TRUE, verbose=TRUE)

out # This will spit out the number of the input and output reads.

##Generate the Filtered Profiles
#Perform Quality check and generate new profiles for filtered sequences:
plotQualityProfile(filtFs[1:4])
plotQualityProfile(filtRs[1:4])

##Error Rate Profiles
#Generate the Estimated Error Rates for Forward and Reverse Sequences
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)

plotErrors(errF, nominalQ=TRUE)
to visualize the estimated error rates: plotErrors(errF, nominalQ=TRUE)

#Third step is the dereplication:
derepFs <- derepFastq(filtFs, verbose=TRUE)
derepRs <- derepFastq(filtRs, verbose=TRUE)

#Sample Inference:
Fourth step is the sample inference:
dadaFs <- dada(derepFs, err=errF, multithread=TRUE)
dadaRs <- dada(derepRs, err=errR, multithread=TRUE)

#5th step: Merging paired reads:
mergers <- mergePairs(dadaFs, derepFs, dadaRs, derepRs, verbose=TRUE)

#6th. Last but not least: sequence table construction:
seqtab <- makeSequenceTable(mergers)
# View No. of samples and No. of variants
dim(seqtab)
# View the distribution of the sequences
table(nchar(getSequences(seqtab)))

# Then, removing the chimeras: # This step could take long if verbose=TRUE
seqtab.nochim <- removeBimeraDenovo(seqtab, method="consensus", multithread=TRUE, verbose=FALSE)
# Check the no. of samples and no. of variants when chimeras are removed
dim(seqtab.nochim)

# Finally, Assigning the taxonomy:
taxa <- assignTaxonomy(seqtab.nochim, "rdp_train_set_16.fa.gz", multithread=TRUE)

# To see the first lines of taxonomy:
unname(head(taxa))

# We will construct the phyloseq object :
library(phyloseq)
library(ggplot2)

dadaFs <- dada(derepFs, err=errF, multithread=TRUE)
dadaRs <- dada(derepRs, err=errR, multithread=TRUE)

##Phyloseq step for 16s rRNA analysis:
 cases <- c(rep("SRR15182562", 2), rep("SRR15182563", 2), rep("SRR15182564", 2), rep("SRR15182565", 2), rep("SRR15182566", 2), rep("SRR15182567", 2), rep("SRR15182568", 2), rep("SRR15182569", 2), rep("SRR15182570", 2), rep("SRR15182571", 2), rep("SRR15182572", 2), rep("SRR15182573", 2), rep("SRR15182574", 2), rep("SRR15182575", 2), rep("SRR15182576", 2), rep("SRR15182577", 2), rep("SRR15182578", 2), rep("SRR15182579", 2), rep("SRR15182580", 2), rep("SRR15182581", 2), rep("SRR15182582", 2), rep("SRR15182583", 2), rep("SRR15182584", 2), rep("SRR15182585", 2), rep("SRR15182586", 2), rep("SRR15182587", 2), rep("SRR15182588", 2), rep("SRR15182589", 2), rep("SRR15182590", 2), rep("SRR15182591", 2), rep("SRR15182592", 2), rep("SRR15182593", 2), rep("SRR15182594", 2), rep("SRR15182595", 2), rep("SRR15182596", 2), rep("SRR15182597", 2), rep("SRR15182598", 2), rep("SRR15182599", 2), rep("SRR15182600", 2), rep("SRR15182601", 2), rep("SRR15182602", 2), rep("SRR15182603", 2), rep("SRR15182604", 2), rep("SRR15182605", 2), rep("SRR15182606", 2), rep("SRR15182607", 2), rep("SRR15182608", 2), rep("SRR15182609", 2), rep("SRR15182610", 2), rep("SRR15182611", 2), rep("SRR15182612", 2), rep("SRR15182613", 2), rep("SRR15182614", 2), rep("SRR15182615", 2), rep("SRR15182616", 2), rep("SRR15182617", 2), rep("SRR15182618", 2), rep("SRR15182619", 2), rep("SRR15182620", 2), rep("SRR15182621", 2), rep("SRR15182622", 2), rep("SRR15182623", 2), rep("SRR15182624", 2), rep("SRR15182625", 2), rep("SRR15182626", 2), rep("SRR15182627", 2), rep("SRR15182628", 2), rep("SRR15182629", 2), rep("SRR15182630", 2), rep("SRR15182631", 2))

 df <- data.frame(Samples= sample.names, Status= cases)
 ps <- phyloseq(otu_table(seqtab.nochim, taxa_are_rows=FALSE), sample_names(df), tax_table(taxa))
 ps <- prune_samples(sample_names(ps) != "Mock", ps)
## to check the phyloseq table
ps

## Alpha Diversity Commands
## Alpha Diversity of 16S rRNA data
library("phyloseq")
library("ggplot2")
theme_set(theme_bw())
plot_richness(ps, measures=c("Shannon", "Simpson"))

##Genus Level Profile
##Generate the Genus level plot
plot_bar(ps, fill="Genus")
