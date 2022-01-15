#!/usr/bin/env bash

# This script accepts accessions and pulls down the fastqs from the SRA
# Dependencies: SRA-Toolkit must be installed in the environment first
# If using singularity container, load the singularity module into environment
# module load singularity

rdp_train_path="/opt/rdp/rdp_train_set_16.fa.gz"
runid_file="/home/user/github/Colorectal-Metagenomics/data/16s_crc_accessions.txt"
container="~/github/containers/16s.sif"
fastq_path="/home/user/github/data/16s_crc/fastqs_16s"
cpus=12


#Obtain Raw FASTQ files: fasterq-dump
#cat $runid_file | xargs singularity exec $container fasterq-dump --outdir $fastq_path -e $cpus
cat $runid_file | xargs fasterq-dump --outdir $fastq_path -e $cpus
