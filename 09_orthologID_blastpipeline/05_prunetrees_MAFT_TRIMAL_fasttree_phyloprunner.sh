##  prune trees before analysis

## question for nathan, what are we hoping to prune with phylopyprunner? 

## now join all the amino acid fasters together
# first make sure that all the names of the genes are the same, which they are


## copy files into desired folder

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/

mkdir orthogroup_aminoacidseq_blast

# .pep outputs from transdecoder that were renamed to .fa extensions
cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/*.fa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast


### join all .fa files together

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast

cat /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/*.fa > all.proteins_assemperplant.fa


## NATHAN HAD TO EDIT Orthogroups.OG*.txt files to not have duplicates

# copy files over
cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/all.proteins_assemperplant.fa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups

# copy kinfin outputs...
cp /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/Orthogroups.OG* /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups


cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups
screen

 #Uses grep to go through your Orthogroups.OG*.txt files, pull out the names, look for them in your all.proteins.faa file, and put them in appropriate files.
parallel -j8 '
    grep --no-group-separator -A1 -wFf {} all.proteins_assemperplant.fa > {/.}_trim.faa && echo "File created: {/.}_trim.faa"
' ::: Orthogroups.OG*.txt

screen -r 369149




#So, for each of your orthogroups, you have a list of 21 sequences, one from each sample (20 samples, 1 ref genome).


### ### tree orthologues per orthogroup ###########


###### ALIGN WITH MAFFT ######
#You can then align all these (MAFFT) and voila, you have 941 single copy orthogroups to use for phylogenetic analysis!

 # I did it!
screen
# Loop through each orthogroup file
for file in /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/*.faa; do
    # Get the base name of the file
    base=$(basename "$file" .faa)
    
    # Perform alignment using MAFFT
    mafft --auto "$file" > "/Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/${base}_aligned.faa"

    # Echo once alignment is completed
    echo "Alignment completed for ${base}_aligned.fasta"
done

screen -r 394786



##### TRIM WITH TRIMAL #########


### trimAL



nano ~/.bashrc


PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source


crtl x and then y then enter


## NO GAPS

# test on one

trimal -in Orthogroups.OG0010770_trim_aligned.faa -out Orthogroups.OG0010770_aligned_trim_nogaps.faa -nogaps

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

"$ for file in *_aligned.faa; do
>     out_file="${file/_aligned.faa/_aligned_trim_gappyout.faa}"
>     trimal -in "$file" -out "$out_file" -gappyout
> done

WARNING: Removing sequence 'P23_33390' composed only by gaps


WARNING: Removing sequence 'P15_15647' composed only by gaps
WARNING: Removing sequence 'P23_45036' composed only by gaps


WARNING: Removing sequence 'P18_7169' composed only by gaps
WARNING: Removing sequence 'P21_18464' composed only by gaps


WARNING: Removing sequence 'P4_42017' composed only by gaps
WARNING: Removing sequence 'Plant1_51661' composed only by gaps


WARNING: Removing sequence 'P18_52615' composed only by gaps
WARNING: Removing sequence 'P21_28820' composed only by gaps
WARNING: Removing sequence 'P21_28822' composed only by gaps
WARNING: Removing sequence 'P3_3421' composed only by gaps
WARNING: Removing sequence 'Plant2_30302' composed only by gaps
WARNING: Removing sequence 'Plant2_30303' composed only by gaps
WARNING: Removing sequence 'Plant4_54940' composed only by gaps


ERROR: Alignment not loaded: "_aligned.faa" Check the file's content.
"


mkdir nogaps gappyout

cp *trim_gappyout.faa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout

cp *trim_nogaps.faa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/nogaps


# count files in nogaps
ls -1 | wc -l

# 745

# count files in gappyout

# 61



## make back up versions in new folders

cp ./*nogaps.faa ./backup_nogaps/

cp ./*gappyout.faa ./backup_gappyout/




# Rename your entries to meet phylopypruner’s expectations. Please try this on a copied, sacrificial file first – it should result in all the sequences having the format: >Sample@number
 

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout/


# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/nogaps/

# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done

#Run a quick tree for each of your alignments – it doesn’t need to be bootstrapped.
 

#e.g.

FastTree < alignment_file > tree_file

 

#So for one example on our server:


fasttree_linux < Orthogroups.OG0013371_trim_aligned_trim_gappyout.faa > Orthogroups.OG0013371_trim_aligned_trim_gappyout.tre


 "
$ fasttree_linux < Orthogroups.OG0013371_trim_aligned_trim_gappyout.faa > Orthogroups.OG0013371_trim_aligned_trim_gappyout.tre
FastTree Version 2.1.5 SSE3, OpenMP (144 threads)
Alignment: standard input
Amino acid distances: BLOSUM45 Joins: balanced Support: SH-like 1000
Search: Normal +NNI +SPR (2 rounds range 10) +ML-NNI opt-each=1
TopHits: 1.00*sqrtN close=default refresh=0.80
ML Model: Jones-Taylor-Thorton, CAT approximation with 20 rate categories
Initial topology in 0.96 seconds
Refining topology: 14 rounds ME-NNIs, 2 rounds ME-SPRs, 7 rounds ML-NNIs
Total branch-length 3.299 after 0.96 sec, 1 of 9 splits
ML-NNI round 1: LogLk = -577.266 NNIs 3 max delta 0.00 Time 1.30
Switched to using 20 rate categories (CAT approximation)1 of 20
Rate categories were divided by 0.655 so that average rate = 1.0
CAT-based log-likelihoods may not be comparable across runs
Use -gamma for approximate but comparable Gamma(20) log-likelihoods
ML-NNI round 2: LogLk = -568.403 NNIs 2 max delta 0.34 Time 1.62
ML-NNI round 3: LogLk = -567.201 NNIs 3 max delta 0.00 Time 1.95
Turning off heuristics for final round of ML NNIs (converged)
ML-NNI round 4: LogLk = -567.045 NNIs 2 max delta 0.01 Time 2.24 (final)
Optimize all lengths: LogLk = -567.045 Time 2.25
Total time: 2.46 seconds Unique: 11/26 Bad splits: 0/8

"

#loop this for all occurrences:

 
screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./fasttree/"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/Orthogroups.OG*_trim_aligned_trim_gappyout.faa; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract the base name (without extension) of the file
        base=$(basename "$file" .faa)
        
        # Construct output file name
        output_file="$output_dir/${base}.tre"
        
        # Run fasttree_linux with input and output file names
        fasttree_linux < "$file" > "$output_file"
        
        echo "Processed $file -> $output_file"
    else
        echo "File $file not found."
    fi
done
 
screen -r 326488



## no gaps

mkdir fasttree

#loop this for all occurrences:

 
screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./fasttree/"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/Orthogroups.OG*_trim_aligned_trim_nogaps.faa; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract the base name (without extension) of the file
        base=$(basename "$file" .faa)
        
        # Construct output file name
        output_file="$output_dir/${base}.tre"
        
        # Run fasttree_linux with input and output file names
        fasttree_linux < "$file" > "$output_file"
        
        echo "Processed $file -> $output_file"
    else
        echo "File $file not found."
    fi
done
 
screen -r 200071


#Now you have a tree for every orthogroup (you could do this on your already trimmed data)

# copy fasttree outputs into a folder


## GAPPYOUT
### phylopypruner

# rename files to...
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout

mkdir phylopypruner

# copy faa and tre files
cp * ./phylopypruner

cp ./fasttree/* ./phylopypruner

### shorten file names
cd phylopypruner


for file in Orthogroups*; do
    if [ -f "$file" ]; then
        # Extract the part between 'Orthogroups.' and the first '_'
        base_name=$(echo "$file" | sed -E 's/Orthogroups\.([^_]+)_.*/\1/')
        extension="${file##*.}"
        mv "$file" "${base_name}.${extension}"
    fi
