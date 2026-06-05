# GEO dataset: 
# Brief description:
# Working directory is /Users/bishtananya/Desktop/Bioinformatics
cd /Users/bishtananya/Desktop/Bioinformatics


# Downloading the SRA files using the prefetch tool from the SRA toolkit
sratoolkit/bin/prefetch SRR28816868 SRR28816867 SRR28816869 SRR28816870 SRR28816871 SRR28816872 SRR28816873 SRR28816874



# Extracting the data from the SRA files using the fasterq-dump tool from the SRA toolkit
for id in SRR28816868 SRR28816867 SRR28816869 SRR28816870 SRR28816871 SRR28816872 SRR28816873 SRR28816874; do
    echo "Extracting data for: $id"
    sratoolkit/bin/fasterq-dump --split-3 $id
done



# Quantifying the expression levels using Kallisto
for id in SRR28816868 SRR28816867 SRR28816869 SRR28816870 SRR28816871 SRR28816872 SRR28816873 SRR28816874; do
    echo "Quantifying sample: $id"
    kallisto quant -i human_transcriptome.idx \
                   -o result_$id \
                   -b 100 \
                   ${id}_1.fastq ${id}_2.fastq
done

# results will be stored in result_SRR28816868, result_SRR28816867, ..., result_SRR28816874 directories respectively
# 