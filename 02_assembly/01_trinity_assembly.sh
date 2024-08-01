############################
### 03_assembly ############
############################


cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity -h



#test
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left P13A_R1_PE.fastq.gz,P14C_R1_PE.fastq.gz,P16B_R1_PE.fastq.gz,P18B_R1_PE.fastq.gz,P1A_R1_PE.fastq.gz --right P13A_R2_PE.fastq.gz,P14C_R2_PE.fastq.gz,P16B_R2_PE.fastq.gz,P18B_R2_PE.fastq.gz,P1A_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --output trinity_kawakawa


## do for real

screen

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left P13A_R1_PE.fastq.gz,P17A_R1_PE.fastq.gz,P20A_R1_PE.fastq.gz,P24A_R1_PE.fastq.gz,Plant_1A_R1_PE.fastq.gz,P13B_R1_PE.fastq.gz,P17B_R1_PE.fastq.gz,P20C_R1_PE.fastq.gz,P24B_R1_PE.fastq.gz,Plant_1B_R1_PE.fastq.gz,P13C_R1_PE.fastq.gz,P17C_R1_PE.fastq.gz,P21A_R1_PE.fastq.gz,P24C_R1_PE.fastq.gz,Plant_1C_R1_PE.fastq.gz,P14A_R1_PE.fastq.gz,P18A_R1_PE.fastq.gz,P21B_R1_PE.fastq.gz,P2A_R1_PE.fastq.gz,Plant_2B_R1_PE.fastq.gz,P14B_R1_PE.fastq.gz,P18B_R1_PE.fastq.gz,P21C_R1_PE.fastq.gz,P2B_R1_PE.fastq.gz,Plant_2C_R1_PE.fastq.gz,P14C_R1_PE.fastq.gz,P18C_R1_PE.fastq.gz,P22A_R1_PE.fastq.gz,P2C_R1_PE.fastq.gz,Plant_3B_R1_PE.fastq.gz,P15A_R1_PE.fastq.gz,P19A_R1_PE.fastq.gz,P22B_R1_PE.fastq.gz,P3A_R1_PE.fastq.gz,Plant_3C_R1_PE.fastq.gz,P15B_R1_PE.fastq.gz,P19B_R1_PE.fastq.gz,P22C_R1_PE.fastq.gz,P3B_R1_PE.fastq.gz,Plant_4A_R1_PE.fastq.gz,P15C_R1_PE.fastq.gz,P19C_R1_PE.fastq.gz,P23A_R1_PE.fastq.gz,P3C_R1_PE.fastq.gz,P16A_R1_PE.fastq.gz,P1A_R1_PE.fastq.gz,P23B_R1_PE.fastq.gz,P4A_R1_PE.fastq.gz,P16B_R1_PE.fastq.gz,P1C_R1_PE.fastq.gz,P23C_R1_PE.fastq.gz,P4C_R1_PE.fastq.gz,Plant_4B_R1_PE.fastq.gz,Plant_4C_R1_PE.fastq.gz --right P13A_R2_PE.fastq.gz,P17A_R2_PE.fastq.gz,P20A_R2_PE.fastq.gz,P24A_R2_PE.fastq.gz,Plant_1A_R2_PE.fastq.gz,P13B_R2_PE.fastq.gz,P17B_R2_PE.fastq.gz,P20C_R2_PE.fastq.gz,P24B_R2_PE.fastq.gz,Plant_1B_R2_PE.fastq.gz,P13C_R2_PE.fastq.gz,P17C_R2_PE.fastq.gz,P21A_R2_PE.fastq.gz,P24C_R2_PE.fastq.gz,Plant_1C_R2_PE.fastq.gz,P14A_R2_PE.fastq.gz,P18A_R2_PE.fastq.gz,P21B_R2_PE.fastq.gz,P2A_R2_PE.fastq.gz,Plant_2B_R2_PE.fastq.gz,P14B_R2_PE.fastq.gz,P18B_R2_PE.fastq.gz,P21C_R2_PE.fastq.gz,P2B_R2_PE.fastq.gz,Plant_2C_R2_PE.fastq.gz,P14C_R2_PE.fastq.gz,P18C_R2_PE.fastq.gz,P22A_R2_PE.fastq.gz,P2C_R2_PE.fastq.gz,Plant_3B_R2_PE.fastq.gz,P15A_R2_PE.fastq.gz,P19A_R2_PE.fastq.gz,P22B_R2_PE.fastq.gz,P3A_R2_PE.fastq.gz,Plant_3C_R2_PE.fastq.gz,P15B_R2_PE.fastq.gz,P19B_R2_PE.fastq.gz,P22C_R2_PE.fastq.gz,P3B_R2_PE.fastq.gz,Plant_4A_R2_PE.fastq.gz,P15C_R2_PE.fastq.gz,P19C_R2_PE.fastq.gz,P23A_R2_PE.fastq.gz,P3C_R2_PE.fastq.gz,P16A_R2_PE.fastq.gz,P1A_R2_PE.fastq.gz,P23B_R2_PE.fastq.gz,P4A_R2_PE.fastq.gz,P16B_R2_PE.fastq.gz,P1C_R2_PE.fastq.gz,P23C_R2_PE.fastq.gz,P4C_R2_PE.fastq.gz,Plant_4B_R2_PE.fastq.gz,Plant_4C_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF --output trinity_kawakawa

Crtl +A+D #to exit

screen -r #to reattach

## move outputs to assembly folder

mv trinity_kawakawa.Trinity.fasta* /Volumes/archive/kennylab/roseanna_kawakawa/assembly

## delete extra trinity files

rm -r trinity_kawakawa



####################
### statistics ######
#############
# quality of transcriptome

mkdir assembly_assessment

# copy fasta
cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta /Volumes/archive/kennylab/roseanna_kawakawa/assembly_assessment/

perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/roseanna_kawakawa/assembly_assessment/trinity_kawakawa.Trinity.fasta

"########################################
# Stats based on ALL transcript contigs:
########################################

        Contig N10: 4124
        Contig N20: 2911
        Contig N30: 2074
        Contig N40: 1307
        Contig N50: 648

        Median contig length: 278
        Average contig: 510.09
        Total assembled bases: 444037971


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 2943
        Contig N20: 1072
        Contig N30: 520
        Contig N40: 397
        Contig N50: 334

        Median contig length: 264
        Average contig: 365.90
        Total assembled bases: 263350859"

