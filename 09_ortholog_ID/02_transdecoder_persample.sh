# mkdir

mkdir /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/persample


#copy all files into new folder
cp /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/*.Trinity.fasta /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/persample


screen

for file in *a; do /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t $file -m 50; done

screen -r 191053

screen

for file in *a; do /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t $file --single_best_only; done

screen -r 

# rename the .pep files

# Loop through folders matching the pattern *.Trinity.fasta.transdecoder_dir
for folder in *.Trinity.fasta.transdecoder_dir; do
    # Get the prefix of the folder name
    prefix=$(basename "$folder" .Trinity.fasta.transdecoder_dir)

    # Check if the folder contains files named longest_orfs.pep
    if [ -e "$folder/longest_orfs.pep" ]; then
        # Rename the file with the prefix of the folder name
        mv "$folder/longest_orfs.pep" "$folder/$prefix.pep"
        echo "Renamed $folder/longest_orfs.pep to $folder/$prefix.pep"
    else
        echo "No file named longest_orfs.pep found in $folder"
    fi
done