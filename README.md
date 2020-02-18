# Purpose

Tool for generating coverage boxplots for different GC% windows.

# Dependencies
`snakemake/5.4.3-ve`

`R v3.4.1`

`bedtools 2.27.1`

`mosdepth/0.2.5`

# Usage

## Login to compute node with 8 cores
`qrsh -q default -pe smp 8`


## Load Dependencies
`module load snakemake/5.4.3-ve`


## Edit configs

Copy config.json and cluster.config.sge.json to the folder you want to run in and edit.


## Run It Locally
`snakemake -s Snakefile --configfile config.json`


## Run it on cluster
snakemake -j 10 --cluster-config /path/to/cluster.config.sge.json \
--configfile /path/to/config.json \
--cluster "qsub -S {cluster.S} -N {cluster.N} {cluster.P} -q {cluster.Q} {cluster.CPU} -e {cluster.E} -o {cluster.O} -V" \
-s /path/to/Snakefile --verbose -p -d $PWD


# Input

1. Reference sequence in fasta format
2. FAI index for reference
3. index sorted BAM or reads mapped to reference


# Output

`output` directory contains `PDF` of boxplots of coverage and data file.
