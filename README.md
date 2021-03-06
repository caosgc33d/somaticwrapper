
# Somaticwrapper version 1.5 #

Detect somatic variants from tumor and normal WXS based on HG38 reference. SomaticWrapper pipeline is a fully automated and modular software package designed for detection of somatic variants from tumor and normal exome data. It works on LSF job scheduler and can run multiple jobs in parallel. Multiple standard variant calling tools are included in the pipeline such as varscan2, strelka2, mutect1 and pindel. 

SNV calls are intersecting results from 2 over 3 callers (Strelka2, Mutect1, and VarScan2).

Indel calls are called by 2 over 3 callers (Strelka2, Varscan2 and pindel). 

Improvements compared to version 1.4:

1) Adding vcf checking step before merging 

2) Make DNP annotation work

3) Add exonic option to let users select whether to only output the exonic mutations or all mutations

If you want to run somaticwrapper for hg19 reference, you can git clone the withmutect branch. 

## Install the third-party software ##

Mutect-1.1.7: https://software.broadinstitute.org/gatk/download/archive

Strelka-2.9.2: https://github.com/Illumina/strelka/releases

Varscan 2.2.8: https://sourceforge.net/projects/varscan/files/

Pindel version 0.2.5b9: http://gmt.genome.wustl.edu/packages/pindel/user-manual.html

bam-readcount 0.7.4: https://github.com/genome/bam-readcount 

## Usage ##

Step1: Enter the directory where you downloaded somaticwrapper pipeline 

Step2: Type the coommand line: perl somaticwrapper.pl  --srg --step --sre --rdir --ref --log --q --mincovt --mincovn --minvaf --maxindsize --exonic

rdir = full path of the folder holding files for this sequence run (user must provide)

log = full path of the folder for saving log file; usually upper folder of rdir

srg = bam having read group or not: 1, yes and 0, no (default 1)

sre = re-run: 1, yes and 0, no  (default 0)

step run this pipeline step by step. (user must provide)

ref: the human reference: 

q: which queue for submitting job; research-hpc, ding-lab, long (default)

mincovt: minimum coverage for tumor: default >=14

mincovn: minimum coverage for normal: default >=8

minvaf: minimum somatic vaf: default >=0.05

maxindsize: default <=100

exonic: output exonic region: 1 Yes, 0 No, Default Yes

hg38: /gscmnt/gc2521/dinglab/mwyczalk/somatic-wrapper-data/image.data/A_Reference/GRCh38.d1.vd1.fa

[0]  Run all steps 

[1]  Run streka 

[2]  Run Varscan 

[3]  Run Pindel 

[4]  Run mutect 

[5]  Parse mutect result 

[6]  Parse streka result 

[7]  Parse VarScan result 

[8]  Parse Pindel 

[9] QC vcf files

[10]  Merge vcf files   

[11] Generate maf file  

[12] Generate merged maf file 

[13] DNP annotation


## Contact ##

Song Cao, scao@wustl.edu 
