screen

sample_names=("P13A" "P17A" "P20A" "P24A" "Plant_1A" "P13B" "P17B" "P20C" "P24B" "Plant_1B" "P13C" "P17C" "P21A" "P24C" "Plant_1C" "P14A" "P18A" "P21B" "P2A" "Plant_2B" "P14B" "P18B" "P21C" "P2B" "Plant_2C" "P14C" "P18C" "P22A" "P2C" "Plant_3B" "P15A" "P19A" "P22B" "P3A" "Plant_3C" "P15B" "P19B" "P22C" "P3B" "Plant_4A" "P15C" "P19C" "P23A" "P3C" "P16A" "P1A" "P23B" "P4A" "P16B" "P1C" "P23C" "P4C" "Plant_4B" "Plant_4C")


# Trinity command and common parameters
trinity_cmd="/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity"
common_params="--seqType fq --max_memory 512G --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF"

reads_dir="/Volumes/archive/kennylab/roseanna_kawakawa/Trimmed_reads3"

# Define the output directory
output_dir="/Volumes/archive/kennylab/roseanna_kawakawa/assemblies"



# Loop through the sample names and run Trinity
for sample in "${sample_names[@]}"; do
  left="${reads_dir}/${sample}_R1_PE.fastq.gz"
  right="${reads_dir}/${sample}_R2_PE.fastq.gz"

  # Run Trinity for each sample
  "$trinity_cmd" $common_params --left "$left" --right "$right" --output "$output_dir"/trinity_kawakawa_${sample}


   # Print a line indicating the completion of processing the current sample
  echo "Trinity completed for sample: $sample"

done


screen -r 132836

"
CMD finished (0 seconds)
* [Tue Dec 26 07:07:15 2023] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py --trinity_fasta /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_354/c35422.trinity.reads.fa.out/Trinity.tmp.fasta --out_prefix /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_354/c35422.trinity.reads.fa.out/Trinity.tmp.fasta.ST --incl_cdna
Tuesday, December 26, 2023: 07:07:15    CMD: mv /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_14/c1471.trinity.reads.fa.out/Trinity.tmp.fasta.ST.transcripts.fa /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_14/c1471.trinity.reads.fa.out.Trinity.fasta
CMD finished (0 seconds)


#############################################################################
Finished.  Final Trinity assemblies are written to /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_14/c1471.trinity.reads.fa.out.Trinity.fasta
#############################################################################


Fully cleaning up.
succeeded(44337)   99.9977% completed.    Tuesday, December 26, 2023: 07:07:15  CMD: mv /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_354/c35422.trinity.reads.fa.out/Trinity.tmp.fasta.ST.transcripts.fa /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_354/c35422.trinity.reads.fa.out.Trinity.fasta
CMD finished (0 seconds)


#############################################################################
Finished.  Final Trinity assemblies are written to /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/Fb_0/CBin_354/c35422.trinity.reads.fa.out.Trinity.fasta
#############################################################################


Fully cleaning up.
succeeded(44338)   100% completed.

All commands completed successfully. :-)

CMD finished (3909 seconds)


** Harvesting all assembled transcripts into a single multi-fasta file...

Tuesday, December 26, 2023: 07:07:16    CMD: find /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/read_partitions/ -name '*inity.fasta'  | /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/partitioned_trinity_aggregator.pl --token_prefix TRINITY_DN --output_prefix /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/Trinity.tmp
CMD finished (907 seconds)
* [Tue Dec 26 07:22:23 2023] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/salmon_runner.pl Trinity.tmp.fasta /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/both.fa 32
* [Tue Dec 26 07:23:22 2023] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/filter_transcripts_require_min_cov.pl Trinity.tmp.fasta /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C/both.fa salmon_outdir/quant.sf 2 > /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C.Trinity.fasta


#############################################################################
Finished.  Final Trinity assemblies are written to /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C.Trinity.fasta
#############################################################################


Fully cleaning up.
Tuesday, December 26, 2023: 07:24:30    CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/get_Trinity_gene_to_trans_map.pl /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C.Trinity.fasta > /Volumes/archive/kennylab/roseanna_kawakawa/assemblies/trinity_kawakawa_Plant_4C.Trinity.fasta.gene_trans_map
CMD finished (1 seconds)
Trinity completed for sample: Plant_4C
"