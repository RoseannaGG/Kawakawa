

# get to root

cd ~

cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene


screen 


curl http://data.biostarhandbook.com/install.sh | bash

screen -r 


source ~/.bash_profile


roseannagamlen-greene@biochemcompute1 ~
$ conda create -n busco
Empty environment created at prefix: /Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/busco

roseannagamlen-greene@biochemcompute1 ~
$ conda activate busco
(busco)
roseannagamlen-greene@biochemcompute1 ~
$

$ conda install -c bioconda busco

$ busco
usage: python BUSCO.py -i [SEQUENCE_FILE] -l [LINEAGE] -o [OUTPUT_NAME] -m [MODE] [OTHER OPTIONS]
busco: error: the following arguments are required: -i/--in, -o/--out, -m/--mode, -l/--lineage
(busco)

# location of plant genes
https://busco-archive.ezlab.org/frame_plants.html

https://busco-archive.ezlab.org/datasets/prerelease/viridiplantae_odb10.tar.gz

cd /Volumes/archive/kennylab/roseanna_kawakawa/

# install plant dataset to compare

mkdir plant_gene_db

cd /Volumes/archive/kennylab/roseanna_kawakawa/plant_gene_db/
wget https://busco-archive.ezlab.org/datasets/prerelease/viridiplantae_odb10.tar.gz

tar -zxvf viridiplantae_odb10.tar.gz


### run busco on transcriptomes that haven't been annotated or indexed

## run on evigene version
conda activate busco


cd /Volumes/archive/kennylab/roseanna_kawakawa/busco_evigene/

screen


busco -i /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta \
-l /Volumes/archive/kennylab/roseanna_kawakawa/plant_gene_db/viridiplantae_odb10/ \
-o kawakawa_evigene_busco.out \
-m tran

screen -r 59503

"$ cat short_summary_kawakawa_evigene_busco.out.txt
# BUSCO version is: 2.0
# The lineage dataset is: viridiplantae_odb10 (Creation date: 2017-12-01, number of species: 72, number of BUSCOs: 430)
# To reproduce this run: python /Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/busco/bin/busco -i /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta -o kawakawa_evigene_busco.out -l /Volumes/archive/kennylab/roseanna_kawakawa/plant_gene_db/viridiplantae_odb10/ -m tran -c 1 -sp arabidopsis
#
# Summarized benchmarking in BUSCO notation for file /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta
# BUSCO was run in mode: tran

        C:87.5%[S:83.5%,D:4.0%],F:9.8%,M:2.7%,n:430

        376     Complete BUSCOs (C)
        359     Complete and single-copy BUSCOs (S)
        17      Complete and duplicated BUSCOs (D)
        42      Fragmented BUSCOs (F)
        12      Missing BUSCOs (M)
        430     Total BUSCO groups searched
"

"
_evigene_busco.out/blast_output/tblastn_kawakawa_evigene_busco.out.tsv...
INFO    ****** Step 2/2, current time: 11/09/2023 17:14:00 ******
INFO    Getting coordinates for candidate transcripts...
INFO    Extracting candidate transcripts...
INFO    Translating candidate transcripts...
INFO    Running HMMER to confirm transcript orthology:
INFO    11/09/2023 17:14:10 =>  0% of predictions performed (820 to be done)
INFO    11/09/2023 17:14:17 =>  10% of predictions performed (83/820 candidate proteins)
INFO    11/09/2023 17:14:23 =>  20% of predictions performed (165/820 candidate proteins)
INFO    11/09/2023 17:14:31 =>  30% of predictions performed (247/820 candidate proteins)
INFO    11/09/2023 17:14:38 =>  40% of predictions performed (329/820 candidate proteins)
INFO    11/09/2023 17:14:45 =>  50% of predictions performed (411/820 candidate proteins)
INFO    11/09/2023 17:14:53 =>  60% of predictions performed (493/820 candidate proteins)
INFO    11/09/2023 17:15:02 =>  70% of predictions performed (575/820 candidate proteins)
INFO    11/09/2023 17:15:10 =>  80% of predictions performed (657/820 candidate proteins)
INFO    11/09/2023 17:15:18 =>  90% of predictions performed (739/820 candidate proteins)
INFO    11/09/2023 17:15:27 =>  100% of predictions performed
INFO    Results:
INFO    C:87.5%[S:83.5%,D:4.0%],F:9.8%,M:2.7%,n:430
INFO    376 Complete BUSCOs (C)
INFO    359 Complete and single-copy BUSCOs (S)
INFO    17 Complete and duplicated BUSCOs (D)
INFO    42 Fragmented BUSCOs (F)
INFO    12 Missing BUSCOs (M)
INFO    430 Total BUSCO groups searched

