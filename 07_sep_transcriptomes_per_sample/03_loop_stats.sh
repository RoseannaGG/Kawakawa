screen

cd /Volumes/archive/kennylab/roseanna_kawakawa/assemblies

# Set the directory containing all your assemblies
assembly_dir="/Volumes/archive/kennylab/roseanna_kawakawa/assemblies"

# Set the output CSV file
output_csv="assembly_stats.csv"

# Change to the assembly directory
cd "$assembly_dir" || exit

# Remove the existing output CSV file if it exists
rm -f "$output_csv"

# Print CSV header
echo "Assembly,Total Genes,Total Transcripts,Percent GC,N10,N20,N30,N40,N50,Median Contig Length,Average Contig Length,Total Assembled Bases" > "$output_csv"

# Iterate over all Trinity.fasta files in the current directory
for trinity_fasta in *.fasta; do
    # Check if the file is a Trinity.fasta file before running TrinityStats.pl
    if [ -e "$trinity_fasta" ]; then
        # Extract the assembly name from the file name
        assembly_name="${trinity_fasta%_Trinity.fasta}"

        # Print the name of the assembly
        echo "Running TrinityStats.pl for assembly: $assembly_name"

        # Run TrinityStats.pl for the current assembly and capture the output in a temporary file
        temp_output=$(mktemp)
        perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl "$trinity_fasta" > "$temp_output"

        # Extract relevant statistics from the temporary file and append to the CSV file
        echo -n "$assembly_name," >> "$output_csv"
        awk '/Total trinity '\''genes'\''/{printf "%s,",$4} /Total trinity transcripts/{printf "%s,",$4} /Percent GC/{printf "%s,",$3} /Contig N[0-9]+/{printf "%s,",$3} /Median contig length/{printf "%s,",$4} /Average contig/{printf "%s,",$3} /Total assembled bases/{printf "%s",$4} END{print ""}' "$temp_output" >> "$output_csv"

        # Clean up temporary file
        rm -f "$temp_output"
    else
        echo "Trinity.fasta not found for $trinity_fasta. Skipping..."
    fi
done

echo "CSV file with assembly statistics created: $output_csv"

screen -r 184052