#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=1
#SBATCH --time=08:00:00

ml bedtools/2.27.1-foss-2018b

########Bed tools intersect to get the intersection of peak sets and things that dont intersect
###-wao	Write the original A and B entries plus the number of base pairs of overlap between the two features. However, A features w/o overlap are also reported with a NULL B feature and overlap = 0. Restricted by -f and -r.
###-a	BAM/BED/GFF/VCF file “A”. Each feature in A is compared to B in search of overlaps. Use “stdin” if passing A with a UNIX pipe.
###-b	One or more BAM/BED/GFF/VCF file(s) “B”. Use “stdin” if passing B with a UNIX pipe.
###-v	Only report those entries in A that have no overlap in B. Restricted by -f and -r.
#this is to get peaks which are specific to -a
###-f	Minimum overlap required as a fraction of A. Default is 1E-9 (i.e. 1bp).
###-F	Minimum overlap required as a fraction of B. Default is 1E-9 (i.e., 1bp).
###-e	Require that the minimum fraction be satisfied for A _OR_ B. In other words, if -e is used with -f 0.90 and -F 0.10 this requires that either 90% of A is covered OR 10% of B is covered. Without -e, both fractions would have to be satisfied.

#####ISWI specific
###W6
bedtools intersect -v -a macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aIswi_bWT_iswispecific_05.bed
###W7
bedtools intersect -v -a macs2_peaks/Iswi_H2A.W7/broad_Iswi_H2A.W7.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.W7/broad_WT_H2A.W7.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/W7_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.W7/summit_Iswi_H2A.W7.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.W7/summit_WT_H2A.W7.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/W7_narrow_aIswi_bWT_iswispecific_05.bed
###X
bedtools intersect -v -a macs2_peaks/Iswi_H2A.X/broad_Iswi_H2A.X.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.X/broad_WT_H2A.X.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/X_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.X/summit_Iswi_H2A.X.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.X/summit_WT_H2A.X.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/X_narrow_aIswi_bWT_iswispecific_05.bed
###Z
bedtools intersect -v -a macs2_peaks/Iswi_H2A.Z/broad_Iswi_H2A.Z.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.Z/broad_WT_H2A.Z.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/Z_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.Z/summit_Iswi_H2A.Z.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.Z/summit_WT_H2A.Z.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/Z_narrow_aIswi_bWT_iswispecific_05.bed
###H2A.13
bedtools intersect -v -a macs2_peaks/Iswi_H2A.13/broad_Iswi_H2A.13.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.13/broad_WT_H2A.13.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/H2A.13_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.13/summit_Iswi_H2A.13.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.13/summit_WT_H2A.13.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/H2A.13_narrow_aIswi_bWT_iswispecific_05.bed


#####overlap between wt and ISWI
###W6
bedtools intersect -a macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/W6_narrow_aWT_bIswi_overlap_05.bed 
bedtools intersect -a macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/W6_broad_aWT_bIswi_overlap_05.bed
###W7
bedtools intersect -a macs2_peaks/WT_H2A.W7/summit_WT_H2A.W7.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W7/summit_Iswi_H2A.W7.merged_peaks.narrowPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/W7_narrow_aWT_bIswi_overlap_05.bed 
bedtools intersect -a macs2_peaks/WT_H2A.W7/broad_WT_H2A.W7.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W7/broad_Iswi_H2A.W7.merged_peaks.broadPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/W7_broad_aWT_bIswi_overlap_05.bed
###X
bedtools intersect -a macs2_peaks/WT_H2A.X/summit_WT_H2A.X.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.X/summit_Iswi_H2A.X.merged_peaks.narrowPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/X_narrow_aWT_bIswi_overlap_05.bed 
bedtools intersect -a macs2_peaks/WT_H2A.X/broad_WT_H2A.X.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.X/broad_Iswi_H2A.X.merged_peaks.broadPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/X_broad_aWT_bIswi_overlap_05.bed
###Z
bedtools intersect -a macs2_peaks/WT_H2A.Z/summit_WT_H2A.Z.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.Z/summit_Iswi_H2A.Z.merged_peaks.narrowPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/Z_narrow_aWT_bIswi_overlap_05.bed 
bedtools intersect -a macs2_peaks/WT_H2A.Z/broad_WT_H2A.Z.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.Z/broad_Iswi_H2A.Z.merged_peaks.broadPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/Z_broad_aWT_bIswi_overlap_05.bed
###H2A.13
bedtools intersect -a macs2_peaks/WT_H2A.13/summit_WT_H2A.13.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.13/summit_Iswi_H2A.13.merged_peaks.narrowPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/H2A.13_narrow_aWT_bIswi_overlap_05.bed 
bedtools intersect -a macs2_peaks/WT_H2A.13/broad_WT_H2A.13.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.13/broad_Iswi_H2A.13.merged_peaks.broadPeak -wa -wb -e -f 0.5 -F 0.5 | bedtools merge > test_intersect/H2A.13_broad_aWT_bIswi_overlap_05.bed

#####WT specific
###W6
bedtools intersect -v -a macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aWT_bIswi_wtspecific_05.bed
###W7
bedtools intersect -v -a macs2_peaks/WT_H2A.W7/summit_WT_H2A.W7.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W7/summit_Iswi_H2A.W7.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/W7_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.W7/broad_WT_H2A.W7.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W7/broad_Iswi_H2A.W7.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/W7_broad_aWT_bIswi_wtspecific_05.bed
###X
bedtools intersect -v -a macs2_peaks/WT_H2A.X/summit_WT_H2A.X.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.X/summit_Iswi_H2A.X.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/X_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.X/broad_WT_H2A.X.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.X/broad_Iswi_H2A.X.merged_peaks.broadPeak  -e -f 0.5 -F 0.5 > test_intersect/X_broad_aWT_bIswi_wtspecific_05.bed
###Z
bedtools intersect -v -a macs2_peaks/WT_H2A.Z/summit_WT_H2A.Z.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.Z/summit_Iswi_H2A.Z.merged_peaks.narrowPeak  -e -f 0.5 -F 0.5 > test_intersect/Z_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.Z/broad_WT_H2A.Z.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.Z/broad_Iswi_H2A.Z.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/Z_broad_aWT_bIswi_wtspecific_05.bed
###H2A.13
bedtools intersect -v -a macs2_peaks/WT_H2A.13/summit_WT_H2A.13.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.13/summit_Iswi_H2A.13.merged_peaks.narrowPeak -e -f 0.5 -F 0.5 > test_intersect/H2A.13_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.13/broad_WT_H2A.13.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.13/broad_Iswi_H2A.13.merged_peaks.broadPeak -e -f 0.5 -F 0.5 > test_intersect/H2A.13_broad_aWT_bIswi_wtspecific_05.bed
