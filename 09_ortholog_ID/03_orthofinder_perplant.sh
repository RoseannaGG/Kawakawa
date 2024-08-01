
### trying to identitfy and cluster orthologous genes together


# Overall, this command configures OrthoFinder to perform orthology inference and comparative genomics analysis on protein sequences using specified methods for sequence alignment, phylogenetic tree inference, and clustering. It leverages parallel processing to speed up computation and provides options for customizing the analysis parameters.

#Grouping Orthologs: Clustering helps identify orthologous genes or proteins, which are genes or proteins that evolved from a common ancestral gene via speciation events. By clustering sequences based on sequence similarity, orthologous genes from different species can be grouped together in the same cluster.

#Identifying Paralogs: In addition to orthologs, clustering also identifies paralogous genes or proteins, which are genes that arose from gene duplication events within a species. Paralogs are often clustered together in distinct clusters separate from orthologs.

#Defining Orthologous Groups: The clusters generated during the clustering process represent orthologous groups, where each group contains orthologs from multiple species or strains. These orthologous groups provide a framework for comparing gene or protein evolution across different lineages.

#Functional Inference: Clustering helps in inferring the functions of genes or proteins based on the principle of orthology. Genes or proteins within the same orthologous group are more likely to have similar functions, allowing researchers to transfer functional annotations from well-characterized genes to orthologs with unknown functions.

#Evolutionary Analysis: Clustering facilitates comparative genomics analysis by enabling the study of gene or protein evolution across different species or strains. By comparing orthologous groups, researchers can identify evolutionary changes, such as gene family expansions or contractions, and infer the evolutionary history of genes or proteins.





cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

# copy piper genome into folder


# copy all renamed .pep transdecoder outputs into fodler

