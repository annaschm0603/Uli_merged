#!/usr/bin/env bash
# === begin CBE directives ===
#SBATCH --qos=medium
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mem=64gb
#SBATCH --array=1-9
#SBATCH --output=array_%A_%a.out
#SBATCH --error=array_%A_%a.err

###start from uli_merged folder
X=${SLURM_ARRAY_TASK_ID}
echo $X
mkdir -p plots_te_arm_peri
wt_name=`sed -n "$X p" samplenames.txt | awk '{print $1}'`
iswi_name=`sed -n "$X p" samplenames.txt | awk '{print $2}'`
Name=`sed -n "$X p" samplenames.txt | awk '{print $3}'`

#list_dir=/groups/berger/lab/Anna/ngs/cell_cycle_cur2/combined/${NAME}.bam
echo $Name
#4. sample name
module load deeptools/3.3.1-foss-2018b-python-3.6.6
computeMatrix scale-regions -S bam_to_bw/results/bigwigs/${wt_name}.log2r.bw bam_to_bw/results/bigwigs/${iswi_name}.log2r.bw -R /groups/berger/lab/Anna.Schmuecker/ngs/bedfiles_annotations_ect/TEs_peri.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --skipZeros -o plots_te_arm_peri/${Name}.tes_peri.gz
plotProfile -m plots_te_arm_peri/${Name}.tes_peri.gz -out plots_te_arm_peri/${Name}.tes_peri.png --perGroup
computeMatrix scale-regions -S bam_to_bw/results/bigwigs/${wt_name}.log2r.bw bam_to_bw/results/bigwigs/${iswi_name}.log2r.bw -R /groups/berger/lab/Anna.Schmuecker/ngs/bedfiles_annotations_ect/TEs_arm.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --skipZeros -o plots_te_arm_peri/${Name}.tes_arm.gz
plotProfile -m plots_te_arm_peri/${Name}.tes_arm.gz -out plots_te_arm_peri/${Name}.tes_arm.png --perGroup

###same but with TEGs
computeMatrix scale-regions -S bam_to_bw/results/bigwigs/${wt_name}.log2r.bw bam_to_bw/results/bigwigs/${iswi_name}.log2r.bw -R /groups/berger/lab/Anna.Schmuecker/ngs/bedfiles_annotations_ect/TE_genes_peri.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --skipZeros -o plots_te_arm_peri/${Name}.te_genes_peri.gz
plotProfile -m plots_te_arm_peri/${Name}.te_genes_peri.gz -out plots_te_arm_peri/${Name}.te_genes_peri.png --perGroup
computeMatrix scale-regions -S bam_to_bw/results/bigwigs/${wt_name}.log2r.bw bam_to_bw/results/bigwigs/${iswi_name}.log2r.bw -R /groups/berger/lab/Anna.Schmuecker/ngs/bedfiles_annotations_ect/TE_genes_arm.bed --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --skipZeros -o plots_te_arm_peri/${Name}.te_genes_arm.gz
plotProfile -m plots_te_arm_peri/${Name}.te_genes_arm.gz -out plots_te_arm_peri/${Name}.te_genes_arm.png --perGroup
