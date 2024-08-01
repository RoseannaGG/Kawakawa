#These are in here:

/Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/OrthoFinder/Results_May10_6/Single_Copy_Orthologue_Sequences

#align with mafft

#test one
mafft --auto OG0016937.fa > OG0016937_align.fa 

"
outputhat23=16
treein = 0
compacttree = 0
stacksize: 8192 kb
rescale = 1
All-to-all alignment.
tbfast-pair (aa) Version 7.505
alg=L, model=BLOSUM62, 2.00, -0.10, +0.10, noshift, amax=0.0
0 thread(s)

outputhat23=16
Loading 'hat3.seed' ...
done.
Writing hat3 for iterative refinement
rescale = 1
Gap Penalty = -1.53, +0.00, +0.00
tbutree = 1, compacttree = 0
Constructing a UPGMA tree ...
   10 / 21
done.

Progressive alignment ...
STEP    20 /20
done.
tbfast (aa) Version 7.505
alg=A, model=BLOSUM62, 1.53, -0.00, -0.00, noshift, amax=0.0
1 thread(s)

minimumweight = 0.000010
autosubalignment = 0.000000
nthread = 0
randomseed = 0
blosum 62 / kimura 200
poffset = 0
niter = 16
sueff_global = 0.100000
nadd = 16
Loading 'hat3' ... done.
rescale = 1

   10 / 21
Segment   1/  1    1- 487
STEP 002-019-1  identical.
Converged.

done
dvtditr (aa) Version 7.505
alg=A, model=BLOSUM62, 1.53, -0.00, -0.00, noshift, amax=0.0
0 thread(s)


Strategy:
 L-INS-i (Probably most accurate, very slow)
 Iterative refinement method (<16) with LOCAL pairwise alignment information

If unsure which option to use, try 'mafft --auto input > output'.
For more information, see 'mafft --help', 'mafft --man' and the mafft page.

The default gap scoring scheme has been changed in version 7.110 (2013 Oct).
It tends to insert more gaps into gap-rich regions than previous versions.
To disable this change, add the --leavegappyregion option.


"

# do all 

for file in *.fa; do
    # Define the output filename with "_align" added before the .fa extension
    output="${file/.fa/_align.fa}"
    # Run MAFFT to perform the alignment
    mafft --auto "$file" > "$output"
done


### trimAL



nano ~/.bashrc


PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source



crtl x and then y then enter


## NO GAPS

# test on one

trimal -in OG0016937_align.fa -out OG0016937_align_trim_ng.fa -nogaps

# loop

for file in *_align.fa; do
    out_file="${file/_align.fa/_align_trim_ng.fa}"
    trimal -in "$file" -out "$out_file" -nogaps
done



# gappyout

# loop

for file in *_align.fa; do
    out_file="${file/_align.fa/_align_trim_gappyout.fa}"
    trimal -in "$file" -out "$out_file" -gappyout
done


## old didn't work installing and already was installed

# create condo environment
conda create -n trimal -c conda-forge docopt==0.6.2 scipy==0.19.0 matplotlib networkx==1.11 ete3
conda activate trimal


#Clone github repo
git clone https://github.com/inab/trimal.git


#Run install script for fetching databases
cd trimal
./install

# test kinfin
./test





# fast concat


cd /Volumes/archive/kennylab/roseanna_kawakawa/

conda create -n FASconCAT -c conda-forge docopt==0.6.2 scipy==0.19.0 matplotlib networkx==1.11 ete3
conda activate FASconCAT

git clone https://github.com/PatrickKueck/FASconCAT.git