#copy all files into new folder
cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/*trans.pep /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

# change all extensions of all .pep files to .fa

# rename locus names of ref

seqkit replace Piper_nigrum_old.fa -p "(.+)" -r "Pn_{nr}" > Piper_nigrum.fa




## set path of all programs orthofinder will call on - paste at bottom

nano ~/.bashrc

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/MAFFT/libexec/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/mafft

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/iqtree-1.6.12-Linux/bin/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder


crtl x and then y then enter



cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/Piper

# investigate ref Pn23.504
head -n 50 Piper_nigrum.fa

">Pn23.504
MMKWPLLSPIGFLFTLPIHIPRAKHGLPHFIRPASAFVDFEQTGELSSPSPLQLANLPLQLSRAELGPAD
LSRAASGSFIGGPQYKLGTAFSAGFGSRGAVRRGPPTSCPVRSHLPSIVFAFTGLDMPPSLPGTPSAPP"

# replace full stop with underscore Pn23_504
cat Piper_nigrum.fa | sed 's/\./_/g' > PiperV4.fa

# add | after Pn (Pn -> Pn|) Pn|23_504
 cat PiperV4.fa | sed 's/>Pn\(.*\)/>Pn|\1/g' > PiperV5.fa


# investigate ref
head -n 50 PiperV5.fa

">Pn|23_504
MMKWPLLSPIGFLFTLPIHIPRAKHGLPHFIRPASAFVDFEQTGELSSPSPLQLANLPLQLSRAELGPAD
LSRAASGSFIGGPQYKLGTAFSAGFGSRGAVRRGPPTSCPVRSHLPSIVFAFTGLDMPPSLPGTPSAPP
"


### RENAME FILES AND HEADERS TO HOW I WANT THEM LATER!! 
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/
mkdir renamedfa

cp *.fa ./renamedfa

# rename Plant... files by hand
mv Plant_1.trans.fa Plant1.fa
mv Plant_2.trans.fa Plant2.fa
mv Plant_3.trans.fa Plant3.fa
mv Plant_4.trans.fa Plant4.fa

# loop through other files

for file in P*.trans.fa; do
    new_file=$(echo "$file" | sed 's/\.trans\.fa$/.fa/')
    mv "$file" "$new_file"
done

# inside of those files look good... now try inside of Plant1 etc... needs renaming 

for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/Plant_/Plant/g' "$file"
    fi
done


cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa/* /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/


### Now rename all P1 and plant1 files to be P1| rather than P1_ in the headers...

tail P4.fa
">P4_43150
FNYHLLAIALQVSISVQPLKVKNWILPEMPGLITDFLISLDDRFLYFVNWLHGDIRQYNI
EDPTKPALAGQIWVGGLLQKGSNVFVITEDGQDFQFEVPEIQGHRLRGGPQMIQLSLDGK
RLYVTNSLFSTWDRQFYPELVEKGAHMLQIDVDTEKGGLAINPNFFVDFGSEPDGPSLAH
EMRYPGGDCTSDIWI*
"

cat P4.fa | sed 's/_/|/g' > P4_test.fa



## works...now do as a loop and overwrite original

for file in *.fa; do
    sed -i 's/_/|/g' "$file"
done

">P4|43150
FNYHLLAIALQVSISVQPLKVKNWILPEMPGLITDFLISLDDRFLYFVNWLHGDIRQYNI
EDPTKPALAGQIWVGGLLQKGSNVFVITEDGQDFQFEVPEIQGHRLRGGPQMIQLSLDGK
RLYVTNSLFSTWDRQFYPELVEKGAHMLQIDVDTEKGGLAINPNFFVDFGSEPDGPSLAH
EMRYPGGDCTSDIWI*
"

## get correct version of Pn file in folder...
rm -f Pn.fa

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/Piper/PiperV5.fa /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/

#rename Pn file...

mv PiperV5.fa Pn.fa


## DOUBLE CHECK THERE'S ONLY THE VERSIONS OF THE FILES YOU WANT
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders

ls

## rm file 
P4_test.fa

# run orthofinder on dataset that had been renamed

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders

screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders


screen -r 163109

"
2024-07-12 22:48:35 : Done 96000 of 98152
2024-07-12 22:48:45 : Done 97000 of 98152
2024-07-12 22:48:54 : Done 98000 of 98152
ERROR: Species tree inference failed
ERROR: An error occurred, ***please review the error messages*** they may contain useful information about the problem.
"


## bad verison, forgot to delete P4_test.fa before running
screen -r 268951


# results here

/Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/OrthoFinder/


## try again - this time only renamed Pn.fa... 

screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/headersrenamed

screen -r 21893


## also running this one... unsure what's different

screen -r 163109


### try again... but use "-" instead of "|" for Pn.fa


cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed



# add | after Pn (Pn -> Pn|) Pn|23_504
 cat Pn.fa | sed 's/|/-/g' > Pn.fa

screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed

screen -r 36472


### RUN ORTHOFINDER ON BLAST RESULTS

screen


/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -b /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory -t 64 -a 16 -T iqtree -M msa

screen -r 21085

# results

/Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/OrthoFinder/Results_Jul18_1/

"cat OG0011996.fa
>P13_33997
MAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNYSFVPYLHEICHR
*
>P14_59311
MDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSL
IVGLACNLKKLDISRNYSNYQISDDGLCKLSLAKCISNLSSLSLCGMAGITDKGVILLVC
VYHC*
>P14_59312
MDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSL
IVGLACNLKKLDIASAT*
>P14_59313
MDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSL
IVGLACNLKKLDILLIYGAAAI*
>P18_11520
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDM*
>P18_11521
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDISRNYSNYQISDDGLCKLSLAK
CISNLSSLSLCGMAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKTID
LWSCCHITGDGLVALVKKCTKLEFLDVWGMRIPVKYFFRLLSDNPQIHIKPGVFLCNVER
LELWPVL*
>P18_11522
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDM*
>P18_11523
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDIASAT*
>P18_11524
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDM*
>P18_11525
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDISRNYSNYQISDDGLCKLSLAK
CISNLSSLSLCGMAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNY
SFVPYLHEICHR*
>P18_11526
MAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKTIDLWSCCHITGDGL
VALVKKCTKLEFLDVWGMRIPVKYFFRLLSDNPQIHIKPGVFLCNVERLELWPVL*
>P18_11527
DYICLVLLHRLYMESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQ
GVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKLDM*
>P19_13038
MAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKTIDLWSCCHITGDGL
VALVKKCTKLEFLDVWGMRIPVKYFFRLLSDNPQIHIKPG
>P19_13039
AMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFAG
WNVNDESTSLIVGLACNLKKLDIASAT*
>P20_65799
PAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFA
GWNVNDESTSLIVGLACNLKKLDM*
>P20_65800
PAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFA
GWNVNDESTSLIVGLACNLKKLDISRNYSNYQISDDGLCKLSLAKCISNLSSLSLCGMAG
ITDKGVILLVCVYHC*
>P20_65801
PAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALLVTNSTFFHHFLCGFFVCFVLISCE
TLDHACINCYVSCFMRPTSCLCIIVLYGA*
>P21_9321
ESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLS
FAGWNVNDESTSLIVGLACNLKKLDIASAT*
>P21_9323
GESCHGKWKSAVGASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKL
DISRNYSNYQISDDGLCKLSLAKCISNLSSLSLCGMAGITDKGVILLVTRATSLEHLNIG
GTLVTDESLFAIANSCPHLKVNYSFVPYLHEICHR*
>P21_9325
MLRKERLSFAGWNVNDESTSLIVGLACNLKKLDISRNYSNYQISDDGLCKLSLAKCISNL
SSLSLCGMAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNYSFVPY
LHEICHR*
>P21_9327
MDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSL
IVGLACNLKKLDINLSSLSLCGMAGITDKGVILLV
>P21_9328
GESCHGKWKSAVGASAVCKKWRQGVNLSMLRKERLSFAGWNVNDESTSLIVGLACNLKKL
DISRNYSNYQISDDGLCKLSLAKCISNLSSLSLCGMAGITDKGVILLVCVYHC*
>P21_9329
ESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLS
FAGWNVNDESTSLIVGLACNLKKLDIASAT*
>P22_31524
ESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLS
FAGWNVNDESTSLIVGLACNLKKLDM*
>P22_31525
ESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLS
FAGWNVNDESTSLIVGLACNLKKLDIASAT*
>P22_31526
MAGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKTIDLWSCCHITGDGL
VALVKKCTKLEFLDVWGMRIPVKYFFRLLSDNPQIHIKPGVFLCNVERLELWPVL*
>P22_31527
ESPAMENGRVQLGMDSLPVDLLAVIFAFMVSFRDLALASAVCKKWRQGVNLSMLRKERLS
FAGWNVNDESTSLIVGLACNLKKLDISRNYSNYQISDDGLCKLSLAKCISNLSSLSLCGM
AGITDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNYSFVPYLHEICHR*
>P23_39823
TDKGVILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNYSFVPYLHEICHR*
>P24_30823
VILLVTRATSLEHLNIGGTLVTDESLFAIANSCPHLKVNYSFVPYLHEICHR*
"