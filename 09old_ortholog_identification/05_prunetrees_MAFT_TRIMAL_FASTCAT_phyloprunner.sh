##  prune trees before analysis

## question for nathan, what are we hoping to prune with phylopyprunner? 

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


## NATHAN HAD TO EDIT Orthogroups.OG*.txt files to not have duplicates


cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/trimmedorthogroups
screen

 #Uses grep to go through your Orthogroups.OG*.txt files, pull out the names, look for them in your all.proteins.faa file, and put them in appropriate files.
parallel -j8 '
    grep --no-group-separator -A1 -wFf {} all.proteins_assemperplant.fa > {/.}_trim.faa && echo "File created: {/.}_trim.faa"
' ::: Orthogroups.OG*.txt_trim

screen -r 80062




#So, for each of your orthogroups, you have a list of 21 sequences, one from each sample (20 samples, 1 ref genome).


### ### tree orthologues per orthogroup ###########


###### ALIGN WITH MAFFT ######
#You can then align all these (MAFFT) and voila, you have 941 single copy orthogroups to use for phylogenetic analysis!

 # I did it!
screen
# Loop through each orthogroup file
for file in /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/trimmedorthogroups/*.faa; do
    # Get the base name of the file
    base=$(basename "$file" .faa)
    
    # Perform alignment using MAFFT
    mafft --auto "$file" > "/Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/trimmedorthogroups/faa_aligned_orthogroups/${base}_aligned.faa"

    # Echo once alignment is completed
    echo "Alignment completed for ${base}_aligned.fasta"
done

screen -r 80062



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

cp *trim_gappyout.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/trimmedorthogroups/faa_aligned_orthogroups/gappyout

cp *trim_nogaps.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/trimmedorthogroups/faa_aligned_orthogroups/nogaps

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

## deletes all the names after the underscore to Pn_234 becomes Pn_
# renames Pn to Pn
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_.*$//g' "$file"
    fi
done