INFO    BUSCO analysis done. Total running time: 1881.5886430740356 seconds
INFO    Results written in /Volumes/archive/kennylab/roseanna_kawakawa/busco_evigene/run_kawakawa_evigene_busco.out/

"

## run on original version
conda activate busco


cd /Volumes/archive/kennylab/roseanna_kawakawa/busco_original/

screen


busco -i /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta \
-l /Volumes/archive/kennylab/roseanna_kawakawa/plant_gene_db/viridiplantae_odb10/ \
-o kawakawa_original_busco.out \
-m tran

screen -r 81712

"$ cat short_summary_kawakawa_original_busco.out.txt
# BUSCO version is: 2.0
# The lineage dataset is: viridiplantae_odb10 (Creation date: 2017-12-01, number of species: 72, number of BUSCOs: 430)
# To reproduce this run: python /Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/busco/bin/busco -i /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta -o kawakawa_original_busco.out -l /Volumes/archive/kennylab/roseanna_kawakawa/plant_gene_db/viridiplantae_odb10/ -m tran -c 1 -sp arabidopsis
#
# Summarized benchmarking in BUSCO notation for file /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta
# BUSCO was run in mode: tran

        C:90.3%[S:39.1%,D:51.2%],F:8.1%,M:1.6%,n:430

        388     Complete BUSCOs (C)
        168     Complete and single-copy BUSCOs (S)
        220     Complete and duplicated BUSCOs (D)
        35      Fragmented BUSCOs (F)
        7       Missing BUSCOs (M)
        430     Total BUSCO groups searched
"

''
"
a_original_busco.out/blast_output/tblastn_kawakawa_original_busco.out.tsv...
INFO    ****** Step 2/2, current time: 11/09/2023 18:25:29 ******
INFO    Getting coordinates for candidate transcripts...
INFO    Extracting candidate transcripts...
INFO    Translating candidate transcripts...
INFO    Running HMMER to confirm transcript orthology:
INFO    11/09/2023 18:26:02 =>  0% of predictions performed (1176 to be done)
INFO    11/09/2023 18:26:10 =>  10% of predictions performed (118/1176 candidate proteins)
INFO    11/09/2023 18:26:18 =>  20% of predictions performed (236/1176 candidate proteins)
INFO    11/09/2023 18:26:28 =>  30% of predictions performed (353/1176 candidate proteins)
INFO    11/09/2023 18:26:38 =>  40% of predictions performed (471/1176 candidate proteins)
INFO    11/09/2023 18:26:49 =>  50% of predictions performed (589/1176 candidate proteins)
INFO    11/09/2023 18:26:58 =>  60% of predictions performed (706/1176 candidate proteins)
INFO    11/09/2023 18:27:11 =>  70% of predictions performed (824/1176 candidate proteins)
INFO    11/09/2023 18:27:25 =>  80% of predictions performed (941/1176 candidate proteins)
INFO    11/09/2023 18:27:38 =>  90% of predictions performed (1059/1176 candidate proteins)
INFO    11/09/2023 18:27:52 =>  100% of predictions performed
INFO    Results:
INFO    C:90.3%[S:39.1%,D:51.2%],F:8.1%,M:1.6%,n:430
INFO    388 Complete BUSCOs (C)
INFO    168 Complete and single-copy BUSCOs (S)
INFO    220 Complete and duplicated BUSCOs (D)
INFO    35 Fragmented BUSCOs (F)
INFO    7 Missing BUSCOs (M)
INFO    430 Total BUSCO groups searched

INFO    BUSCO analysis done. Total running time: 5973.964748620987 seconds
INFO    Results written in /Volumes/archive/kennylab/roseanna_kawakawa/busco_original/run_kawakawa_original_busco.out/

"

## busco for eukayotes

 #install plant dataset to compare

mkdir eukaryota_gene_db

cd /Volumes/archive/kennylab/roseanna_kawakawa/eukaryota_gene_db/
wget https://busco-archive.ezlab.org/datasets/eukaryota_odb9.tar.gz

tar -zxvf eukaryota_odb9.tar.gz

cd busco_eu_evigene

conda activate busco


screen
busco -i /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta \
-l /Volumes/archive/kennylab/roseanna_kawakawa/eukaryota_gene_db/eukaryota_odb9/ \
-o kawakawa_evigene_eukaryota_busco.out \
-m tran
screen -r 192411



cd busco_eu_original

conda activate busco

screen
busco -i /Volumes/archive/kennylab/roseanna_kawakawa/assembly/trinity_kawakawa.Trinity.fasta \
-l /Volumes/archive/kennylab/roseanna_kawakawa/eukaryota_gene_db/eukaryota_odb9/ \
-o kawakawa_original_eukaryota_busco.out \
-m tran
screen -r 274227
