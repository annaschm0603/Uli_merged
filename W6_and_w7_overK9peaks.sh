#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=short
#SBATCH --cpus-per-task=1
#SBATCH --time=08:00:00


k9me2peaks_peri=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/k9me2peaks_in_pericentromere.bed)
k9me2peaks_arms=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/k9me2peaks_in_chrarms.bed)

wt_w_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/WT*H2A.W*log2r.bw)
iswi_w_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/Iswi*H2A.W*log2r.bw)
w6_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/*H2A.W6*log2r.bw)
w7_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/*H2A.W7*log2r.bw)

module load deeptools/3.3.1-foss-2018b-python-3.6.6

echo "modlues have been loaded"
mkdir -p w6_w7_peak_arm_peri_plots
#cd /groups/berger/lab/Anna/ngs/uli1/Nextflow_ChIP-seq/results/uli1/main/w6peak_regions/

computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${k9me2peaks_peri}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_k9me2peaks_peri.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_k9me2peaks_peri.gz -out w6_w7_peak_arm_peri_plots/wt_k9me2peaks_peri.png --perGroup --yMin 0 --yMax 1.6

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${k9me2peaks_peri}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_peri.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_peri.gz -out w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_peri.png --perGroup --yMin 0 --yMax 1.6

 computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${k9me2peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_k9me2peaks_arms.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_k9me2peaks_arms.gz -out w6_w7_peak_arm_peri_plots/wt_k9me2peaks_arms.png --perGroup --yMin 0 --yMax 1.6

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${k9me2peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_arms.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_arms.gz -out w6_w7_peak_arm_peri_plots/iswi_k9me2peaks_arms.png --perGroup --yMin 0 --yMax 1.6

 
#######
computeMatrix reference-point  -S ${w6_bigwigs} -R  ${k9me2peaks_peri}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_k9me2peaks_peri.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_k9me2peaks_peri.gz -out w6_w7_peak_arm_peri_plots/w6_k9me2peaks_peri.png --perGroup --yMin 0 --yMax 1.6

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${k9me2peaks_peri}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_k9me2peaks_peri.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_k9me2peaks_peri.gz -out w6_w7_peak_arm_peri_plots/w7_k9me2peaks_peri.png --perGroup --yMin 0 --yMax 1.6

 computeMatrix reference-point  -S ${w6_bigwigs} -R  ${k9me2peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_k9me2peaks_arms.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_k9me2peaks_arms.gz -out w6_w7_peak_arm_peri_plots/w6_k9me2peaks_arms.png --perGroup --yMin 0 --yMax 1.6

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${k9me2peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_k9me2peaks_arms.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_k9me2peaks_arms.gz -out w6_w7_peak_arm_peri_plots/w7_k9me2peaks_arms.png --perGroup --yMin 0 --yMax 1.6

