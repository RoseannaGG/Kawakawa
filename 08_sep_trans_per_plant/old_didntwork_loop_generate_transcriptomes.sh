

## generate list of groups
Group 1:
P1A P1C
Group 2:
P2A P2B P2C
Group 3:
P3A P3B P3C
Group 4:
P4A P4C
Group 5:
P24A P24B P24C
Group 6:
P22A P22B P22C
Group 7:
P23A P23B P23C
Group 8:
P20A P20C
Group 9:
P21A P21B P21C
Group 10:
P13A P13B P13C
Group 11:
P17A P17B P17C
Group 12:
P16A P16B
Group 13:
P15A P15B P15C
Group 14:
P14A P14B P14C
Group 15:
P19A P19B P19C
Group 16:
P18A P18B P18C
Group 17:
Plant_4A Plant_4B Plant_4C
Group 18:
Plant_2B Plant_2C
Group 19:
Plant_3B Plant_3C
Group 20:
Plant_1A Plant_1B Plant_1C


mkdir /Volumes/archive/kennylab/roseanna_kawakawa/plant_grouped_assemblies

cd /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/


/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity -h




screen

sample_names=("P13A" "P17A" "P20A" "P24A" "Plant_1A" "P13B" "P17B" "P20C" "P24B" "Plant_1B" "P13C" "P17C" "P21A" "P24C" "Plant_1C" "P14A" "P18A" "P21B" "P2A" "Plant_2B" "P14B" "P18B" "P21C" "P2B" "Plant_2C" "P14C" "P18C" "P22A" "P2C" "Plant_3B" "P15A" "P19A" "P22B" "P3A" "Plant_3C" "P15B" "P19B" "P22C" "P3B" "Plant_4A" "P15C" "P19C" "P23A" "P3C" "P16A" "P1A" "P23B" "P4A" "P16B" "P1C" "P23C" "P4C" "Plant_4B" "Plant_4C")

# Trinity command and common parameters
trinity_cmd="/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity"
common_params="--seqType fq --max_memory 512G --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF"

reads_dir="/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3"

# Define the output directory
output_dir="/Volumes/archive/kennylab/roseanna_kawakawa/assemblies"

# Declare an associative array to store the groups
declare -A groups

# Group samples by all characters except the last character
for sample in "${sample_names[@]}"; do
    group="${sample%?}"  # Remove the last character
    groups["$group"]+=" $sample"
done

# Loop through the groups and run Trinity
for group in "${!groups[@]}"; do
    group_samples="${groups["$group"]}"
    group_output_dir="$output_dir/trinity_kawakawa_${group}"
    mkdir -p "$group_output_dir"
    
    # Prepare the left and right files for Trinity
    left_files=()
    right_files=()
    for sample in $group_samples; do
        left_files+=("$reads_dir/${sample}_R1_PE.fastq.gz")
        right_files+=("$reads_dir/${sample}_R2_PE.fastq.gz")
    done
    
    # Run Trinity for the group
    "$trinity_cmd" $common_params --left "${left_files[@]}" --right "${right_files[@]}" --output "$group_output_dir"
    
    # Print a line indicating the completion of processing the current group
    echo "Trinity completed for group: $group"
done
Crtl +A+D #to exit

screen -r 317301

cd /Volumes/archive/kennylab/roseanna_kawakawa/assemblies




## try again...

#!/bin/bash

# Trinity command and common parameters
trinity_cmd="/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity"
common_params="--seqType fq --max_memory 512G --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF"

reads_dir="/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3"

# Define the output directory
output_dir="/Volumes/archive/kennylab/roseanna_kawakawa/assemblies"

# Function to run Trinity for a given sample group
run_trinity() {
    local samples="$1"
    local output_dir="$2"
    
    left_files=""
    right_files=""
    
    for sample in $samples; do
        left_files+=" $reads_dir/${sample}_R1_PE.fastq.gz"
        right_files+=" $reads_dir/${sample}_R2_PE.fastq.gz"
    done
    
    "$trinity_cmd" $common_params --left "$left_files" --right "$right_files" --output "$output_dir/trinity_kawakawa"
}

# Example usage for each sample group
run_trinity "P1A P1C" "$output_dir"
run_trinity "P2A P2B P2C" "$output_dir"
run_trinity "P3A P3B P3C" "$output_dir"
run_trinity "P4A P4C" "$output_dir"
run_trinity "P24A P24B P24C" "$output_dir"
run_trinity "P22A P22B P22C" "$output_dir"
run_trinity "P23A P23B P23C" "$output_dir"
run_trinity "P20A P20C" "$output_dir"
run_trinity "P21A P21B P21C" "$output_dir"
run_trinity "P13A P13B P13C" "$output_dir"
run_trinity "P17A P17B P17C" "$output_dir"
run_trinity "P16A P16B" "$output_dir"
run_trinity "P15A P15B P15C" "$output_dir"
run_trinity "P14A P14B P14C" "$output_dir"
run_trinity "P19A P19B P19C" "$output_dir"
run_trinity "P18A P18B P18C" "$output_dir"
run_trinity "Plant_4A Plant_4B Plant_4C" "$output_dir"
run_trinity "Plant_2B Plant_2C" "$output_dir"
run_trinity "Plant_3B Plant_3C" "$output_dir"
run_trinity "Plant_1A Plant_1B Plant_1C" "$output_dir"




Thursday, May 2, 2024: 10:10:24 CMD: mkdir -p /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa
CMD finished (0 seconds)
Error, cannot locate file:  cd P22A_R1_PE.fastq.gz /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/P22B_R1_PE.fastq.gz /Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/P22C_R1_PE.fastq.gz at /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity line 2848.
        main::create_full_path('ARRAY(0x213f0e0)', 1) called at /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity line 1319

