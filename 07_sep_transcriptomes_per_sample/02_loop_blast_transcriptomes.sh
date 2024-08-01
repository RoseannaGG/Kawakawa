########################
# blastx ################
#########################
cd /Volumes/archive/kennylab/roseanna_kawakawa/assemblies



mkdir xml txt



######### TXT ######


screen

# Set the directory
cd /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/

# Loop through all fasta files in the directory
for file in *.fasta; do
  # Run diamond blastx command
  /Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx \
    --query "$file" \
    --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd \
    --evalue 0.001 \
    --out /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/txt/"${file%.fasta}_Proteinmodels_diamond.txt" \
    --threads 24 \
    --max-target-seqs 1 \
    --outfmt 6 qseqid sseqid bitscore --more-sensitive

  # Print a message indicating that the blast is done for the current .fasta file
  echo "Blast done for $file"

done

# Combine all outputs into one CSV file
cat *_Proteinmodels_diamond.txt > diamondblastx_combined_output_txt.csv


  # Attach to screen session
 screen -r 194714



######### XML ######

screen

# Set the directory
cd /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/

# Loop through all fasta files in the directory
for file in *.fasta; do
  # Run diamond blastx command
  /Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx \
    --query "$file" \
    --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd \
    --evalue 0.001 \
    --out /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/xml/"${file%.fasta}_Proteinmodels_diamond.xml" \
    --threads 24 \
    --max-target-seqs 1 \
    --outfmt 5 --more-sensitive

  # Print a message indicating that the blast is done for the current .fasta file
  echo "Blast done for $file"

done

# Combine all outputs into one CSV file
cat *_Proteinmodels_diamond.xml > diamondblastx_combined_output_xml.csv


  # Attach to screen session
 screen -r 228916