done



screen
conda activate myenv


phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout/phylopypruner

screen -r 326488

" phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout/phylopypruner
PhyloPyPruner version 1.2.4
warning: found files from a previous run, overwrite these files? (y/n):y
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (61/61)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/gappyout/phylopypruner/phylopypruner_output

Parameters (~ = required, [x] = used, [ ] = unused):
  [ ] Always exclude the following OTUs: None
  [ ] Remove sequences shorter than _ bases
  [ ] Remove branches longer than _ standard deviations of all branches
  [ ] Collapse branches with less support than _% into polytomies
   ~  Mask monophylies using the pdist method
  [ ] These OTUs were used for outgroup rooting: None
  [ ] Alternative rooting method: None
  [ ] The Paralogy frequency threshold is set to _
  [ ] The Divergence threshold is set to _
  [ ] Include these OTUs, even if deemed problematic: None
   ~  Prune paralogs using the LS method
  [x] Discard output alignments with fewer than 4 sequences
  [ ] Taxon jackknifing is not performed
  [ ] Discard OTUs with less than _% occupancy
  [ ] Discard genes with less than _% occupancy

Alignment statistics:
  Description                        Input   Output
  No. of alignments                    61      61
  No. of sequences                   1494    1054
  No. of OTUs                          22      22
  Avg no. of sequences / alignment     24      17
  Avg no. of OTUs / alignment          20      17
  Avg sequence length (ungapped)       51      53
  Shortest sequence (ungapped)          3       3
  Longest sequence (ungapped)          69      69
  % missing data                    16.50   28.10
  Concatenated alignment length      3803    3693

Methods summary:
  Description                   No. removed    % of input
  Short sequences                0          0.00
  Long branches                  0          0.00
  Ultrashort distance pairs      0          0.00
  Divergent sequences            0          0.00
  Collapsed nodes                0          0.00
  OTUs < occupancy threshold     0          0.00
  Genes < occupancy threshold    0          0.00
(myenv)
"


## NO GAPS
### phylopypruner

# rename files to...
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/nogaps

mkdir phylopypruner

# copy faa and tre files
cp * ./phylopypruner

cp ./fasttree/* ./phylopypruner

### shorten file names

cd phylopypruner

for file in Orthogroups*; do
    if [ -f "$file" ]; then
        # Extract the part between 'Orthogroups.' and the first '_'
        base_name=$(echo "$file" | sed -E 's/Orthogroups\.([^_]+)_.*/\1/')
        extension="${file##*.}"
        mv "$file" "${base_name}.${extension}"
    fi
done



screen
conda activate myenv


phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq_blast/trimmedorthogroups/faa_aligned_orthogroups/nogaps/phylopypruner

screen -r 200071