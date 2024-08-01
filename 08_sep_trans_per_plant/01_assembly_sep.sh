
## generate list of groups
Group 1:
P1A P1C
Group 2:
P2A P2B P2C
Group 3:
P3A P3B P3C
Group 4:
P4A P4C
Group 5:
P24A P24B P24C
Group 6:
P22A P22B P22C
Group 7:
P23A P23B P23C
Group 8:
P20A P20C
Group 9:
P21A P21B P21C
Group 10:
P13A P13B P13C
Group 11:
P17A P17B P17C
Group 12:
P16A P16B
Group 13:
P15A P15B P15C
Group 14:
P14A P14B P14C
Group 15:
P19A P19B P19C
Group 16:
P18A P18B P18C
Group 17:
Plant_4A Plant_4B Plant_4C
Group 18:
Plant_2B Plant_2C
Group 19:
Plant_3B Plant_3C
Group 20:
Plant_1A Plant_1B Plant_1C



screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/

#For Group 1:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P1A_R1_PE.fastq.gz,P1C_R1_PE.fastq.gz \
--right P1A_R2_PE.fastq.gz,P1C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P1

screen -r 435406

screen

#For Group 2:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P2A_R1_PE.fastq.gz,P2B_R1_PE.fastq.gz,P2C_R1_PE.fastq.gz \
--right P2A_R2_PE.fastq.gz,P2B_R2_PE.fastq.gz,P2C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P2

screen -r 436125

screen

#For Group 3:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P3A_R1_PE.fastq.gz,P3B_R1_PE.fastq.gz,P3C_R1_PE.fastq.gz \
--right P3A_R2_PE.fastq.gz,P3B_R2_PE.fastq.gz,P3C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P3

screen -r 436620

screen

#For Group 4:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P4A_R1_PE.fastq.gz,P4C_R1_PE.fastq.gz \
--right P4A_R2_PE.fastq.gz,P4C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P4

screen -r 437110



#For Group 5:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P24A_R1_PE.fastq.gz,P24B_R1_PE.fastq.gz,P24C_R1_PE.fastq.gz \
--right P24A_R2_PE.fastq.gz,P24B_R2_PE.fastq.gz,P24C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P24

screen -r 437819

screen

#For Group 6:

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P19A_R1_PE.fastq.gz,P19B_R1_PE.fastq.gz,P19C_R1_PE.fastq.gz \
--right P19A_R2_PE.fastq.gz,P19B_R2_PE.fastq.gz,P19C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P19

screen -r 441232


screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/
# Group 7
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P22A_R1_PE.fastq.gz,P22B_R1_PE.fastq.gz,P22C_R1_PE.fastq.gz \
--right P22A_R2_PE.fastq.gz,P22B_R2_PE.fastq.gz,P22C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P22

screen -r 218129




screen 
cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 8
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P23A_R1_PE.fastq.gz,P23B_R1_PE.fastq.gz,P23C_R1_PE.fastq.gz \
--right P23A_R2_PE.fastq.gz,P23B_R2_PE.fastq.gz,P23C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P23


screen -r 224751




screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/

# Group 9
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P20A_R1_PE.fastq.gz,P20C_R1_PE.fastq.gz \
--right P20A_R2_PE.fastq.gz,P20C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P20


screen -r 226015




screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 10
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P21A_R1_PE.fastq.gz,P21B_R1_PE.fastq.gz,P21C_R1_PE.fastq.gz \
--right P21A_R2_PE.fastq.gz,P21B_R2_PE.fastq.gz,P21C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P21

screen -r 229398



screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/



# Group 11
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P13A_R1_PE.fastq.gz,P13B_R1_PE.fastq.gz,P13C_R1_PE.fastq.gz \
--right P13A_R2_PE.fastq.gz,P13B_R2_PE.fastq.gz,P13C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P13

screen -r 229911




screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 12
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P17A_R1_PE.fastq.gz,P17B_R1_PE.fastq.gz,P17C_R1_PE.fastq.gz \
--right P17A_R2_PE.fastq.gz,P17B_R2_PE.fastq.gz,P17C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P17

screen -r 191856




screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 13
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P16A_R1_PE.fastq.gz,P16B_R1_PE.fastq.gz \
--right P16A_R2_PE.fastq.gz,P16B_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P16

screen -r 358669

screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 14
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P15A_R1_PE.fastq.gz,P15B_R1_PE.fastq.gz,P15C_R1_PE.fastq.gz \
--right P15A_R2_PE.fastq.gz,P15B_R2_PE.fastq.gz,P15C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P15

screen -r 174187


screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 15
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P14A_R1_PE.fastq.gz,P14B_R1_PE.fastq.gz,P14C_R1_PE.fastq.gz \
--right P14A_R2_PE.fastq.gz,P14B_R2_PE.fastq.gz,P14C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P14

screen -r 174826



screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 16
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left P18A_R1_PE.fastq.gz,P18B_R1_PE.fastq.gz,P18C_R1_PE.fastq.gz \
--right P18A_R2_PE.fastq.gz,P18B_R2_PE.fastq.gz,P18C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_P18

screen -r 176210

screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 17
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left Plant_4A_R1_PE.fastq.gz,Plant_4B_R1_PE.fastq.gz,Plant_4C_R1_PE.fastq.gz \
--right Plant_4A_R2_PE.fastq.gz,Plant_4B_R2_PE.fastq.gz,Plant_4C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_Plant_4

screen -r 176781


screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 18
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left Plant_2B_R1_PE.fastq.gz,Plant_2C_R1_PE.fastq.gz \
--right Plant_2B_R2_PE.fastq.gz,Plant_2C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_Plant_2

screen -r 177246

screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


# Group 19
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left Plant_3B_R1_PE.fastq.gz,Plant_3C_R1_PE.fastq.gz \
--right Plant_3B_R2_PE.fastq.gz,Plant_3C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_Plant_3

screen -r 177667


screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/

# Group 20
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity \
--seqType fq \
--max_memory 512G \
--left Plant_1A_R1_PE.fastq.gz,Plant_1B_R1_PE.fastq.gz,Plant_1C_R1_PE.fastq.gz \
--right Plant_1A_R2_PE.fastq.gz,Plant_1B_R2_PE.fastq.gz,Plant_1C_R2_PE.fastq.gz \
--CPU 32 \
--min_contig_length 200 \
--normalize_max_read_cov 50 \
--full_cleanup \
--verbose \
--SS_lib_type RF \
--output trinity_Plant_1

screen -r 178219

# e.g. file name trinity_Plant_2.Trinity.fasta
