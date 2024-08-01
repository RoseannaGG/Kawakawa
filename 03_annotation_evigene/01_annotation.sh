##############################
### 04_annotation_evigene
###############################
mkdir annotation_evigene

cp /Volumes/archive/kennylab/roseanna_kawakawa/Evigene/okayset/trinity_kawakawa.Trinity.okay.tr /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/

#rename to have fasta extension
mv trinity_kawakawa.Trinity.okay.tr trinity_kawakawa_Trinity_okaytr.fasta


screen

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t trinity_kawakawa_Trinity_okaytr.fasta -m 50

"bash-4.2$ /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t trinity_kawakawa_Trinity_okaytr.fasta -m 50
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/compute_base_probs.pl trinity_kawakawa_Trinity_okaytr.fasta 0 > /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta.transdecoder_dir/base_freqs.dat


-first extracting base frequencies, we'll need them later.


- extracting ORFs from transcripts.
-total transcripts to examine: 257920
[257900/257920] = 99.99% done    CMD: touch /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta.transdecoder_dir.__checkpoints_longorfs/TD.longorfs.ok


#################################
### Done preparing long ORFs.  ###
##################################

        Use file: /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta.transdecoder_dir/longest_orfs.pep  for Pfam and/or BlastP searches to enable homology-based coding region identification.

        Then, run TransDecoder.Predict for your final coding region predictions.
"

screen 

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t trinity_kawakawa_Trinity_okaytr.fasta --single_best_only

screen -r 34575



## converting from gff3 to gtf

screen

/Volumes/archive/kennylab/LocalProgrammes/gffread/gffread -T trinity_kawakawa_Trinity_okaytr.fasta.transdecoder.gff3 -o kawakawa_evigene.gtf

screen -r 168389


