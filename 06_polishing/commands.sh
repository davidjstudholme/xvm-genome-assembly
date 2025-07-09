### Activate Conda environment
#conda activate trycycler_env
conda list -n phame_env > trycycler_env_packages.txt

### Make symbolic links to consensus contigs
ln -s ../05_trycycler/NCPPB_2005.trycycler/cluster_001/7_final_consensus.fasta NCPPB_2005_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4379.trycycler/cluster_007/7_final_consensus.fasta NCPPB_4379_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4379.trycycler/cluster_007/7_final_consensus.fasta NCPPB_4379_007.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4381.trycycler/cluster_001/7_final_consensus.fasta NCPPB_4381_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4395.trycycler/cluster_001/7_final_consensus.fasta NCPPB_4395_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4395.trycycler/cluster_002/7_final_consensus.fasta NCPPB_4395_002_.final_consensus.fasta

### Polypolish with short reads

bwa index NCPPB_2005_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_2005_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2005.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_2005_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2005.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_2005_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_2005_001.polypolish.fasta



