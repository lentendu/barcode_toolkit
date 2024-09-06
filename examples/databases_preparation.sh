
# align PR2 against silva Eukaryota sequences
cd /server/lentendug/databases/silva
awk 'BEGIN{FS="\t"}$2~"^Eukaryota;"{print $0}' silva_138.1_SSURef_NR99.taxonomy > Eukaryota.silva_138.1_SSURef_NR99.taxonomy

seqkit grep -w 0 -f <(cut -f 1 Eukaryota.silva_138.1_SSURef_NR99.taxonomy) silva_138.1_SSURef_NR99.align.fasta > Eukaryota.silva_138.1_SSURef_NR99.align.fasta
mothur "#filter.seqs(fasta=Eukaryota.silva_138.1_SSURef_NR99.align.fasta)"
cd ../pr2
mothur "#set.dir(tempdefault=/server/lentendug/databases/silva);
align.seqs(candidate=pr2_version_4.12.0_mothur.fasta, template=Eukaryota.silva_138.1_SSURef_NR99.align.filter.fasta);
filter.seqs(fasta=pr2_version_4.12.0_mothur.align)"
mv pr2_version_4.12.0_mothur.filter.fasta pr2_version_4.12.0_mothur.align.fasta
rm pr2_version_4.12.0_mothur.align

# use ITSx to select sequences with flanking regions
ITSx -i tmp.fasta -o UNITEv8_sh_dynamic_all --cpu 12 -N 1 --save_regions all --complement F
