https://github.com/DRL/kinfin

# create condo environment
conda create -n kinfin -c conda-forge docopt==0.6.2 scipy==0.19.0 matplotlib networkx==1.11 ete3
conda activate kinfin

#To activate this environment, use:

    micromamba activate kinfin

    conda activate kinfin


#Or to execute a single command in this environment, use:

    micromamba run -n kinfin mycommand


#Clone github repo
git clone https://github.com/DRL/kinfin.git


#Run install script for fetching databases
cd kinfin
./install

# test kinfin
./test

# usage
./kinfin -h




# make config file
# https://kinfin.readme.io/docs/starting-from-a-clustering-files

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/generate_kinfin_input.py --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/ orthofinder config


# copy ortho outputs needed into kinfin folder

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/Orthogroups/Orthogroups.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/WorkingDirectory/SpeciesIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/
cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/WorkingDirectory/SequenceIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/


cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/config.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/


cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin


## works
screen

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt -o test --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/ 

screen -r 284217

#/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt --target_count --target_fraction --min --max --outprefix /Volumes/archive/kennylab/roseanna_kawakawa/kinfin --infer_singletons --min_proteomes --test --taxranks --repetitions --repetitions

#$ /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt --target_count --target_fraction --min --max --outprefix test --infer_singletons --min_proteomes --test


":
Traceback (most recent call last):
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2305, in <module>
    inputObj = InputObj(args)
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2154, in __init__
    self.check_fuzzy_count(args['--target_count'])
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2270, in check_fuzzy_count
    if int(target_count) > 0:
ValueError: invalid literal for int() with base 10: '--target_fraction'
(kinfin)
"


## plot

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py -i cluster_counts_by_taxon.txt 

"AttributeError: module 'matplotlib' has no attribute 'colormaps'
(kinfin)"








cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/

grep -P "\t21" /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/all.all.cluster_1to1s.txt | cut -f1 > single_copy.cluster_ids.txt


# get_protein_ids_from_cluster.py

cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/get_protein_ids_from_cluster.py -g Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt -s

#I googled the error below (AttributeError: 'dict' object has no attribute 'iteritems'), and if you have a look at the results, it is a python2 =/= python3 problem (e.g. the first result is https://stackoverflow.com/questions/30418481/error-dict-object-has-no-attribute-iteritems)

 

#So, I converted the python script from v2 to v3. You can do this manually, but I did it thus:

 

#Install the python2 to python3 tool:

pip3 install 2to3

# didn't work but found it in usr/bin/

 

#Ran it:
cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts


usr/bin/2to3-3 -w get_protein_ids_from_cluster.py

 







conda
#Use nano to open your bashrc file (which says which things to launch on startup – we have used this before)

 

nano ~/.bashrc 

 

#This will open a text file. Navigate to the bottom with your up/down keys. Copy and paste the following line in: (please check I have got how your name is represented in the PATH right – I am writing this from the loo in a hotel room near Charles de Gaulle so the light doesn’t wake the kids, and I can’t get on the servers right now)

 

export PATH="/Volumes/userdata/staff_users/roseannagamlen-greene/miniconda3/bin:$PATH"

 

#don’t worry if you put in extra empty lines before or after, these do nothing. 

 

#Hit control+x to exit, confirming save with Y if asked.

 

#Reboot your programmes with

source ~/.bashrc

 

#Now hit 

conda

 

#and if that works: (feel free to change myenv to whatever you want)

 

conda create -n myenv

conda activate myenv

conda install -c anaconda matplotlib docopt tqdm wget pyyaml git

conda install -c bioconda pysam --update-deps

 

#You will be in an environment called myenv (which has anaconda matplotlib docopt tqdm wget pyyaml git bioconda pysam)

 

#If you start a new session, you can re-activate this with 

 

conda activate myenv




# extracting protein IDs from 

#Run the programme:
cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts


# generates one file per orthologue Orthogroups.OG*.txt - and in each file there are the gene names from each plant that correspond to that orthologue gene (ie are the same gene) ... .
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt

# generates single_copy.cluster_ids.protein_ids.txt - which is just a list of all the gene names in each plant that correspond to one of these orthologue clusters
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt -s
 

## now join all the amino acid fasters together
# first make sure that all the names of the genes are the same, which they are


## copy files into desired folder

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/

mkdir orthogroup_aminoacidseq

