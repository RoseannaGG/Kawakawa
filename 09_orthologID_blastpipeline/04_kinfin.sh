https://github.com/DRL/kinfin

# create condo environment
conda create -n kinfin -c conda-forge docopt==0.6.2 scipy==0.19.0 matplotlib networkx==1.11 ete3
conda activate kinfin

#To activate this environment, use:

    micromamba activate kinfin

    conda activate kinfin


#Or to execute a single command in this environment, use:

    micromamba run -n kinfin mycommand


#Clone github repo
git clone https://github.com/DRL/kinfin.git


#Run install script for fetching databases
cd kinfin
./install

# test kinfin
./test

# usage
./kinfin -h



    conda activate kinfin


# make config file
# https://kinfin.readme.io/docs/starting-from-a-clustering-files

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/generate_kinfin_input.py --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/ orthofinder config


# copy ortho outputs needed into kinfin folder
cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

mkdir blastpipeline

cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/


cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/OrthoFinder/Results_Jul18_1/Orthogroups/Orthogroups.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/SpeciesIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/SequenceIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/


cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/config.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/


cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/


## run...
screen

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt -o test --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/ 

screen -r 90511




#/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt --target_count --target_fraction --min --max --outprefix /Volumes/archive/kennylab/roseanna_kawakawa/kinfin --infer_singletons --min_proteomes --test --taxranks --repetitions --repetitions

#$ /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt --target_count --target_fraction --min --max --outprefix test --infer_singletons --min_proteomes --test


":
Traceback (most recent call last):
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2305, in <module>
    inputObj = InputObj(args)
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2154, in __init__
    self.check_fuzzy_count(args['--target_count'])
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/src/kinfin.py", line 2270, in check_fuzzy_count
    if int(target_count) > 0:
ValueError: invalid literal for int() with base 10: '--target_fraction'
(kinfin)
"

cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results


## plot
    conda activate kinfin


/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py -i cluster_counts_by_taxon.txt -o /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/

"$ /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py -i cluster_counts_by_taxon.txt -o /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/
[+] Start ...
[+] Plotting "loglogpowerlaw" ...
Traceback (most recent call last):
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py", line 240, in <module>
    dataObj.plot_cluster_sizes('loglogpowerlaw')
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py", line 138, in plot_cluster_sizes
    for proteome_count, x, y, y_bottom, colour in self.yield_counts_by_proteome_count('absolute'):
  File "/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py", line 103, in yield_counts_by_proteome_count
    cmap = mat.colormaps[self.cmap]
AttributeError: module 'matplotlib' has no attribute 'colormaps'
(kinfin)
"








cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/

grep -P "\t21" /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/all.all.cluster_1to1s.txt | cut -f1 > single_copy.cluster_ids.txt


# get_protein_ids_from_cluster.py

    conda activate kinfin


cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/get_protein_ids_from_cluster.py -g Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt -s -o /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/

#I googled the error below (AttributeError: 'dict' object has no attribute 'iteritems'), and if you have a look at the results, it is a python2 =/= python3 problem (e.g. the first result is https://stackoverflow.com/questions/30418481/error-dict-object-has-no-attribute-iteritems)

 

#So, I converted the python script from v2 to v3. You can do this manually, but I did it thus:

 

#Install the python2 to python3 tool:

pip3 install 2to3

# didn't work but found it in usr/bin/

 

#Ran it:
cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts


usr/bin/2to3-3 -w get_protein_ids_from_cluster.py

 







conda
#Use nano to open your bashrc file (which says which things to launch on startup – we have used this before)

 

nano ~/.bashrc 

 

#This will open a text file. Navigate to the bottom with your up/down keys. Copy and paste the following line in: (please check I have got how your name is represented in the PATH right – I am writing this from the loo in a hotel room near Charles de Gaulle so the light doesn’t wake the kids, and I can’t get on the servers right now)

 

export PATH="/Volumes/userdata/staff_users/roseannagamlen-greene/miniconda3/bin:$PATH"

 

#don’t worry if you put in extra empty lines before or after, these do nothing. 

 

#Hit control+x to exit, confirming save with Y if asked.

 

#Reboot your programmes with

source ~/.bashrc

 

#Now hit 

conda

 

#and if that works: (feel free to change myenv to whatever you want)

 

conda create -n myenv

conda activate myenv

conda install -c anaconda matplotlib docopt tqdm wget pyyaml git

conda install -c bioconda pysam --update-deps

 

#You will be in an environment called myenv (which has anaconda matplotlib docopt tqdm wget pyyaml git bioconda pysam)

 

#If you start a new session, you can re-activate this with 

 

conda activate myenv




# extracting protein IDs from 

cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/blastpipeline/

 mkidr orthologue

#Run the programme:
cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts

## first backup the outputs from the other run

cp *.txt backupoutputs


# generates one file per orthologue Orthogroups.OG*.txt - and in each file there are the gene names from each plant that correspond to that orthologue gene (ie are the same gene) ... .
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt 

" ./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt
[+] Start ...
[+] Parsing clusters in /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt ...
[+] Parse groups /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/Orthogroups.txt ...
[+] Found 100% of clusters ...
[+] Writing files ...
"


# generates single_copy.cluster_ids.protein_ids.txt - which is just a list of all the gene names in each plant that correspond to one of these orthologue clusters
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt -s 

"[+] Start ...
[+] Parsing clusters in /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/test.kinfin_results/all/single_copy.cluster_ids.txt ...
[+] Parse groups /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/blastpipeline/Orthogroups.txt ...
[+] Found 100% of clusters ...
[+] Writing files ...
"

# backup

cp *.txt blastpipeline