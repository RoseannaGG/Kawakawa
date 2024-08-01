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


###########################
### EviGene ########
################################
# get rid of replicates - clean up transcriptome


mkdir Evigene

# copy fasta
cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/

cd /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/

export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/evigene

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin

screen

perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity_kawakawa.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=kawakawa

screen -r 115608

"
bash-4.2$ perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity_kawakawa.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=kawakawa
Use of uninitialized value $okaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 814.
Use of uninitialized value $altaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 815.
#readPubidTab(publicset/trinity_kawakawa.Trinity.pubids)= 324742
# nin=1154728, nok=469945, nfrag=1248, nskipnotloc=659904, nskipdupfrag=8771, nskipdiffloc=14860
#insertUniqExons= 2004
#collectExonChains= 322977 of 323574 ids
#assignChainLoci
#n_class: ichain=279592 icalt=34508 icsub=8877 icdup=597
#n_alts : t1=279592 t2=20605 t3=7406 t4=3562 t5=1614 t6=725 t7=302 t8=150 t9=68 t10=29 t11=19 t12=11 t13=8 t14=4 t15=3 t16=1 t17=1 t18=0 t19=0 t20=0
Use of uninitialized value $okaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 814.
Use of uninitialized value $altaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 815.
#egr: FATAL Missing mrna
"

###############################
### stats on transcriptome ###
#####################################

# copy fasta
cp /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr /Volumes/archive/kennylab/roseanna_kawakawa/assembly_assessment/

screen
perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/roseanna_kawakawa/assembly_assessment/trinity_kawakawa.Trinity.okay.tr


"########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 3444
        Contig N20: 2269
        Contig N30: 1493
        Contig N40: 854
        Contig N50: 552

        Median contig length: 335
        Average contig: 524.01
        Total assembled bases: 135151439


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 3345
        Contig N20: 2147
        Contig N30: 1310
        Contig N40: 701
        Contig N50: 498

        Median contig length: 329
        Average contig: 497.61
        Total assembled bases: 121277471

"


#########################
# blastx ################
#########################
cd /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/

mkdir diamond_evigene

cp /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/

mkdir xml txt


## xml file
cd /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/xml


cp /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/xml/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity_kawakawa.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.xml --threads 24 --max-target-seqs 1 --outfmt 5 --more-sensitive

screen -r 360643


## txt file
cd /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/txt/


cp /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr /Volumes/archive/kennylab/roseanna_kawakawa/diamond_evigene/txt/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity_kawakawa.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.txt --threads 24 --max-target-seqs 1 --outfmt 6 qseqid sseqid bitscore --more-sensitive


screen -r 304109