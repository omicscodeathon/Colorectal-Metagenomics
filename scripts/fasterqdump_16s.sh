#!/usr/bin/env bash

# Load the singularity module into environment
# module load singularity

rdp_train_path="/opt/rdp/rdp_train_set_16.fa.gz"
runid_file="/home/laitanawe/github/Colorectal-Metagenomics/data/16s_crc_accessions.txt"
container="~/github/containers/16s.sif"
fastq_path="/home/laitanawe/github/data/16s_crc/fastqs_16s"
cpus=12


## DADA2 workflow:
#1. Obtain Raw FASTQ files: fasterq-dump
#cat $runid_file | xargs singularity exec $container fasterq-dump --outdir $fastq_path -e $cpus
cat $runid_file | xargs fasterq-dump --outdir $fastq_path -e $cpus

##2. DADA2 workflow


#3.


#4.


#5.


#6.


#7.
