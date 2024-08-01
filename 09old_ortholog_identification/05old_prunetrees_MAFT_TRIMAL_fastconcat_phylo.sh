## OLD DIDN'T WORK AS ORTHOGROUP FILES HAD DUPLCIATES ORTHOLOGUES PER SAMPLE


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

## deletes all the names after the underscore to Pn_234 becomes Pn_
# renames Pn to Pn
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_.*$//g' "$file"
    fi
done



## Concatenate with FasConCAT -- should create FcC_smatrix.faa where for each plant there should be a long seq that represents all the orthologue seq joined up...

# make sure just faa files all in one folder and then run within folder

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup_nogaps


perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl -p -p -n -n -i

s



## try again but leave seq header numbers -- made no difference

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






# turn gappy out into list sep by commas

ls *trim_gappyout.faa | tr '\n' ',' > list_trimgappyout.txt

# turn no gaps into list sep by commas

ls *trim_nogaps.faa | tr '\n' ',' > list_trimnogaps.txt

# gappy out

# put all outputs into one folder

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup_nogaps
perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl -p -p -n -n -i

s 



# nogaps

# put all outputs into one folder

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup
perl /Volumes/archive/kennylab/roseanna_kawakawa/FASconCAT/FASconCAT_v1.11.pl -p -p -n -n -i

s 

### fastconcat didn't work... did not concatenate..



nano

PATH=$PATH:/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/myenv/lib/python3.12/site-packages





# phylopypruner
pip install phylopypruner

#path is here 
/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/FASconCAT/lib/python3.6/site-packages 


### gappyout

mkdir backup

cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/*.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup


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



# Rename all *.fas to *.faa
for file in *.fas; do
    mv -- "$file" "${file%.fas}.faa"
done


# Rename your entries to meet phylopypruner’s expectations. Please try this on a copied, sacrificial file first – it should result in all the sequences having the format: >Sample@number
 

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup


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

fasttree_linux < Orthogroups.OG0015734_aligned_trim_gappyout.faa > Orthogroups.OG0015734_aligned_trim_gappyout.tre


 "FastTree Version 2.1.5 SSE3, OpenMP (144 threads)
Alignment: standard input
Amino acid distances: BLOSUM45 Joins: balanced Support: SH-like 1000
Search: Normal +NNI +SPR (2 rounds range 10) +ML-NNI opt-each=1
TopHits: 1.00*sqrtN close=default refresh=0.80
ML Model: Jones-Taylor-Thorton, CAT approximation with 20 rate categories
Initial topology in 0.62 seconds
Refining topology: 12 rounds ME-NNIs, 2 rounds ME-SPRs, 6 rounds ML-NNIs
Total branch-length 0.498 after 0.62 sec, 1 of 6 splits
ML-NNI round 1: LogLk = -322.366 NNIs 1 max delta 0.38 Time 0.81
Switched to using 20 rate categories (CAT approximation)1 of 20
Rate categories were divided by 0.683 so that average rate = 1.0
CAT-based log-likelihoods may not be comparable across runs
Use -gamma for approximate but comparable Gamma(20) log-likelihoods
ML-NNI round 2: LogLk = -316.073 NNIs 0 max delta 0.00 Time 0.98
Turning off heuristics for final round of ML NNIs (converged)
ML-NNI round 3: LogLk = -316.073 NNIs 0 max delta 0.00 Time 1.15 (final)
Optimize all lengths: LogLk = -316.073 Time 1.16
Total time: 1.28 seconds Unique: 8/23 Bad splits: 0/5
"

#loop this for all occurrences:

 
screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./fasttree/"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/Orthogroups.OG*_aligned_trim_gappyout.faa; do
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
 
screen -r 275880

#Now you have a tree for every orthogroup (you could do this on your already trimmed data)

 

#Run phylopypruner. Did you manage to install this ok? If so, great, if not, ask and I can give pointers!
 

#Then run (with the alignment, (name ending .fa) and the resulting tree file,  (ending .tre)) in the same directory

# move both putputs into one folder 
mkdir phylopyprunerinput

cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup/*.faa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup/phylopyprunerinput

cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup/fasttree/*.tre /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup/phylopyprunerinput

rm FcC_smatrix.faa

# Rename all *.faa to *.fa
for file in *.faa; do
    mv -- "$file" "${file%.faa}.fa"
done

conda activate myenv

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/gappyout/backup/phylopyprunerinput

#it should run through all of them and take out the “out-paralogs”. This should hopefully leave you with a sanitised alignment, with only one seq per specimen

 




#### RUN PHYLOPRUNER ON NOGAPS


## copy files into new dir
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps

cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/*.fas /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup

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


# Rename all *.fas to *.fa 
for file in *.fas; do
    mv -- "$file" "${file%.fas}.fa"
done



# Rename your entries to meet phylopypruner’s expectations. Please try this on a copied, sacrificial file first – it should result in all the sequences having the format: >Sample@number
 

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup


# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done


# fasttree

screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./phylopypruner/"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/Orthogroups.OG*_aligned_trim_nogaps.fa; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract the base name (without extension) of the file
        base=$(basename "$file" .fa)
        
        # Construct output file name
        output_file="$output_dir/${base}.tre"
        
        # Run fasttree_linux with input and output file names
        fasttree_linux < "$file" > "$output_file"
        
        echo "Processed $file -> $output_file"
    else
        echo "File $file not found."
    fi
done
 
screen -r 110545

### cp the fa into the phylopypruner folder
cp /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/*.fa /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner



conda activate myenv

# run... but didn't work
phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner


## test run on pair
"cat Orthogroups.OG0017276_aligned_trim_nogaps.fa
>P1@37146
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P13@17737
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P14@8591
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P15@37725
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P16@69813
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P17@50051
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P18@42924
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P19@48963
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P2@18919
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P20@50472
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P21@4695
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P22@7154
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P23@51541
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P24@10311
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P3@46555
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>P4@2841
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>Pn@41014
MGESRGKLESQLNQNYVIWKQELEKHQAQVDDLQDKLREVQTSVQVSEENEKELQVLLRR
>Plant1@25706
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>Plant2@88896
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>Plant3@29422
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
>Plant4@32981
MGESLEKLESQLNQKNVIWKQELEKHQVQVDDLQDKLQEVQTSVQVSKENEKELQVLLRR
"


cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner

mkdir testpair

cp Orthogroups.OG0017276_aligned_trim* ./testpair

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair

"PhyloPyPruner version 1.2.4
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (1/1)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair/phylopypruner_output

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
  No. of alignments                    1      1
  No. of sequences                    21     21
  No. of OTUs                         21     21
  Avg no. of sequences / alignment    21     21
  Avg no. of OTUs / alignment         21     21
  Avg sequence length (ungapped)      60     60
  Shortest sequence (ungapped)        60     60
  Longest sequence (ungapped)         60     60
  % missing data                    0.00   0.00
  Concatenated alignment length       60     60

Methods summary:
  Description                   No. removed    % of input
  Short sequences               0         0.00
  Long branches                 0         0.00
  Ultrashort distance pairs     0         0.00
  Divergent sequences           0         0.00
  Collapsed nodes               0         0.00
  OTUs < occupancy threshold    0         0.00
  Genes < occupancy threshold   0         0.00
(myenv)
"

## test 2 Orthogroups.OG0015175_aligned_trim_nogaps.fa

"cat Orthogroups.OG0015175_aligned_trim_nogaps.fa
>P1@19707
MNGADERGLL
>P13@12311
MNGADERGLL
>P14@22042
MNGADERGLL
>P15@12741
MNGADERGLL
>P16@37756
MNGADERGLL
>P17@45086
MNGADERGLL
>P17@45087
MNGADERGLL
>P17@45088
MNGADERGLL
>P18@59259
MNGADERGLL
>P19@60494
MNGADERGLL
>P2@24563
MNGADERGLL
>P20@20194
MNGADERGLL
>P21@76450
MNGADERGLL
>P22@31702
MNGADERGLL
>P23@22558
MNGADERGLL
>P24@25273
MNGDDERGLL
>P3@4388
MNGADERGLL
>P4@25754
MNGADERGLL
>Pn@121276
MNGDDERGLL
>Plant1@44636
MNGDDERGLL
>Plant1@44637
MNGDDERGLL
>Plant2@2173
MNGDDERGLL
>Plant3@88848
MNGADERGLL
>Plant4@18072
MNGDDERGLL
"

mkdir testpair2

cp Orthogroups.OG0015175_aligned_trim_nogaps* ./testpair2

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair2

" phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair2
PhyloPyPruner version 1.2.4
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (1/1)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair2/phylopypruner_output

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
  No. of alignments                    1      1
  No. of sequences                    24     21
  No. of OTUs                         21     21
  Avg no. of sequences / alignment    24     21
  Avg no. of OTUs / alignment         21     21
  Avg sequence length (ungapped)      10     10
  Shortest sequence (ungapped)        10     10
  Longest sequence (ungapped)         10     10
  % missing data                    0.00   0.00
  Concatenated alignment length       10     10

Methods summary:
  Description                   No. removed    % of input
  Short sequences               0         0.00
  Long branches                 0         0.00
  Ultrashort distance pairs     0         0.00
  Divergent sequences           0         0.00
  Collapsed nodes               0         0.00
  OTUs < occupancy threshold    0         0.00
  Genes < occupancy threshold   0         0.00
"



# testpair 3

Orthogroups.OG0011996_aligned_trim_nogaps.fa

" cat Orthogroups.OG0011996_aligned_trim_nogaps.fa
>P1@11502
PLLSLSGSP
>P1@15202
RKLALPSSP
>P13@22480
RKLALPSSP
>P13@22481
RKLALPSSP
>P14@15157
RKLALPSSP
>P15@40269
RKLALPSSP
>P16@39074
PNFFATASI
>P17@18364
RKLALPSSP
>P18@36066
RKLALPSSP
>P19@31572
RKLALPSSP
>P2@28442
RKLALPSSP
>P20@20747
RKLALPSSP
>P21@55787
RKLALPSSP
>P22@60023
RKLALPSSP
>P22@60025
NGFSNVRTE
>P22@60026
RKLALPSSP
>P22@60027
RKLALPSSP
>P22@60028
RKLALPSSP
>P22@60029
RKLALPSSP
>P23@48270
PGISNTKCC
>P23@48271
RKLALPSSP
>P24@37383
LKLALPSSP
>P3@1313
RKLALPSSP
>P4@18194
RKLALPSSP
>Pn@4120
RKIALPSSP
>Pn@518
RKLALPSSP
>Pn@4120
PTFDAPPPP
>Pn@518
PRLNHPPPP
>Plant1@54059
RKLALPSSP
>Plant2@104603
RKLALPSSP
>Plant3@253
RKLALPSSP
>Plant4@2257
RKLALPSSP
"

cp Orthogroups.OG0011996_aligned_trim_nogaps* ./testpair3


phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair3

"PhyloPyPruner version 1.2.4
> using 10 out of 144 available threads
> fetching files from directory
example tree names: ['']
example sequences: ['P1@11502', 'P1@15202']
error: MSA names don't match tree
   /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair3/Orthogroups.OG0011996_aligned_trim_nogaps.fa
   Orthogroups.OG0011996_aligned_trim_nogaps.tre
> processing MSAs and trees (1/1)
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/testpair3/phylopypruner_output

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
  No. of alignments                    1      0
  No. of sequences                    32      0
  No. of OTUs                         21      0
  Avg no. of sequences / alignment    32      0
  Avg no. of OTUs / alignment         21      0
  Avg sequence length (ungapped)       9      0
  Shortest sequence (ungapped)         9      0
  Longest sequence (ungapped)          9      0
  % missing data                    0.00   0.00
  Concatenated alignment length        9      0

Methods summary:
  Description                   No. removed    % of input
  Short sequences               0         0.00
  Long branches                 0         0.00
  Ultrashort distance pairs     0         0.00
  Divergent sequences           0         0.00
  Collapsed nodes               0         0.00
  OTUs < occupancy threshold    0         0.00
"


##  issue is the .tre file is emtpy!!
##  create back up and then delete pairs with empty .tre file and run phylopypruner

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/

mkdir rm_emptytre

cp * ./rm_emptytre


# okay try create .tre file for above and re run

fasttree_linux < Orthogroups.OG0011996_aligned_trim_nogaps.fa > Orthogroups.OG0011996_aligned_trim_nogaps.tre

" fasttree_linux < Orthogroups.OG0011996_aligned_trim_nogaps.fa > Orthogroups.OG0011996_aligned_trim_nogaps.tre
FastTree Version 2.1.5 SSE3, OpenMP (144 threads)
Alignment: standard input
Amino acid distances: BLOSUM45 Joins: balanced Support: SH-like 1000
Search: Normal +NNI +SPR (2 rounds range 10) +ML-NNI opt-each=1
TopHits: 1.00*sqrtN close=default refresh=0.80
ML Model: Jones-Taylor-Thorton, CAT approximation with 20 rate categories
Non-unique name 'Pn@4120' in the alignment
"

cat Orthogroups.OG0011996_aligned_trim_nogaps.tre


cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/nogaps/backup/phylopypruner/rm_emptytre








######################################## NO TRIMAL #####
#### not working so try phylopypruner before trimal
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/

mkdir backup

cp *aligned.faa ./backup

cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/backup

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


# Rename all *.faa to *.fa 
for file in *.faa; do
    mv -- "$file" "${file%.faa}.fa"
done




# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done



# fasttree
cd /Volumes/archive/kennylab/roseanna_kawakawa/assembly_per_plant/orthogroup_aminoacidseq/faa_aligned_orthogroups/backup/phylopypruner

screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./phylopypruner/"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/Orthogroups.OG*_aligned.fa; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract the base name (without extension) of the file
        base=$(basename "$file" .fa)
        
        # Construct output file name
        output_file="$output_dir/${base}.tre"
        
        # Run fasttree_linux with input and output file names
        fasttree_linux < "$file" > "$output_file"
        
        echo "Processed $file -> $output_file"
    else
        echo "File $file not found."
    fi
done
 
screen -r 110545










### do on test dataset

cd /Volumes/archive/kennylab/roseanna_kawakawa/phyloprunnertest/lophotrochozoa/backup


# fasttree

screen

# Assuming all input files are in the current directory
input_dir="./"
output_dir="./"  # Directory where output files will be saved

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each input file
for file in "$input_dir"/*.fa; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract the base name (without extension) of the file
        base=$(basename "$file" .fa)
        
        # Construct output file name
        output_file="$output_dir/${base}.tre"
        
        # Run fasttree_linux with input and output file names
        fasttree_linux < "$file" > "$output_file"
        
        echo "Processed $file -> $output_file"
    else
        echo "File $file not found."
    fi
done
 
screen -r 298619




conda activate myenv

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/phyloprunnertest/lophotrochozoa/backup/


"phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/phyloprunnertest/lophotrochozoa/backup/
PhyloPyPruner version 1.2.4
warning: found files from a previous run, overwrite these files? (y/n):y
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (10/10)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/phyloprunnertest/lophotrochozoa/backup/phylopypruner_output

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
  No. of alignments                    10      10
  No. of sequences                    819     386
  No. of OTUs                          74      74
  Avg no. of sequences / alignment     81      38
  Avg no. of OTUs / alignment          56      38
  Avg sequence length (ungapped)      174     176
  Shortest sequence (ungapped)         52      52
  Longest sequence (ungapped)         232     232
  % missing data                    26.60   52.60
  Concatenated alignment length      1913    1909

Methods summary:
  Description                   No. removed    % of input
  Short sequences                0          0.00
  Long branches                  0          0.00
  Ultrashort distance pairs      0          0.00
  Divergent sequences            0          0.00
  Collapsed nodes                0          0.00
  OTUs < occupancy threshold     0          0.00
  Genes < occupancy threshold    0          0.00
"













## TRY PHYLOPRUNER ON raw ORTHOFINDER OUTPUTS...


# HAVE TO RENAME HEADERS IN FILES AND FILE EXTENSIONS

# copy GENE TREES AND MULTIPLE SEQ ALIGNMENTS into folder

mkdir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner

##  had to loop the copying as there were so many files
screen

for i in /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/MultipleSequenceAlignments/*; do cp "$i" /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner/; done

screen -r 42507

screen

for i in /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/Gene_Trees/*; do cp "$i" /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner/; done

screen -r 49601

## rename extensions

# Rename all *.txt to *.tre
for file in *.txt; do
    mv -- "$file" "${file%.txt}.tre"
done


##  try with test two files
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner/
mkdir test

# copy the two files below into test dir

OG0000067.fa        OG0000067_tree.tre

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner/OG0000067_tree.tre /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/phylopypruner/test

# .fa file

# renames plant_1 to plant1_

for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/Plant_/Plant/g' "$file"
    fi
done




# renames Pn to Pn_
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/PiperV3_Pn/Pn_/g' "$file"
    fi
done





# get rid of trans bit in between and repeating name ... only works on .fa file... ends up deleting stuff in .tre file... so need to redo just specifying .fa files.. and figure out way to edit .tre file headers...
for file in *; do
    if [ -f "$file" ]; then
         sed -i 's/.^*_P/P/g' "$file"
    fi
done



##  try for tre... fail

for file in *.tre; do
    if [ -f "$file" ]; then
         sed -i 's/,*_P*,/,P/g' "$file"
    fi
done





# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done
