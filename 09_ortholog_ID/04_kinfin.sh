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




# make config file
# https://kinfin.readme.io/docs/starting-from-a-clustering-files

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/generate_kinfin_input.py --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/ orthofinder config


# copy ortho outputs needed into kinfin folder

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/OrthoFinder/Results_May10_6/Orthogroups/Orthogroups.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/OrthoFinder/Results_May10_6/WorkingDirectory/SpeciesIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/OrthoFinder/Results_May10_6/WorkingDirectory/SequenceIDs.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/


cp /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/config.txt /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/


cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin


## works
screen

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/kinfin -g Orthogroups.txt -c config.txt -s SequenceIDs.txt -p SpeciesIDs.txt -o test --fasta_dir /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/renamedheaders/ 

screen -r 284217

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


## plot

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/plot_cluster_size_distribution.py -i cluster_counts_by_taxon.txt 

"AttributeError: module 'matplotlib' has no attribute 'colormaps'
(kinfin)"








cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/

grep -P "\t21" /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/all.all.cluster_1to1s.txt | cut -f1 > single_copy.cluster_ids.txt


# get_protein_ids_from_cluster.py

cd /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/

/Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts/get_protein_ids_from_cluster.py -g Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt -s

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

#Run the programme:
cd /Volumes/archive/userdata/staff_users/roseannagamlen-greene/kinfin/scripts


# generates one file per orthologue Orthogroups.OG*.txt - and in each file there are the gene names from each plant that correspond to that orthologue gene (ie are the same gene) ... .
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt

# generates single_copy.cluster_ids.protein_ids.txt - which is just a list of all the gene names in each plant that correspond to one of these orthologue clusters
./get_protein_ids_from_cluster.py -g /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/Orthogroups.txt --cluster_ids /Volumes/archive/kennylab/roseanna_kawakawa/kinfin/test.kinfin_results/all/single_copy.cluster_ids.txt -s
 

