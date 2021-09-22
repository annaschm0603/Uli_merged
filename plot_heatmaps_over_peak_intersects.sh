#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mem=64gb

#list_dir=/groups/berger/lab/Anna/ngs/cell_cycle_cur2/combined/${NAME}.bam
echo $Name
#4. sample name
module load deeptools/3.3.1-foss-2018b-python-3.6.6
computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_broad_aIswi_bWT_iswispecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_broad_aIswi_bWT_iswispecific_05.gz
 plotHeatmap -m W6_W6_broad_aIswi_bWT_iswispecific_05.gz -out W6_W6_broad_aIswi_bWT_iswispecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_broad_aWT_bIswi_overlap_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_broad_aWT_bIswi_overlap_05.gz
 plotHeatmap -m W6_W6_broad_aWT_bIswi_overlap_05.gz -out W6_W6_broad_aWT_bIswi_overlap_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_broad_aWT_bIswi_wtspecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_broad_aWT_bIswi_wtspecific_05.gz
 plotHeatmap -m W6_W6_broad_aWT_bIswi_wtspecific_05.gz -out W6_W6_broad_aWT_bIswi_wtspecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_broad_aIswi_bWT_iswispecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_broad_aIswi_bWT_iswispecific_05.gz
 plotHeatmap -m W7_W7_broad_aIswi_bWT_iswispecific_05.gz -out W7_W7_broad_aIswi_bWT_iswispecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_broad_aWT_bIswi_overlap_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_broad_aWT_bIswi_overlap_05.gz
 plotHeatmap -m W7_W7_broad_aWT_bIswi_overlap_05.gz -out W7_W7_broad_aWT_bIswi_overlap_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_broad_aWT_bIswi_wtspecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_broad_aWT_bIswi_wtspecific_05.gz
 plotHeatmap -m W7_W7_broad_aWT_bIswi_wtspecific_05.gz -out W7_W7_broad_aWT_bIswi_wtspecific_05.png --colorMap Blues 

###narrowpeaks
computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_narrow_aIswi_bWT_iswispecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_narrow_aIswi_bWT_iswispecific_05.gz
 plotHeatmap -m W6_W6_narrow_aIswi_bWT_iswispecific_05.gz -out W6_W6_narrow_aIswi_bWT_iswispecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_narrow_aWT_bIswi_overlap_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_narrow_aWT_bIswi_overlap_05.gz
 plotHeatmap -m W6_W6_narrow_aWT_bIswi_overlap_05.gz -out W6_W6_narrow_aWT_bIswi_overlap_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W6.log2r.bw -R peak_interesects/W6_narrow_aWT_bIswi_wtspecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W6_W6_narrow_aWT_bIswi_wtspecific_05.gz
 plotHeatmap -m W6_W6_narrow_aWT_bIswi_wtspecific_05.gz -out W6_W6_narrow_aWT_bIswi_wtspecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_narrow_aIswi_bWT_iswispecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_narrow_aIswi_bWT_iswispecific_05.gz
 plotHeatmap -m W7_W7_narrow_aIswi_bWT_iswispecific_05.gz -out W7_W7_narrow_aIswi_bWT_iswispecific_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_narrow_aWT_bIswi_overlap_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_narrow_aWT_bIswi_overlap_05.gz
 plotHeatmap -m W7_W7_narrow_aWT_bIswi_overlap_05.gz -out W7_W7_narrow_aWT_bIswi_overlap_05.png --colorMap Blues 

computeMatrix reference-point -S bam_to_bw/results/bigwigs/*H2A.W7.log2r.bw -R peak_interesects/W7_broad_aWT_bIswi_wtspecific_05.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --referencePoint center --skipZeros -o W7_W7_broad_aWT_bIswi_wtspecific_05.gz
 plotHeatmap -m W7_W7_broad_aWT_bIswi_wtspecific_05.gz -out W7_W7_broad_aWT_bIswi_wtspecific_05.png --colorMap Blues 
