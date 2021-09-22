#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mem=64gb

ml bedtools/2.27.1-foss-2018b

 for i in *.bed
 do
 echo ${i%.*}
 bedtools closest -a ${i} -b all_sorted.bed -d > peak_intersect_annotated/${i%.*}.annotated.bed
 done