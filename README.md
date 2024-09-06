# barcode toolkit
 **Tools to automate processing of barcode sequences, design and test barcoding primers**

## Installation

This toolkit is for unix based system only (e.g. Linux, MAC or [WSL](https://learn.microsoft.com/en-gb/windows/wsl/install))

In the terminal, type the following command in the desired installation directory:
```
git clone https://github.com/lentendu/barcode_toolkit.git
``

You can add the bin directory into your PATH variable to access the executables from everywere on your system, using, for example, the following line:
```
echo "PATH=\$PATH:$PWD/barcode_toolkit/bin" >> ~/.bashrc
```

## Dependencies

+ [BLAST+ v2.10+](https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html) (Camacho et al., 2009)
+ [barrnap](https://github.com/tseemann/barrnap) (Seemann, 2024) for nanobass
+ [biom-format](http://biom-format.org) (McDonald et al., 2012) for probe_sra_marker
+ [canu](https://github.com/marbl/canu) (Koren et al., 2017) for nanobass
+ [cutadapt v3+](https://cutadapt.readthedocs.io/en/stable) (Martin, 2011)
+ [Entrez Direct (EDirect)](https://www.ncbi.nlm.nih.gov/books/NBK179288/) (Kans, 2023)
+ [GNU parallel](https://www.gnu.org/software/parallel)
+ [goalign v0.3.4+](https://github.com/evolbioinfo/goalign) (Lemoine & Gascuel, 2021)
+ [IBM Aspera Connect](https://downloads.asperasoft.com/connect2/) for probe_sra_marker
+ [HMMER v3+](http://hmmer.org/) (Eddy, 2011)
+ [mafft v7.487+](https://mafft.cbrc.jp) (Katoh & Standley, 2013)
+ [NGmerge v0.3+](https://github.com/jsh58/NGmerge) (Gaspar, 2018)
+ [PANDAseq v2.10+](https://github.com/neufeld/pandaseq) (Masella et al., 2012) for probe_sra_marker
+ [pv](https://www.tecmint.com/monitor-copy-backup-tar-progress-in-linux-using-pv-command/)
+ [RATTLE](https://github.com/comprna/RATTLE) (de la Rubia et al., 2022) for nanobass
+ [SeqKit v0.15.0+](https://github.com/shenwei356/seqkit) (Shen et al., 2016)
+ [sickle v1.33](https://github.com/najoshi/sickle) (Joshi & Fass, 2011)
+ [swarm v2+](https://github.com/torognes/swarm) (Mahé et al., 2015)
+ [taxonkit v0.11.0+](https://github.com/shenwei356/taxonkit) (Shen & Ren, 2021)
+ [tracy v0.7+](https://github.com/gear-genomics/tracy) (Rausch et al.,2020)
+ [vsearch v2+](https://github.com/torognes/vsearch) (Rognes et al., 2016) for probe_sra_marker


## Usage

**apolla** is a tool to search for a probe specific to a target clade.

**consensus_blast** is a tool for automatic BLAST of multiple sequences and creating a consensus taxonomy from a range of best matches.

**nanobass** is a tool to assemble barcoding Nanopore sequences.

**primcheck** is a tool to perform in-silico PCR and evaluate primer pairs performance to amplify a target clade.

**primdesign** is a tool to automatically design primer pairs for target clade PCR amplification.

**probe_sra_marker** is a tool to extract reads matching a probe from short reads archive marker gene run files.

**sanger_cleaner** is a tool for basecalling and quality trimming of Sanger sequences using tracy, sickle, cutadapt, mafft and goalign.

Any of these tools can be call with the -h option to see full options and usage.


## References

+ Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., & Madden, T. L. (2009). BLAST+: Architecture and applications. BMC Bioinformatics, 10, 421. [10.1186/1471-2105-10-421](https://doi.org/10.1186/1471-2105-10-421)
+ Eddy, S. R. (2011). Accelerated Profile HMM Searches. PLOS Computational Biology, 7(10), e1002195. [10.1371/journal.pcbi.1002195](https://doi.org/10.1371/journal.pcbi.1002195)
+ Gaspar, J. M. (2018). NGmerge: Merging paired-end reads via novel empirically-derived models of sequencing errors. BMC Bioinformatics, 19(1), 536. doi:[10.1186/s12859-018-2579-2](https://doi.org/10.1186/s12859-018-2579-2)
+ Joshi NA, Fass JN. (2011). Sickle: A sliding-window, adaptive, quality-based trimming tool for FastQ files (Version 1.33) [Software]
+ Kans, J. (2023). Entrez Direct: E-utilities on the Unix Command Line. In Entrez Programming Utilities Help [Internet]. National Center for Biotechnology Information (US). https://www.ncbi.nlm.nih.gov/books/NBK179288/
+ Katoh, K., & Standley, D. M. (2013). MAFFT multiple sequence alignment software version 7: Improvements in performance and usability. Molecular Biology and Evolution, 30(4), 772–780. doi:[10.1093/molbev/mst010](https://doi.org/10.1093/molbev/mst010)
+ Koren, S., Walenz, B. P., Berlin, K., Miller, J. R., Bergman, N. H., & Phillippy, A. M. (2017). Canu: Scalable and accurate long-read assembly via adaptive k-mer weighting and repeat separation. Genome Research, 27(5), 722–736. [10.1101/gr.215087.116](https://doi.org/10.1101/gr.215087.116)
+ Lemoine, F., & Gascuel, O. (2021). Gotree/Goalign: Toolkit and Go API to facilitate the development of phylogenetic workflows. NAR Genomics and Bioinformatics, 3(3), doi:[10.1093/nargab/lqab075](https://doi.org/10.1093/nargab/lqab075)
+ Mahé, F., Rognes, T., Quince, C., de Vargas, C., Dunthorn, M., 2015. Swarm v2: highly-scalable and high-resolution amplicon clustering. PeerJ 3, e1420. doi:[10.7717/peerj.1420](http://doi.org/10.7717/peerj.1420)
+ Martin, M. (2011). Cutadapt removes adapter sequences from high-throughput sequencing reads. EMBnet.Journal, 17(1), 10–12. doi:[10.14806/ej.17.1.200](https://doi.org/10.14806/ej.17.1.200)
+ Masella, A.P., Bartram, A.K., Truszkowski, J.M., Brown, D.G., Neufeld, J.D., 2012. PANDAseq: paired-end assembler for illumina sequences. BMC Bioinformatics 13, 31. doi:[10.1186/1471-2105-13-31](http://doi.org/10.1186/1471-2105-13-31)
+ McDonald, D., Clemente, J.C., Kuczynski, J., Rideout, J.R., Stombaugh, J., Wendel, D., Wilke, A., Huse, S., Hufnagle, J., Meyer, F., Knight, R., Caporaso, J.G., 2012. The Biological Observation Matrix (BIOM) format or: how I learned to stop worrying and love the ome-ome. GigaScience 1. doi:[10.1186/2047-217X-1-7](http://doi.org/10.1186/2047-217X-1-7)
+ Rausch, T., Fritz, M. H.-Y., Untergasser, A., & Benes, V. (2020). Tracy: Basecalling, alignment, assembly and deconvolution of sanger chromatogram trace files. BMC Genomics, 21(1), 230. doi:[10.1186/s12864-020-6635-8](https://doi.org/10.1186/s12864-020-6635-8)
+ Rognes, T., Flouri, T., Nichols, B., Quince, C., Mahé, F., 2016. VSEARCH: a versatile open source tool for metagenomics. PeerJ. doi:[10.7717/peerj.2584](http://doi.org/10.7717/peerj.2584)
+ de la Rubia, I., Srivastava, A., Xue, W., Indi, J. A., Carbonell-Sala, S., Lagarde, J., Albà, M. M., & Eyras, E. (2022). RATTLE: Reference-free reconstruction and quantification of transcriptomes from Nanopore sequencing. Genome Biology, 23(1), 153. [10.1186/s13059-022-02715-w](https://doi.org/10.1186/s13059-022-02715-w)
+ Seemann, T. (2024). BAsic Rapid Ribosomal RNA Predictor [Perl] [barrnap](https://github.com/tseemann/barrnap) (Original work published 2013)
+ Shen, W., Le, S., Li, Y., & Hu, F. (2016). SeqKit: A Cross-Platform and Ultrafast Toolkit for FASTA/Q File Manipulation. PLOS ONE, 11(10), e0163962. doi:[10.1371/journal.pone.0163962](https://doi.org/10.1371/journal.pone.0163962)
+ Shen, W., & Ren, H. (2021). TaxonKit: A practical and efficient NCBI taxonomy toolkit. Journal of Genetics and Genomics, 48(9), 844–850. doi:[10.1016/j.jgg.2021.03.006](https://doi.org/10.1016/j.jgg.2021.03.006)
