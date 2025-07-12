### Activate Conda environment
#conda activate trycycler_env
conda list -n phame_env > trycycler_env_packages.txt
conda env export > trycycler_env.yaml

### Make symbolic links to consensus contigs
ln -s ../05_trycycler/NCPPB_2005.trycycler/cluster_001/7_final_consensus.fasta NCPPB_2005_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_2251.trycycler/cluster_001/7_final_consensus.fasta NCPPB_2251_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4379.trycycler/cluster_001/7_final_consensus.fasta NCPPB_4379_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4379.trycycler/cluster_007/7_final_consensus.fasta NCPPB_4379_007.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4381.trycycler/cluster_001/7_final_consensus.fasta NCPPB_4381_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4395.trycycler/cluster_001/7_final_consensus.fasta NCPPB_4395_001.final_consensus.fasta
ln -s ../05_trycycler/NCPPB_4395.trycycler/cluster_002/7_final_consensus.fasta NCPPB_4395_002.final_consensus.fasta

### Polypolish with short reads

bwa index NCPPB_2005_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_2005_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2005.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_2005_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2005.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_2005_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_2005_001.polypolish.fasta

bwa index NCPPB_2251_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_2251_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2251.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_2251_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_2251.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_2251_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_2251_001.polypolish.fasta

bwa index NCPPB_4379_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_4379_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4379.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_4379_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4379.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_4379_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_4379_001.polypolish.fasta

bwa index NCPPB_4379_007.final_consensus.fasta
bwa mem -t 16 -a NCPPB_4379_007.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4379.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_4379_007.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4379.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_4379_007.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_4379_007.polypolish.fasta

bwa index NCPPB_4381_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_4381_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4381.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_4381_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4381.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_4381_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_4381_001.polypolish.fasta

bwa index NCPPB_4395_001.final_consensus.fasta
bwa mem -t 16 -a NCPPB_4395_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4395.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_4395_001.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4395.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_4395_001.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_4395_001.polypolish.fasta

bwa index NCPPB_4395_002.final_consensus.fasta
bwa mem -t 16 -a NCPPB_4395_002.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4395.illumina.1_val_1.fq.gz > alignments_1.sam
bwa mem -t 16 -a NCPPB_4395_002.final_consensus.fasta ../02_illumina_trimmed/NCPPB_4395.illumina.2_val_2.fq.gz > alignments_2.sam
polypolish filter --in1 alignments_1.sam --in2 alignments_2.sam --out1 filtered_1.sam --out2 filtered_2.sam
polypolish polish NCPPB_4395_002.final_consensus.fasta filtered_1.sam filtered_2.sam > NCPPB_4395_002.polypolish.fasta

### Short-read polishing with pypolca
pypolca run --force --careful -a NCPPB_2005_001.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_2005.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_2005.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_2005_001.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_2251_001.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_2251.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_2251.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_2251_001.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_4379_001.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_4379.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_4379.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_4379_001.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_4379_007.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_4379.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_4379.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_4379_007.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_4381_001.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_4381.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_4381.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_4381_001.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_4395_001.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_4395.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_4395.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_4395_001.polypolish.pypolca.fasta

pypolca run --force --careful -a NCPPB_4395_002.polypolish.fasta -1 ../02_illumina_trimmed/NCPPB_4395.illumina.1_val_1.fq.gz  -2 ../02_illumina_trimmed/NCPPB_4395.illumina.2_val_2.fq.gz  -t 16 -o pypolca
cp pypolca/pypolca_corrected.fasta NCPPB_4395_002.polypolish.pypolca.fasta

### Remove the temporary output directory
rm -fr pypolca/





