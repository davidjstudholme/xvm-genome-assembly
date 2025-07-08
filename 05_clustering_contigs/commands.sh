### Activateconda environment
#conda activate trycycler_env
conda list -n phame_env > trycycler_env_packages.txt


for strain in NCPPB_2005 NCPPB_2251 NCPPB_4379 NCPPB_4381 NCPPB_4395; do
    echo $strain
    
    trycycler cluster --assemblies ../04_long-read_assemblies/$strain.assemblies/*.fasta --reads ../03_ont_trimmed/$strain.ont.filtlong.fastq.gz  --out_dir $strain.trycycler

done


 
