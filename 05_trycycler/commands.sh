### Activate Conda environment
#conda activate trycycler_env
conda list -n phame_env > trycycler_env_packages.txt


### Cluster the contigs
for strain in NCPPB_2005 NCPPB_2251 NCPPB_4379 NCPPB_4381 NCPPB_4395; do
    echo $strain
    trycycler cluster --assemblies ../04_long-read_assemblies/$strain.assemblies/*.fasta --reads ../03_ont_trimmed/$strain.ont.filtlong.fastq.gz  --out_dir $strain.trycycler
done

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
trycycler dotplot --cluster_dir NCPPB_4381.trycycler/cluster_002
trycycler dotplot --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler dotplot --cluster_dir NCPPB_4395.trycycler/cluster_002

### Reconcile the contigs
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_2005.ont.filtlong.fastq.gz --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz --cluster_dir NCPPB_2251.trycycler/cluster_002
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4379.nt.filtlong.fastq.gz --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler reconcile --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz --cluster_dir NCPPB_4395.trycycler/cluster_002

### Multiple sequence alignment
trycycler  msa --cluster_dir NCPPB_2005.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_2251.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_2251.trycycler/cluster_002
trycycler  msa --cluster_dir NCPPB_4379.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4379.trycycler/cluster_007
trycycler  msa --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4381.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4395.trycycler/cluster_001
trycycler  msa --cluster_dir NCPPB_4395.trycycler/cluster_002




