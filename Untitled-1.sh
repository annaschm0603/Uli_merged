#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=1
#SBATCH --time=08:00:00

ml bedtools/2.27.1-foss-2018b

bedtools intersect -v -a macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aIswi_bWT_iswispecific_05.bed
bedtools intersect -v -a macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aIswi_bWT_iswispecific_05.bed
bedtools intersect -a macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aWT_bIswi_overlap_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.W6/summit_WT_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W6/summit_Iswi_H2A.W6.merged_peaks.narrowPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.W6/narrow_WT_H2A.W6.merged_peaks.narrowPeak -b macs2_peaks/Iswi_H2A.W6/narrow_Iswi_H2A.W6.merged_peaks.narrowPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_narrow_aWT_bIswi_wtspecific_05.bed
bedtools intersect -v -a macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aWT_bIswi_wtspecific_05.bed
bedtools intersect -a macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aWT_bIswi_overlap_05.bed
 bedtools intersect -a macs2_peaks/WT_H2A.W6/broad_WT_H2A.W6.merged_peaks.broadPeak -b macs2_peaks/Iswi_H2A.W6/broad_Iswi_H2A.W6.merged_peaks.broadPeak -wao -e -f 0.5 -F 0.5 > test_intersect/W6_broad_aWT_bIswi_overlap_05.bam