# .pep outputs from transdecoder that were renamed to .fa extensions
cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/*.fa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq


### join all .fa files together

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq

cat /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/*.fa > all.proteins_assemperplant.fa


# copy all Orthogroups.OG* files into orthogroup_aminoacidseq in prep for generating all seq from each sample within each orthogroup

cp /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/Orthogroups.OG* /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/

 screen

## now get all the sequences of all the genes that correspond to each orthologue (orthogroup) - creates one file per orthogroup
 #Uses grep to go through your Orthogroups.OG*.txt files, pull out the names, look for them in your all.proteins.faa file, and put them in appropriate files.
parallel -j8 '
    grep --no-group-separator -A1 -wFf {} all.proteins_assemperplant.fa > {/.}.faa && echo "File created: {/.}.faa"
' ::: Orthogroups.OG*.txt


    screen -r 100098




#So, for each of your orthogroups, you have a list of 21 sequences, one from each sample (20 samples, 1 ref genome).


### ### tree orthologues per orthogroup ###########


###### ALIGN WITH MAFFT ######
#You can then align all these (MAFFT) and voila, you have 941 single copy orthogroups to use for phylogenetic analysis!

 # I did it!
screen
# Loop through each orthogroup file
for file in /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/*.faa; do
    # Get the base name of the file
    base=$(basename "$file" .faa)
    
    # Perform alignment using MAFFT
    mafft --auto "$file" > "/Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/${base}_aligned.faa"

    # Echo once alignment is completed
    echo "Alignment completed for ${base}_aligned.fasta"
done

screen -r 103999


##### TRIM WITH TRIMAL #########


### trimAL



nano ~/.bashrc


PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source


crtl x and then y then enter


## NO GAPS

# test on one

trimal -in Orthogroups.OG0015005_aligned.faa -out Orthogroups.OG0015005_aligned_trim_nogaps.faa -nogaps

# loop

for file in *_aligned.faa; do
    out_file="${file/_aligned.faa/_aligned_trim_nogaps.faa}"
    trimal -in "$file" -out "$out_file" -nogaps
done



# gappyout

# loop

for file in *_aligned.faa; do
    out_file="${file/_aligned.faa/_aligned_trim_gappyout.faa}"
    trimal -in "$file" -out "$out_file" -gappyout
done



mkdir nogaps gappyout

cp *trim_gappyout.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout

cp *trim_nogaps.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps

# rename file extention of .faa to .fas for fasconcat to work
for file in *.faa; do
    cp "$file" "${file%.faa}.fas"
done


# count files in nogaps
ls -1 | wc -l

# 745

# count files in gappyout

# 940



## make back up versions in new folders

cp ./*.fas ./backup_nogaps/

cp ./*.fas ./backup_gappyout/

## rename protein names so that there's only one underscore and it's between the plant ID and the protein ID eg plant_1_234 > plant1_234

# renames plant_1 to plant1_
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/Plant_/Plant/g' "$file"
    fi
done

# renames Pn to Pn_
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/>Pn/>Pn_/g' "$file"
    fi
done

## deletes all the names after the underscore to Pn_234 becomes Pn
# renames Pn to Pn
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_.*$//g' "$file"
    fi
done



## Concatenate with FasConCAT

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup_nogaps


perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl -p -p -n -n -i

s



## try again but remove all Pn headers...

for file in *; do
    if [ -f "$file" ]; then
        sed -i '/^>Pn/,/^>/d' "$file"
    fi
done





## try again but leave seq header numbers

cp ./*.fas ./backup_nogaps2/


# renames plant_1 to plant1_
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/Plant_/Plant/g' "$file"
    fi
done

# renames Pn to Pn_
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/>Pn/>Pn_/g' "$file"
    fi
done



cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup_nogaps2


perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl -p -p -n -n -i

s





# turn gappy out into list sep by commas

ls *trim_gappyout.faa | tr '\n' ',' > list_trimgappyout.txt

# turn no gaps into list sep by commas

ls *trim_nogaps.faa | tr '\n' ',' > list_trimnogaps.txt


cd 
# gappy out
perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl 


f

s 

# then enter number of files to concatenate
940



# nogaps
perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl 


f

s 

# then enter number of files to concatenate
745





nano

PATH=$PATH:/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/myenv/lib/python3.12/site-packages





# phyloprunner
pip install phyloprunner

path is here - /Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/FASconCAT/lib/python3.6/site-packages 
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps


# copy











#### OLD WRONG - USING DNA .fa files rather than amino acid .fa files (really pep files)


## rename files

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant

# download seqkit - copy and paste into terminal
wget https://github.com/shenwei356/seqkit/releases/download/v0.4.0/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz
mkdir -p ~/bin
mv seqkit ~/bin

# works on one - to rename sequence headers
seqkit replace trinity_Plant_4.Trinity.fasta -p "(.+)" -r "Plant_4_{nr}" > Plant_4.fa

#check worked
head -n 50 Plant_4.fa

#write as Loop
#!/bin/bash


mkdir fasta_renamed

# Define the sample name list
sample_names=("P1" "P2" "P3" "P4" "P13" "P14" "P15" "P16" "P17" "P18" "P19" "P20" "P21" "P22" "P23" "P24" "Plant_1" "Plant_2" "Plant_3" "Plant_4")


# Loop through each sample name
for sample_name in "${sample_names[@]}"; do
    # Perform the replacement and redirect output to the new folder
    seqkit replace "trinity_${sample_name}.Trinity.fasta" -p "(.+)" -r "${sample_name}_{nr}" > "fasta_renamed/${sample_name}.fa"
done

### join all .fa files together
cat /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/*.fa > all.proteins_assemperplant.fa


# copy all Orthogroups.OG* files into fasta_renamed file

cp /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/Orthogroups.OG* /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/

 screen

## now get all the sequences of all the genes that correspond to each orthologue (orthogroup) - creates one file per orthogroup
parallel -j8 '
    grep --no-group-separator -A1 -wFf {} all.proteins_assemperplant.fa > {/.}.faa && echo "File created: {/.}.faa"
' ::: Orthogroups.OG*.txt


    screen -r 191053

 #Uses grep to go through your Orthogroups.OG*.txt files, pull out the names, look for them in your all.proteins.faa file, and put them in appropriate files.


#So, for each of your orthogroups, you have a list of 20 sequences, one from each sample.

# copy these into a new folder

mkdir faa_orthogroups

mkdir faa_aligned_orthogroups

cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/*.faa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/faa_orthogroups

#You can then align all these (MAFFT) and voila, you have 941 single copy orthogroups to use for phylogenetic analysis!

 
screen
# Loop through each orthogroup file
for file in /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/faa_orthogroups/*.faa; do
    # Get the base name of the file
    base=$(basename "$file" .faa)
    
    # Perform alignment using MAFFT
    mafft --auto "$file" > "/Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/fasta_renamed/faa_aligned_orthogroups/${base}_aligned.faa"

    # Echo once alignment is completed
    echo "Alignment completed for ${base}_aligned.fasta"
done

screen -r 191053