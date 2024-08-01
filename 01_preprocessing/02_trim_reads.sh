############################
### 02_trim_reads ############
############################

cd /Volumes/archive/kennylab/roseanna_kawakawa/rawreads/

mkdir Trimmed_reads3



### Trim reads



# best gets

for R1 in *_R1.fastq.gz ; do

  R2="${R1%_R1.fastq.gz}_R2.fastq.gz"

  java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/trimmed_log6.txt "/Volumes/archive/kennylab/roseanna_kawakawa/rawreads/$R1" "/Volumes/archive/kennylab/roseanna_kawakawa/rawreads/$R2" "/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/${R1%.fastq.gz}_PE.fastq.gz" "/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/${R1%.fastq.gz}_SR.fastq.gz" "/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/${R2%.fastq.gz}_PE.fastq.gz" "/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/${R2%.fastq.gz}_SR.fastq.gz" ILLUMINACLIP:/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/kawakawaseqtoremove5.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 

done



# TEST works on single read
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/trimmed_log.txt P13A_R1.fastq.gz P13A_R2.fastq.gz P13A_R1_PE.fastq.gz P13A_R1_SR.fastq.gz P13A_R2_PE.fastq.gz P13A_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/roseanna_kawakawa/rawreads/kawakawaseqtoremove4.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 



# fastqc trimmed reads
mkdir fastqc_trim

screen

353759

fastqc *.fastq.gz -o /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/fastqc_trim/

# just PE

mkdir fastqcPE

cp *PE* fastqcPE


mkdir R1_trim_PE_fastqc R2_trim_PE_fastqc


cp *R1* R1_trim_PE_fastqc

cp *R2* R2_trim_PE_fastqc


# multiqc the fastqc

mkdir multiqc

multiqc .

## download html files
scp cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R1_paired_fastqc.html cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R2_paired_fastqc.html /drives/c/Users/gamro07p/Documents/Transcriptomics/Tutorial_08_03_23/data/
