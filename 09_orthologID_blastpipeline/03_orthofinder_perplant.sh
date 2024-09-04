
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

for file in *.pep; do
    mv -- "$file" "${file%.pep}.fa"
done


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


### RENAME FILES AND HEADERS TO HOW I WANT THEM LATER!! 
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/
mkdir RenamedHeaders2

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




cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/Piper

# investigate ref Pn23.504
head -n 50 Piper_nigrum.fa

# copy ref to new folder 
cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/Piper/Piper_nigrum.fa /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2

 cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2

# replace . with _ for header title
 sed '/^>/ s/\./_/g' Piper_nigrum.fa > Pp.fa

 # remove . from in seq
 cat Pp.fa | sed 's/\.//g' > Ppp.fa 

# add | after Pn (Pn -> Pn|) Pn|23_504
 cat Ppp.fa | sed 's/>Pn\(.*\)/>Pn|\1/g' > Pn.fa

 ## remove all * IN ALL FILES
 sed -i 's/\*//g' *.fa





## DOUBLE CHECK THERE'S ONLY THE VERSIONS OF THE FILES YOU WANT
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder//RenamedHeaders2

ls

## rm file 
rm P4_test.fa

# run orthofinder on dataset that had been renamed

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder//RenamedHeaders2


#### RenamedHeaders2

screen

conda activate myenv


/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -t 32 -a 16 -T iqtree -M msa -A mafft -S diamond -I 1.5 -f /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2

screen -r 179210


# OOPS - re-run with blast results as i forgot to delete Pn2.fa before running the above (to save time, rather than re-running the above) ... so rerun with bash but first edit speciesid file to have # in front of Pn2 (locally) then upload and replace that speciesid file in /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/

screen

/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder -b /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/ -t 32
screen -r 46558

##### UP TO HERE - SEPT 3RD 2024