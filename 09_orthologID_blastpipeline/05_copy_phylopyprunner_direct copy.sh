

## TRY PHYLOPRUNER ON raw ORTHOFINDER OUTPUTS...


# HAVE TO RENAME HEADERS IN FILES AND FILE EXTENSIONS

# copy GENE TREES AND MULTIPLE SEQ ALIGNMENTS into folder
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/OrthoFinder/Results_Jul18_1/


mkdir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/


##  had to loop the copying as there were so many files
screen

for i in /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/MultipleSequenceAlignments/*; do cp "$i" /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/; done

screen -r 99249


screen

for i in /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/Gene_Trees/*; do cp "$i" /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/; done
screen -r 25894

## rename extensions
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/

# _tree.txt -> .tre
# Rename all *_tree.txt to *.tre
for file in *_tree.txt; do
    mv -- "$file" "${file%_tree.txt}.tre"
done



##  try with test two files
cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/test/
mkdir test

# copy the two files below into test dir

OG0000067.fa        OG0000067.tre



cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//OG0000067* /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test

cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test

## renames files..

# renames plant_1 to plant1_
#test
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/Plant4_Plant4/Plant4/g' "$file"
    fi
done

## renames all plants...

for plant in Plant1 Plant2 Plant3 Plant4; do
    for file in *; do
        if [ -f "$file" ]; then
            sed -i "s/${plant}_${plant}/${plant}/g" "$file"
        fi
    done
done


## now for all P1 and Pn etc


for plant in Pn P22 P16 P1 P19 P21 P15 P3 P2 P14 P2 P24 P3 P18 P20 P17 P1 P23 P4 P13; do
    for file in *; do
        if [ -f "$file" ]; then
            sed -i "s/${plant}_${plant}/${plant}/g" "$file"
        fi
    done
done



# renames plant1_ to plant1@
for file in *; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done

conda activate myenv



phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test/

"$ phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test/
PhyloPyPruner version 1.2.4
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (1/1)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test/phylopypruner_output

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
  No. of sequences                   170     11
  No. of OTUs                         21     11
  Avg no. of sequences / alignment   170     11
  Avg no. of OTUs / alignment         21     11
  Avg sequence length (ungapped)     121    101
  Shortest sequence (ungapped)        53     75
  Longest sequence (ungapped)        288    136
  % missing data                    60.00   43.80
  Concatenated alignment length      303    181

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

## okay now try for all



## still some different naming of same orthologue...
"roseannagamlen-greene@biochemcompute1 /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner/
$ cat OG0096299.fa
>Pn-69_6
MPLSYQRHQNVPQLKTKLYVQPGDTEKGNVVFYISRRKTVSNNAKRKGPIQGLQAGEKVK
VRDIFYKRTMLGLHLVYLQKL--KTLQPQLHIVVRGYEVGVVAKLKGPVEEVGLIKDLAE
VVRLVGSSLVALGSIATQEDGRWI
>Pn-1_1227
MPLSYQRHQNVPQLKTKLYVQPGDTEKGNVVFYISRRKTVSNNAKRKGPIQGLQAGEKVK
VRDIFYKRTMFGLHLVYLQKLAVKTLQPQLHIVVRGYEVSVVAKLKGPVEEVGLIKDLAE
VVRLVGSSLVALGSIATQEDGRWI
"



cd /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//test

## renames files..

## renames all plants...
screen

for plant in Plant1 Plant2 Plant3 Plant4; do
    for file in OG*; do
        if [ -f "$file" ]; then
            sed -i "s/${plant}_${plant}/${plant}/g" "$file"
        fi
    done
done


## now for all P1 and Pn etc
screen

for plant in Pn P22 P16 P1 P19 P21 P15 P3 P2 P14 P2 P24 P3 P18 P20 P17 P1 P23 P4 P13; do
    for file in OG*; do
        if [ -f "$file" ]; then
            sed -i "s/${plant}_${plant}/${plant}/g" "$file"
        fi
    done
done

screen -r 290947

screen -r 290947
# renames plant1_ to plant1@
for file in OG*; do
    if [ -f "$file" ]; then
        sed -i 's/_/@/g' "$file"
    fi
done

screen -r 290947

conda activate myenv


screen -r 290947

## nb noticed there are some files that don't have a .tre file... why?

phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//

screen -r 290947

"
$ phylopypruner --dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//
PhyloPyPruner version 1.2.4
> using 10 out of 144 available threads
> fetching files from directory
> processing MSAs and trees (54321/54321)
> plotting (disable with '--no-plot')
> concatenating output alignments into a supermatrix
> wrote output to:
  /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/RenamedHeaders2/OrthoFinder/Results_Jul31/WorkingDirectory/OrthoFinder/Results_Aug05_1/phylopypruner//phylopypruner_output

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
  Description                        Input       Output
  No. of alignments                     54321       43664
  No. of sequences                    1072471      319776
  No. of OTUs                              23          22
  Avg no. of sequences / alignment         19           7
  Avg no. of OTUs / alignment              10           7
  Avg sequence length (ungapped)          252         196
  Shortest sequence (ungapped)             40          40
  Longest sequence (ungapped)            4849        3672
  % missing data                        66.20       73.50
  Concatenated alignment length      14112904    10123778

Methods summary:
  Description                   No. removed    % of input
  Short sequences                    0              0.00
  Long branches                      0              0.00
  Ultrashort distance pairs          0              0.00
  Divergent sequences                0              0.00
  Collapsed nodes                    0              0.00
  OTUs < occupancy threshold         0              0.00
  Genes < occupancy threshold        0              0.00
(myenv)
"