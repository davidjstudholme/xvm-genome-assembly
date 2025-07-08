### Activate Conda environment
#conda activate trycycler_env
conda list -n phame_env > trycycler_env_packages.txt


### Cluster the contigs
trycycler cluster --assemblies ../04_long-read_assemblies/NCPPB_2005.assemblies/*.fasta --reads ../03_ont_trimmed/NCPPB_2005.ont.filtlong.fastq.gz --out_dir NCPPB_2005.trycycler
trycycler cluster --assemblies ../04_long-read_assemblies/NCPPB_2251.assemblies/*.fasta --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz --out_dir NCPPB_2251.trycycler
trycycler cluster --assemblies ../04_long-read_assemblies/NCPPB_4379.assemblies/*.fasta --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --out_dir NCPPB_4379.trycycler
trycycler cluster --assemblies ../04_long-read_assemblies/NCPPB_4381.assemblies/*.fasta --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz --out_dir NCPPB_4381.trycycler
trycycler cluster --assemblies ../04_long-read_assemblies/NCPPB_4395.assemblies/*.fasta --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --out_dir NCPPB_4395.trycycler

### Generate dotplots
trycycler dotplot --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_2251.trycycler/cluster_002
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_002
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_003
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_004
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_005
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_006
trycycler dotplot --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler dotplot --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_4395.trycycler/cluster_002

### Remove problematic clusters
rm -fr NCPPB_2251.trycycler/cluster_002
rm -fr NCPPB_4379.trycycler/cluster_002
rm -fr NCPPB_4379.trycycler/cluster_003
rm -fr NCPPB_4379.trycycler/cluster_004
rm -fr NCPPB_4379.trycycler/cluster_005
rm -fr NCPPB_4379.trycycler/cluster_006
rm -fr NCPPB_4381.trycycler/cluster_002

### Remove problematic contigs
rm NCPPB_2251.trycycler/cluster_001/1_contigs/H_contig_1.fasta
rm NCPPB_2251.trycycler/cluster_001/1_contigs/I_contig_1.fasta
rm NCPPB_2251.trycycler/cluster_001/1_contigs/G_utg000001l.fasta
rm NCPPB_2251.trycycler/cluster_001/1_contigs/C_Utg1400.fasta
rm NCPPB_2251.trycycler/cluster_001/1_contigs/E_utg000001c.fasta
rm NCPPB_4379.trycycler/cluster_001/1_contigs/F_contig_1.fasta
rm NCPPB_4379.trycycler/cluster_007/1_contigs/E_utg000002l.fasta
rm NCPPB_4381.trycycler/cluster_001/1_contigs/D_contig_1.fasta
rm NCPPB_4381.trycycler/cluster_001/1_contigs/E_utg000001l.fasta 

### Reconcile the contigs
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_2005.ont.filtlong.fastq.gz --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_002

### Multiple sequence alignment
trycycler  msa --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler  msa --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4395.trycycler/cluster_002

### Partition reads
trycycler partition --reads ../03_ont_trimmed/NCPPB_2005.ont.filtlong.fastq.gz --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler partition --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler partition --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler partition --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler partition --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler partition --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler partition --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_002



### Generate a consensus
trycycler  consensus --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler  consensus --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler  consensus --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler  consensus --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler  consensus --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler  consensus --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler  consensus --cluster_dir NCPPB_4395.trycycler/cluster_002



