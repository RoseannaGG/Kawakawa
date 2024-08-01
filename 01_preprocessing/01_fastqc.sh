cd /Volumes/archive/kennylab/roseanna_kawakawa/


#####################
## 01_preprocessing ######
#######################

######### Fast QC ###########################

#copy files from multiple subdirectories into one directory              
rsync -zv /Volumes/archive/kennylab/Kawakawa_sponge_and_Splitseq/AA*/*gz /Volumes/archive/kennylab/roseanna_kawakawa/rawreads_originalnames                



#create excel file with sample names
mv	AACC5F5HV-8516-09-58-1_S9_L001_R1_001.fastq.gz	example	.fastq.gz

#


# replace tab with space


# remove space between name and .fastq.gz


# upload
rsync -zv /drives/c/Users/gamro07p/Documents/Kawakawa/bioinformatics/rename_reads_commands.txt roseannagamlen-greene@biochemcompute1.uod.otago.ac.nz:/Volumes/archive/kennylab/roseanna_kawakawa/rawreads/ --progress

# run
mv /Volumes/archive/kennylab/roseanna_kawakawa/rawreads/AACC5F5HV-8516-09-58-1_S9_L001_R1_001.fastq.gz /Volumes/archive/kennylab/roseanna_kawakawa/rawreads/kawakawa/P13A_R1.fastq.gz



## 

mv *.fastq.g *z

for file in *.fa.txt
do
  mv "$file" "${file%}.fastq.gz"
done


for file in *.fas.fastq.gz
do
  mv "$file" "${file}.fastq.gz"
done

for file in *.fastq.gz?

do
  mv "$file" "${file}.fastq.gz"
done



mv P24A_R1.fastq.g  P24A_R1.fastq.gz
mv P24A_R2.fastq.g  P24A_R2.fastq.gz

mv P17B_R1.fastq.gz?.fastq.gz P17B_R1.fastq.gz 

mv P1C_R1.fastq.gz?.fastq.gz P1C_R1.fastq.

mv P20C_R2.fa.txt.fastq.gz P20C_R2.fastq.gz 

mv P21B_R1.fastq.gz?.fastq.gz P21B_R1.fastq.gz

mv P24B_R1.fastq.gz?.fastq.gz P24B_R1.fastq.gz

mv P24B_R2.fastq.g P24B_R2.fastq.gz 

mv P2B_R2.fastq.gz?.fastq.gz P2B_R2.fastq.gz 

mv P3A_R1.fastq.gz?.fastq.gz P3A_R1.fastq.gz

mv P3B_R2.fastq.gz?.fastq.gz P3B_R2.fastq.gz

mv P4A_R1.fastq.gz?.fastq.gz P4A_R1.fastq.gz 

mv P4C_R2.fastq.gz?.fastq.gz P4C_R2.fastq.gz

mv Plant_1A_R1.fast Plant_1A_R1.fastq.gz
mv Plant_1A_R2.fast Plant_1A_R2.fastq.gz
mv Plant_1B_R1.fast Plant_1B_R1.fastq.gz
mv Plant_1B_R2.fast Plant_1B_R2.fastq.gz
mv Plant_1C_R1.fast Plant_1C_R1.fastq.gz
mv Plant_1C_R2.fast Plant_1C_R2.fastq.gz
mv Plant_2B_R Plant_2B_R1.fastq.gz
mv Plant_2B_R2.fastq.gz?.fastq.gz Plant_2B_R2.fastq.gz
mv Plant_2C_R1.fast Plant_2C_R1.fastq.gz
mv Plant_2C_R2.fas.fastq.gz.fastq.gz Plant_2C_R2.fastq.gz
mv Plant_3B_R1.fas.fastq.gz.fastq.gz Plant_3B_R1.fastq.gz
mv Plant_3C_R1.fas.fastq.gz.fastq.gz Plant_3C_R1.fastq.gz
mv Plant_3C_R2.fast Plant_3C_R2.fastq.gz
mv Plant_4A_R1.fast Plant_4A_R1.fastq.gz
mv Plant_4A_R2.fas.fastq.gz.fastq.gz Plant_4A_R2.fastq.gz
mv Plant_4B_R1.fas.fastq.gz.fastq.gz Plant_4B_R1.fastq.gz
mv Plant_4B_R2.fastq.gz?.fastq.gz Plant_4B_R2.fastq.gz
mv Plant_4C_R1.fastq.gz?.fastq.gz Plant_4C_R1.fastq.gz
mv Plant_4C_R2.fas.fastq.gz.fastq.gz Plant_4C_R2.fastq.gz
mv Plant_3B_R2.fastq.gz?.fastq.gz Plant_3B_R2.fastq.gz







#copy forward reads and reverse reads into sep folders
cp *R1.fastq.gz files_R1
cp *R2.fastq.gz files_R2


## run fastqc on both

fastqc * -o fastqc

# run multiqc on contents of both folders
multiqc *




## download html files
scp cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/SRR12114558_1_fastqc.html cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/SRR12114558_2_fastqc.html /drives/c/Users/gamro07p/Documents/Transcriptomics/Tutorial_08_03_23/data