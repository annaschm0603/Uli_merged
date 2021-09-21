#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mem=64gb

cd /groups/berger/lab/Anna/ngs/uli_merged/peak_interesects/peak_intersect_annotated/
 for i in *.bed
 do
 source activate work_gat
 echo ${i%.*}
 gat-run.py --segments=${i} --annotations=gat/TE_superfamilies.bed --workspace=gat/tair10.bed >gat/${i%.*}.gat.out
 done