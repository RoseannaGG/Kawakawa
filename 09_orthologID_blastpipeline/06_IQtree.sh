If phylopypruner finishes, pipe the results into FasConCat and start tree building, if that is OK? Phylopypruner should also give you a partitioned alignment file as an output, but this will need checking for number of samples included – there should be 21. If so, you can run IQTree and get a nice phylogeny?

 

The IQtree manual is here: (please have a read)

http://www.iqtree.org/doc/Tutorial

 

You will first want to find a good model

 

/Volumes/userdata/staff_users/nathankenny/labfiles/LocalProgrammes/iqtree-2.3.2-Linux-intel/bin/iqtree2 -s supermatrix.fas -m MFP -p partition_data.txt

## edited
/Volumes/userdata/staff_users/nathankenny/labfiles/LocalProgrammes/iqtree-2.3.2-Linux-intel/bin/iqtree2 -s supermatrix.fas -m MFP -p /Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/OrthoFinder/Results_Jul18_1/phylopypruner/phylopypruner_output/output_alignments

 

IQtree will complain about missing data – run this anyway and see what it says! Then try running with that model, and for ~50 bootstrap replicates to get an initial idea. When you are happy, run with 500 or 1000 bootstrap replicates. You can use -T to specify more than one CPU (try 4 or 8)

 

The command should look something like:

/Volumes/userdata/staff_users/nathankenny/labfiles/LocalProgrammes/iqtree-2.3.2-Linux-intel/bin/iqtree2 -s supermatrix.fas -p partition_data.txt.best_scheme.nex -b 50 -T 8

/Volumes/userdata/staff_users/nathankenny/labfiles/LocalProgrammes/iqtree-2.3.2-Linux-intel/bin/iqtree2 -s supermatrix.fas -p Volumes/archive/kennylab/roseanna_kawakawa/orthofinder/dashheaderrenamed/OrthoFinder/Results_Jul16/WorkingDirectory/OrthoFinder/Results_Jul18_1/phylopypruner/phylopypruner_output/output_alignments -b 50 -T 8 -m TIM2+I+G # I'll whatever model the model fitting determines is the best model



 

Thanks!