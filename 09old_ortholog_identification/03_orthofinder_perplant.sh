
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



cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

# investigate ref
head -n 50 Piper_nigrum.fa

#remove underscore
cat /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/Piper_nigrum.fa | sed 's/Pn1\./Pn_/g' > PiperV2.fa

# remove full stops
cat /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/PiperV2.fa | sed 's/\.//g' > PiperV3.fa

# investigate ref
head -n 50 PiperV3.fa

# rm old versions
rm Piper_nigrum.fa PiperV2.fa


### UPDATE try ORTHOFINDER WITH RENAMED .FA FILES TO HOW I WANT THEM LATER ... I.E. REMOVE EXTRA . AND _ BEFORE RUNNING ORTHOFINDER

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/
mkdir renamedfa

cp *.fa ./renamedfa


# rename piper file - checked and inside of file is good

mv PiperV3.fa Pn.fa

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

# run orthofinder on dataset that had been renamed

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa

screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa

screen -r 256507

# results here

/Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa/OrthoFinder/Results_Jul04/

"$ cat Log.txt
2024-07-04 13:53:41 : Started OrthoFinder version 2.4.0
Command Line: /Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa

WorkingDirectory_Base: /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa/OrthoFinder/Results_Jul04/WorkingDirectory/

Species used:
0: P1.fa
1: P13.fa
2: P14.fa
3: P15.fa
4: P16.fa
5: P17.fa
6: P18.fa
7: P19.fa
8: P2.fa
9: P20.fa
10: P21.fa
11: P22.fa
12: P23.fa
13: P24.fa
14: P3.fa
15: P4.fa
16: Plant1.fa
17: Plant2.fa
18: Plant3.fa
19: Plant4.fa
20: Pn.fa

FN_Orthogroups: /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedfa/OrthoFinder/Results_Jul04/WorkingDirectory/clusters_OrthoFinder_I1.5.txt_id_pairs.txt

ERROR: An error occurred
ERROR: Species tree inference failed
"




# OLD run orthofinder on dataset that hadn't been renamed
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/
screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

screen -r 83066

# results here

/Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/

" cat Log.txt
2024-05-10 11:13:41 : Started OrthoFinder version 2.4.0
Command Line: /Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 64 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder

WorkingDirectory_Base: /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/WorkingDirectory/

Species used:
0: P1.trans.fa
1: P13.trans.fa
2: P14.trans.fa
3: P15.trans.fa
4: P16.trans.fa
5: P17.trans.fa
6: P18.trans.fa
7: P19.trans.fa
8: P2.trans.fa
9: P20.trans.fa
10: P21.trans.fa
11: P22.trans.fa
12: P23.trans.fa
13: P24.trans.fa
14: P3.trans.fa
15: P4.trans.fa
16: PiperV3.fa
17: Plant_1.trans.fa
18: Plant_2.trans.fa
19: Plant_3.trans.fa
20: Plant_4.trans.fa

FN_Orthogroups: /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/WorkingDirectory/clusters_OrthoFinder_I1.5.txt_id_pairs.txt
WorkingDirectory_Trees: /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/WorkingDirectory/
2024-05-11 18:22:22 : OrthoFinder run completed

"


