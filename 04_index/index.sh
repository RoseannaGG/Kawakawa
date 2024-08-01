
######################
###### 05_index #######
#######################


mkdir star_index

cd /Volumes/archive/kennylab/roseanna_kawakawa/star_index/

screen

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /Volumes/archive/kennylab/roseanna_kawakawa/star_index/ --genomeFastaFiles /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr --sjdbGTFfile /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/kawakawa_evigene.gtf --sjdbOverhang 99 --limitGenomeGenerateRAM 201877951872

screen -r 189112



"
Nov 09 16:01:53 ..... started STAR run
Nov 09 16:01:53 ... starting to generate Genome files
Nov 09 16:07:33 ... starting to sort Suffix Array. This may take a long time...
Nov 09 16:10:26 ... sorting Suffix Array chunks and saving them to disk...
Nov 09 16:13:24 ... loading chunks from disk, packing SA...
Nov 09 16:18:25 ... finished generating suffix array
Nov 09 16:18:25 ... generating Suffix Array index
Nov 09 16:20:50 ... completed Suffix Array index
Nov 09 16:20:50 ..... processing annotations GTF
Nov 09 16:20:53 ... writing Genome to disk ...
Nov 09 16:21:43 ... writing Suffix Array to disk ...
Nov 09 16:21:45 ... writing SAindex to disk
Nov 09 16:21:47 ..... finished successfully

"
