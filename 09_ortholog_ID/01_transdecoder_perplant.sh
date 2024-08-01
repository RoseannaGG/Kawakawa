
# transdecoder identifies Potential Protein-Coding Regions

# So, the script essentially runs TransDecoder's LongOrfs module on each file in the current directory whose name ends with "a". It identifies the longest ORFs in each of these nucleotide sequence files, considering only those with a length of 50 or more amino acids. This is typically done as a preliminary step in transcriptome analysis to identify potential protein-coding regions within mRNA transcripts.

# Potential Protein-Coding Regions: ORFs represent regions within nucleotide sequences that have the potential to encode proteins. Identifying the longest ORFs helps in identifying potential protein-coding regions within transcripts or genomic sequences. This is particularly important in transcriptomic analysis, where RNA-seq data is used to study gene expression and protein-coding potential.

# Open reading frames (ORFs) are stretches of nucleotide sequences within DNA or RNA that can be translated into proteins. The term "open" implies that the reading frame starts with a start codon (usually AUG, encoding methionine) and ends with a stop codon (e.g., UAA, UAG, or UGA) without encountering an in-frame stop codon in between. Here's a breakdown of the concept



#copy all files into new folder
cp /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/*.Trinity.fasta /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant

#run transdecoder

for file in *a; do /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t $file -m 50; done

screen -r 27420

screen

for file in *a; do /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t $file --single_best_only; done

screen -r 104460

"-round: 2
-round: 3
-round: 4
-round: 5
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/feature_scores_to_ROC.pl trinity_Plant_4.Trinity.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores > trinity_Plant_4.Trinity.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc
-parsing scores
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/plot_ROC.Rscript trinity_Plant_4.Trinity.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc || :
null device
          1
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/compute_AUC.pl trinity_Plant_4.Trinity.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc
null device
          1
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/make_seqLogo.Rscript trinity_Plant_4.Trinity.fasta.transdecoder_dir/start_refinement.enhanced.+.pwm || :
Error in library(seqLogo) : there is no package called 'seqLogo'
Execution halted
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/start_codon_refinement.pl --transcripts trinity_Plant_4.Trinity.fasta --gff3_file trinity_Plant_4.Trinity.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3 --workdir trinity_Plant_4.Trinity.fasta.transdecoder_dir > trinity_Plant_4.Trinity.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3.revised_starts.gff3
Refining start codon selections.
-number of revised start positions: 5028
* Running CMD: cp trinity_Plant_4.Trinity.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3.revised_starts.gff3 trinity_Plant_4.Trinity.fasta.transdecoder.gff3
copying output to final output file: trinity_Plant_4.Trinity.fasta.transdecoder.gff3* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_bed.pl trinity_Plant_4.Trinity.fasta.transdecoder.gff3 > trinity_Plant_4.Trinity.fasta.transdecoder.bed
Making bed file: trinity_Plant_4.Trinity.fasta.transdecoder.bed
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_proteins.pl --gff3 trinity_Plant_4.Trinity.fasta.transdecoder.gff3 --fasta trinity_Plant_4.Trinity.fasta  --genetic_code Universal > trinity_Plant_4.Trinity.fasta.transdecoder.pep
Making pep file: trinity_Plant_4.Trinity.fasta.transdecoder.pep
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_proteins.pl --gff3 trinity_Plant_4.Trinity.fasta.transdecoder.gff3 --fasta trinity_Plant_4.Trinity.fasta --seqType CDS  --genetic_code Universal > trinity_Plant_4.Trinity.fasta.transdecoder.cds
Making cds file: trinity_Plant_4.Trinity.fasta.transdecoder.cds
transdecoder is finished.  See output files trinity_Plant_4.Trinity.fasta.transdecoder.*

"


## rename files

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant

# download seqkit - copy and paste into terminal
wget https://github.com/shenwei356/seqkit/releases/download/v0.4.0/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz
mkdir -p ~/bin
mv seqkit ~/bin

# works on one - to rename sequence headers
seqkit replace trinity_Plant_4.Trinity.fasta.transdecoder.pep -p "(.+)" -r "Plant_4_{nr}" > Plant_4.trans.pep

#check worked
head -n 50 Plant_4.trans.pep

#write as Loop
#!/bin/bash

# Define the sample name list
sample_names=("P1" "P2" "P3" "P4" "P13" "P14" "P15" "P16" "P17" "P18" "P19" "P20" "P21" "P22" "P23" "P24" "Plant_1" "Plant_2" "Plant_3" "Plant_4")

# Loop through each sample name
for sample_name in "${sample_names[@]}"; do
    # Perform the replacement and redirect output to a new file
    seqkit replace "trinity_${sample_name}.Trinity.fasta.transdecoder.pep" -p "(.+)" -r "${sample_name}_{nr}" > "${sample_name}.trans.pep"
done



# write as Loop cds
#!/bin/bash

# Define the sample name list
sample_names=("P1" "P2" "P3" "P4" "P13" "P14" "P15" "P16" "P17" "P18" "P19" "P20" "P21" "P22" "P23" "P24" "Plant_1" "Plant_2" "Plant_3" "Plant_4")

# Loop through each sample name
for sample_name in "${sample_names[@]}"; do
    # Perform the replacement and redirect output to a new file
    seqkit replace "trinity_${sample_name}.Trinity.fasta.transdecoder.cds" -p "(.+)" -r "${sample_name}_{nr}" > "${sample_name}.trans.cds"
done


