### Activateconda environment
#conda activate trycycler_env
#conda list -n phame_env > trycycler_env_packages.txt

### Generate subsamples of ONT reads
#trycycler subsample --reads ../03_ont_trimmed/NCPPB_2005.ont.filtlong.fastq.gz  --out_dir NCPPB_2005.read_subsets --genome_size 4.9m --count 12
#trycycler subsample --reads ../03_ont_trimmed/NCPPB_2251.ont.filtlong.fastq.gz  --out_dir NCPPB_2251.read_subsets --genome_size 4.9m --count 12
#trycycler subsample --reads ../03_ont_trimmed/NCPPB_4379.ont.filtlong.fastq.gz  --out_dir NCPPB_4379.read_subsets --genome_size 4.9m --count 12
#trycycler subsample --reads ../03_ont_trimmed/NCPPB_4381.ont.filtlong.fastq.gz  --out_dir NCPPB_4381.read_subsets --genome_size 4.9m --count 12
#trycycler subsample --reads ../03_ont_trimmed/NCPPB_4395.ont.filtlong.fastq.gz  --out_dir NCPPB_4395.read_subsets --genome_size 4.9m --count 12



### Generate assemblies for NCPPB 2005
mkdir NCPPB_2005.assemblies

### Flye assembly

#for i in 01 04 07 10; do 
#    flye --nano-hq NCPPB_2005.read_subsets/sample_$i.fastq --threads 8 --out-dir assembly_$i
#    cp assembly_$i/assembly.fasta NCPPB_2005.assemblies/assembly_$i.fasta
#    cp assembly_$i/assembly_graph.gfa NCPPB_2005.assemblies/assembly_$i.gfa
#    rm -r assembly_$i
#done

### Miniasm assembly
for i in 02 05 08 11; do
    ./miniasm_and_minipolish.sh NCPPB_2005.read_subsets/sample_$i.fastq 8 > NCPPB_2005.assemblies/assembly_$i.gfa
    any2fasta NCPPB_2005.assemblies/assembly_$i.gfa > NCPPB_2005.assemblies/assembly_$i.fasta
done

### Raven assembly
for i in 03 06 09 12; do
    raven --threads 8 --disable-checkpoints --graphical-fragment-assembly assemblies/assembly_03.gfa NCPPB_2005.read_subsets/sample_03.fastq > NCPPB_2005.assemblies/assembly_03.fasta
done

