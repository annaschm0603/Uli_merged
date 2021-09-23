#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=short
#SBATCH --cpus-per-task=1
#SBATCH --time=04:00:00


w6_peaks_pericentromere=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/W6peaks_in_pericentromere.bed)#
w6_peaks_arms=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/W6peaks_in_chrarms.bed)
w7_peaks_pericentromere=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/W7peaks_in_pericentromere.bed)#
w7_peaks_arms=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/macs2/W7peaks_in_chrarms.bed)

wt_w_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/WT*H2A.W*log2r.bw)
iswi_w_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/Iswi*H2A.W*log2r.bw)
w6_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/*H2A.W6*log2r.bw)
w7_bigwigs=$(ls -p /groups/berger/lab/Anna.Schmuecker/ngs/uli_merged/bam_to_bw/results/bigwigs/*H2A.W7*log2r.bw)

module load deeptools/3.3.1-foss-2018b-python-3.6.6

echo "modlues have been loaded"
mkdir -p w6_w7_peak_arm_peri_plots
#cd /groups/berger/lab/Anna/ngs/uli1/Nextflow_ChIP-seq/results/uli1/main/w6peak_regions/

computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${w6_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_w6_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_w6_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/wt_w6_pericentromerepeaks.png --perGroup

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${w6_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_w6_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_w6_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/iswi_w6_pericentromerepeaks.png --perGroup

 computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${w6_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_w6_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_w6_armpeaks.gz -out w6_w7_peak_arm_peri_plots/wt_w6_armpeaks.png --perGroup

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${w6_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_w6_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_w6_armpeaks.gz -out w6_w7_peak_arm_peri_plots/iswi_w6_armpeaks.png --perGroup

 #####

computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${w7_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_w7_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_w7_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/wt_w7_pericentromerepeaks.png --perGroup

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${w7_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_w7_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_w7_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/iswi_w7_pericentromerepeaks.png --perGroup

 computeMatrix reference-point  -S ${wt_w_bigwigs} -R  ${w7_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/wt_w7_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/wt_w7_armpeaks.gz -out w6_w7_peak_arm_peri_plots/wt_w7_armpeaks.png --perGroup

computeMatrix reference-point  -S ${iswi_w_bigwigs} -R  ${w7_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/iswi_w7_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/iswi_w7_armpeaks.gz -out w6_w7_peak_arm_peri_plots/iswi_w7_armpeaks.png --perGroup

#######
computeMatrix reference-point  -S ${w6_bigwigs} -R  ${w6_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_w6_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_w6_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/w6_w6_pericentromerepeaks.png --perGroup

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${w6_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_w6_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_w6_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/w7_w6_pericentromerepeaks.png --perGroup

 computeMatrix reference-point  -S ${w6_bigwigs} -R  ${w6_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_w6_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_w6_armpeaks.gz -out w6_w7_peak_arm_peri_plots/w6_w6_armpeaks.png --perGroup

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${w6_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_w6_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_w6_armpeaks.gz -out w6_w7_peak_arm_peri_plots/w7_w6_armpeaks.png --perGroup

 #####

computeMatrix reference-point  -S ${w6_bigwigs} -R  ${w7_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_w7_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_w7_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/w6_w7_pericentromerepeaks.png --perGroup

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${w7_peaks_pericentromere}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_w7_pericentromerepeaks.gz 
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_w7_pericentromerepeaks.gz -out w6_w7_peak_arm_peri_plots/w7_w7_pericentromerepeaks.png --perGroup

 computeMatrix reference-point  -S ${w6_bigwigs} -R  ${w7_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w6_w7_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w6_w7_armpeaks.gz -out w6_w7_peak_arm_peri_plots/w6_w7_armpeaks.png --perGroup

computeMatrix reference-point  -S ${w7_bigwigs} -R  ${w7_peaks_arms}  --referencePoint center --beforeRegionStartLength 3000 --afterRegionStartLength 3000  --skipZeros -o w6_w7_peak_arm_peri_plots/w7_w7_armpeaks.gz
 plotProfile -m w6_w7_peak_arm_peri_plots/w7_w7_armpeaks.gz -out w6_w7_peak_arm_peri_plots/w7_w7_armpeaks.png --perGroup

