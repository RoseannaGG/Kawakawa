############################
### 06_alignment ############
############################

cd ~/Trimmed_reads3
mkdir R1_trimmed_PE R2_trimmed_PE

screen
cp *R1_PE.fastq.gz R1_trimmed_PE/

screen -r 424273

screen
cp *R2_PE.fastq.gz R2_trimmed_PE/
screen -r 437142




## loop
screen
GENOME_DIR="/Volumes/archive/kennylab/roseanna_kawakawa/star_index/"
THREADS=16
OUTPUT_DIR="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/test4/"  


# List of sample names
sample_names=("P13A" "P17A" "P20A" "P24A" "Plant_1A" "P13B" "P17B" "P20C" "P24B" "Plant_1B" "P13C" "P17C" "P21A" "P24C" "Plant_1C" "P14A" "P18A" "P21B" "P2A" "Plant_2B" "P14B" "P18B" "P21C" "P2B" "Plant_2C" "P14C" "P18C" "P22A" "P2C" "Plant_3B" "P15A" "P19A" "P22B" "P3A" "Plant_3C" "P15B" "P19B" "P22C" "P3B" "Plant_4A" "P15C" "P19C" "P23A" "P3C" "P16A" "P1A" "P23B" "P4A" "P16B" "P1C" "P23C" "P4C" "Plant_4B" "Plant_4C") 

# Loop through the sample names
for sample_name in "${sample_names[@]}"; do
    # Construct the paths to the forward and reverse read files for the sample
    read1="/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/R1_trimmed_PE/${sample_name}_R1_PE.fastq.gz"
    read2="/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3/R2_trimmed_PE/${sample_name}_R2_PE.fastq.gz"

    # Run STAR for alignment
    STAR \
        --genomeDir "$GENOME_DIR" \
        --runThreadN "$THREADS" \
        --readFilesIn "$read1" "$read2" \
        --readFilesCommand zcat \
        --outFileNamePrefix "$OUTPUT_DIR/${sample_name}_"

    echo "Alignment for $sample_name is complete."
done

echo "All alignments are finished."


screen -r 211306

"
$ cat P13A_Log.final.out
                                 Started job on |       Nov 09 18:29:58
                             Started mapping on |       Nov 09 18:31:54
                                    Finished on |       Nov 09 18:39:01
       Mapping speed, Million of reads per hour |       58.02

                          Number of input reads |       6882022
                      Average input read length |       165
                                    UNIQUE READS:
                   Uniquely mapped reads number |       4758864
                        Uniquely mapped reads % |       69.15%
                          Average mapped length |       163.52
                       Number of splices: Total |       139473
            Number of splices: Annotated (sjdb) |       0
                       Number of splices: GT/AG |       120886
                       Number of splices: GC/AG |       3917
                       Number of splices: AT/AC |       287
               Number of splices: Non-canonical |       14383
                      Mismatch rate per base, % |       0.50%
                         Deletion rate per base |       0.02%
                        Deletion average length |       3.13
                        Insertion rate per base |       0.01%
                       Insertion average length |       1.94
                             MULTI-MAPPING READS:
        Number of reads mapped to multiple loci |       725277
             % of reads mapped to multiple loci |       10.54%
        Number of reads mapped to too many loci |       37
             % of reads mapped to too many loci |       0.00%
                                  UNMAPPED READS:
  Number of reads unmapped: too many mismatches |       0
       % of reads unmapped: too many mismatches |       0.00%
            Number of reads unmapped: too short |       1397534
                 % of reads unmapped: too short |       20.31%
                Number of reads unmapped: other |       310
                     % of reads unmapped: other |       0.00%
                                  CHIMERIC READS:
                       Number of chimeric reads |       0
                            % of chimeric reads |       0.00%
"





##### cinvert sam to bam

for file in *.sam; do

    samtools view -S -b $file > "`basename $file .sam`.bam"

done

# Specify input and output directories
mkdir bamfiles

screen

input_dir="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/test4/"
output_dir="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/bamfiles/"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through SAM files in the input directory
for sam_file in "${input_dir}"/*.sam; do
    # Check if the file is a regular file
    if [ -f "$sam_file" ]; then
        # Create the corresponding BAM file in the output directory
        bam_file="${output_dir}/$(basename "${sam_file}" .sam).bam"

        # Convert SAM to BAM using Samtools
        samtools view -S -b "$sam_file" > "$bam_file"

        echo "Converted ${sam_file} to ${bam_file}"
    fi
done



## sort bam for snp calling

screen

input_dir="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/bamfiles/"
output_dir="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/sorted_bamfiles/"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through all BAM files in the input directory
for bam_file in "${input_dir}"/*.bam; do
    # Extract the base name of the BAM file (excluding the path and extension)
    base_name=$(basename "${bam_file%.out.bam}")

    # Construct the output sorted BAM file path
    output_sorted_bam="$output_dir/${base_name}-sorted.bam"

    # Use samtools to sort the BAM file
    samtools sort "$bam_file" -o "$output_sorted_bam"

    echo "Sorted ${bam_file} -> ${output_sorted_bam}"
done


screen -r 373785   #266211



## index genome again

cd /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene

screen

samtools faidx trinity_kawakawa_Trinity_okaytr.fasta

# outout is called  trinity_kawakawa_Trinity_okaytr.fasta.fai

