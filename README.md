# RNA-Seq Transcript Quantification Pipeline ( Still working on it )

## Project Overview

This project implements a comprehensive RNA-Seq analysis pipeline for quantifying transcript expression levels from whole transcriptome sequencing data. 

The pipeline processes raw sequencing reads, converts them to a standardized format, and quantifies gene expression using pseudoalignment techniques. 

The results are used for downstream differential expression analysis in RStudio.

## Dataset

**Source:** NCBI GEO Datasets  
**GEO Dataset Accession:** GSE265952

This dataset contains paired-end RNA-Seq reads from 8 samples (SRR28816867-SRR28816874) sequenced on an Illumina platform. The data is used to study transcriptome-wide expression patterns.

Link to dataset: 

## Pipeline Steps

### 1. **Download SRA Files**
   - Download raw sequencing data from NCBI SRA (Sequence Read Archive)
   - Tool: `prefetch` (SRA toolkit)
   - Input: SRA accession numbers (SRR28816867-SRR28816874)
   - Output: `.sra` files stored in individual directories

### 2. **Extract and Convert to FASTQ**
   - Convert SRA files to FASTQ format
   - Tool: `fasterq-dump` (SRA toolkit)
   - Option: `--split-3` for paired-end read splitting
   - Output: `{sample}_1.fastq` and `{sample}_2.fastq` files (R1 and R2 reads)

### 3. **Transcript Quantification**
   - Quantify transcript abundance using pseudoalignment
   - Tool: `kallisto quant`
   - Reference: Human transcriptome index (`human_transcriptome.idx`)
   - Parameters: 100 bootstrap samples for uncertainty estimation
   - Output: Quantification results in `result_{sample}/` directories containing:
     - `abundance.tsv`: Transcript abundance estimates
     - `abundance.h5`: HDF5 format abundance data
     - `run_info.json`: Run metadata and statistics

### 4. **Differential Expression Analysis**
   - Conduct statistical analysis of differential gene expression
   - Tool: DESeq2 (R/RStudio)
   - Input: Quantification results from Step 3
   - Analysis: Compare transcript abundance across samples to identify differentially expressed genes
   - Output: Statistical results, p-values, and log2 fold changes for downstream interpretation

