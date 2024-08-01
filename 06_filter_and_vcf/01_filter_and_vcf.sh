
################################################
####### filter mapping quality and export vcf again #############
##########################################################
cd /Volumes/archive/kennylab/roseanna_kawakawa/alignment/sorted_bamfiles/
# check quality of reads
samtools view -c P13A_Aligned-sorted.bam # 12521348
samtools view -q 20 -c P13A_Aligned-sorted.bam # 9478509
samtools view -q 30 -c P13A_Aligned-sorted.bam
samtools view -q 10 -c P13A_Aligned-sorted.bam

## filter all reads for quality


input_dir="/Volumes/archive/kennylab/roseanna_kawakawa/alignment/sorted_bamfiles/"


for bam_file in "${input_dir}"/*.bam; do
    # Output file with filtered reads
    output_file="${bam_file%.bam}_mapq20.bam"

    # Use samtools view to filter reads with mapping quality of 20 or more
    samtools view -q 20 -b "$bam_file" > "$output_file"

    echo "Filtered reads with mapping quality 20 or more for $bam_file and saved to $output_file"
done


# check 
samtools view -c P13A_Aligned-sorted_mapq20.bam

# turn sorted bam to bcf

screen

samtools mpileup -g -f /Volumes/archive/kennylab/roseanna_kawakawa/annotation_evigene/trinity_kawakawa_Trinity_okaytr.fasta "P13A_Aligned-sorted_mapq20.bam" "P17A_Aligned-sorted_mapq20.bam" "P20A_Aligned-sorted_mapq20.bam" "P24A_Aligned-sorted_mapq20.bam" "Plant_1A_Aligned-sorted_mapq20.bam" "P13B_Aligned-sorted_mapq20.bam" "P17B_Aligned-sorted_mapq20.bam" "P20C_Aligned-sorted_mapq20.bam" "P24B_Aligned-sorted_mapq20.bam" "Plant_1B_Aligned-sorted_mapq20.bam" "P13C_Aligned-sorted_mapq20.bam" "P17C_Aligned-sorted_mapq20.bam" "P21A_Aligned-sorted_mapq20.bam" "P24C_Aligned-sorted_mapq20.bam" "Plant_1C_Aligned-sorted_mapq20.bam" "P14A_Aligned-sorted_mapq20.bam" "P18A_Aligned-sorted_mapq20.bam" "P21B_Aligned-sorted_mapq20.bam" "P2A_Aligned-sorted_mapq20.bam" "Plant_2B_Aligned-sorted_mapq20.bam" "P14B_Aligned-sorted_mapq20.bam" "P18B_Aligned-sorted_mapq20.bam" "P21C_Aligned-sorted_mapq20.bam" "P2B_Aligned-sorted_mapq20.bam" "Plant_2C_Aligned-sorted_mapq20.bam" "P14C_Aligned-sorted_mapq20.bam" "P18C_Aligned-sorted_mapq20.bam" "P22A_Aligned-sorted_mapq20.bam" "P2C_Aligned-sorted_mapq20.bam" "Plant_3B_Aligned-sorted_mapq20.bam" "P15A_Aligned-sorted_mapq20.bam" "P19A_Aligned-sorted_mapq20.bam" "P22B_Aligned-sorted_mapq20.bam" "P3A_Aligned-sorted_mapq20.bam" "Plant_3C_Aligned-sorted_mapq20.bam" "P15B_Aligned-sorted_mapq20.bam" "P19B_Aligned-sorted_mapq20.bam" "P22C_Aligned-sorted_mapq20.bam" "P3B_Aligned-sorted_mapq20.bam" "Plant_4A_Aligned-sorted_mapq20.bam" "P15C_Aligned-sorted_mapq20.bam" "P19C_Aligned-sorted_mapq20.bam" "P23A_Aligned-sorted_mapq20.bam" "P3C_Aligned-sorted_mapq20.bam" "P16A_Aligned-sorted_mapq20.bam" "P1A_Aligned-sorted_mapq20.bam" "P23B_Aligned-sorted_mapq20.bam" "P4A_Aligned-sorted_mapq20.bam" "P16B_Aligned-sorted_mapq20.bam" "P1C_Aligned-sorted_mapq20.bam" "P23C_Aligned-sorted_mapq20.bam" "P4C_Aligned-sorted_mapq20.bam" "Plant_4B_Aligned-sorted_mapq20.bam" "Plant_4C_Aligned-sorted_mapq20.bam"  > /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_raw_mapq20.bcf

echo "BCF file generated"

screen -r 187665


cd /Volumes/archive/kennylab/roseanna_kawakawa/alignment/sorted_bamfiles/
samtools view -c P16A_Aligned-sorted.bam # 20249935
samtools view -c P16B_Aligned-sorted.bam # 2466720

samtools view -c P16A_Aligned-sorted_mapq20.bam # 15389373
samtools view -c P16B_Aligned-sorted_mapq20.bam # 1922323


## turn bcf to vcf

### nathan try ## THE ONE I USED
cd /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/

screen

bcftools view /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_raw_mapq20.bcf | bcftools call -mv -Ov > /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_call_mapq20_var.vcf

screen -r 187665


## remove pcr duplicates
screen
bcftools norm -D kawakawa_call_mapq20_var.vcf -o kawakawa_call_mapq20_var_rmpcrdup.vcf
screen -r 127370

"$ bcftools norm -D kawakawa_call_mapq20_var.vcf -o kawakawa_call_mapq20_var_rmpcrdup.vcf
Warning: `-D` is functional but deprecated, replaced by and alias of `-d none`.
Lines   total/split/realigned/skipped:  1125231/0/0/0
"

## VCF FILTER

cd /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/filter/


#20% missing
/Volumes/archive/kennylab/LocalProgrammes/vcftools/bin/vcftools --vcf /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_call_mapq20_var.vcf \
--minGQ 20 \
--minQ 20 \
--min-alleles 2 \
--max-missing 0.8 \
--minDP 4 \
--maf 0.05 \
--max-maf 0.40 \
--remove-filtered-all \
--recode \
--recode-INFO-all \
--out /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/filter/kawakawa_call_mapq20_var_Q20_ma2_ms08_mDP4_maf005_Mmaf04


" Warning: Expected at least 2 parts in INFO entry: ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes for each ALT allele, in the same order as listed">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
After filtering, kept 54 out of 54 Individuals
Outputting VCF file...
After filtering, kept 61068 out of a possible 1125231 Sites
Run Time = 15.00 seconds
"


# 60% missing
/Volumes/archive/kennylab/LocalProgrammes/vcftools/bin/vcftools --vcf /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_call_mapq20_var.vcf \
--minGQ 20 \
--minQ 20 \
--min-alleles 2 \
--max-missing 0.4 \
--minDP 4 \
--maf 0.05 \
--max-maf 0.40 \
--remove-filtered-all \
--recode \
--recode-INFO-all \
--out /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/filter/kawakawa_call_mapq20_var_Q20_ma2_ms04_mDP4_maf005_Mmaf04

"

Warning: Expected at least 2 parts in INFO entry: ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes for each ALT allele, in the same order as listed">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
After filtering, kept 54 out of 54 Individuals
Outputting VCF file...
After filtering, kept 139954 out of a possible 1125231 Sites
Run Time = 16.00 seconds


"

#0% missing
/Volumes/archive/kennylab/LocalProgrammes/vcftools/bin/vcftools --vcf /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_call_mapq20_var.vcf \
--minGQ 20 \
--minQ 20 \
--min-alleles 2 \
--max-missing 1 \
--minDP 4 \
--maf 0.05 \
--max-maf 0.40 \
--remove-filtered-all \
--recode \
--recode-INFO-all \
--out /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/filter/kawakawa_call_mapq20_var_Q20_ma2_ms1_mDP4_maf005_Mmaf04


"
Warning: Expected at least 2 parts in INFO entry: ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes for each ALT allele, in the same order as listed">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
After filtering, kept 54 out of 54 Individuals
Outputting VCF file...
After filtering, kept 2637 out of a possible 1125231 Sites
Run Time = 12.00 seconds
"





#0% missing
/Volumes/archive/kennylab/LocalProgrammes/vcftools/bin/vcftools --vcf /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/kawakawa_call_mapq20_var_rmpcrdup.vcf \
--minGQ 20 \
--minQ 20 \
--min-alleles 2 \
--max-missing 1 \
--minDP 4 \
--maf 0.05 \
--max-maf 0.40 \
--remove-filtered-all \
--recode \
--recode-INFO-all \
--out /Volumes/archive/kennylab/roseanna_kawakawa/SNP_calling/filter/kawakawa_call_mapq20_rmpcrdup_var_Q20_ma2_ms1_mDP4_maf005_Mmaf04

"
Warning: Expected at least 2 parts in INFO entry: ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes for each ALT allele, in the same order as listed">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
Warning: Expected at least 2 parts in INFO entry: ID=DP4,Number=4,Type=Integer,Description="Number of high-quality ref-forward , ref-reverse, alt-forward and alt-reverse bases">
After filtering, kept 54 out of 54 Individuals
Outputting VCF file...
After filtering, kept 2637 out of a possible 1125231 Sites
Run Time = 12.00 seconds
"













