DATAD="/usr/local/somaticwrapper/testing/StrelkaDemo.dat"
source project_config.sh $DATAD

STEP="merge_vcf"

# merge_vcf:
#     --strelka_snv_vcf s: output file generated by parse_strelka.  Required
#     --varscan_snv_vcf s: output file generated by parse_varscan.  Required
#     --varscan_indel_vcf s: output file generated by parse_varscan.  Required
#     --pindel_vcf s: output file generated by parse_pindel.  Required
#     --reference_fasta s: path to reference.  Required
#     --bypass_merge: Bypass filter by retaining all reads
#     --bypass: Same as --bypass_merge
#     --debug: print out processing details to STDERR

STRELKA_SNV_VCF="results/vaf_length_depth_filters/strelka.snv.vcf"
VARSCAN_SNV_VCF="results/vaf_length_depth_filters/varscan.snv.vcf"
VARSCAN_INDEL_VCF="results/vaf_length_depth_filters/varscan.indel.vcf"
PINDEL_VCF="results/vaf_length_depth_filters/pindel.indel.vcf"

ARGS="\
--strelka_snv_vcf $STRELKA_SNV_VCF \
--varscan_snv_vcf $VARSCAN_SNV_VCF \
--varscan_indel_vcf $VARSCAN_INDEL_VCF \
--pindel_vcf $PINDEL_VCF \
--reference_fasta $REFERENCE_FASTA \
--results_dir $RESULTS_DIR \
"
#--bypass \

BIN="/usr/local/somaticwrapper/SomaticWrapper.pl"
perl $BIN $ARGS $STEP

# Result: results/merged/merged.filtered.vcf