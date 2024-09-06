suppressPackageStartupMessages(library(plyr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))

bc<-commandArgs()[7]
covr<-as.numeric(commandArgs()[8])
lowc<-as.numeric(commandArgs()[9])
cont<-unlist(strsplit(commandArgs()[10],","))

tig<-read.table(file.path("canu_assembly",paste0(bc,".contigs.layout.readToTig")), h=T, comment.char="@") %>%
  filter(tigID %in% cont)

# coverage by position
tigcov<-ddply(tig,.(tigID),function(y) {
	apply(y,1,function(x) {
		seq(x["bgn"],x["end"])
	}) %>%
	  unlist() %>%
	  table() %>%
	  data.frame() %>%
	  setNames(c("position","coverage"))
}) %>%
  mutate(position=as.numeric(as.character(position))+1)
write.table(tigcov,paste0(bc,".coverage.tsv"), row.names=F, sep="\t", quote=F)

# plot coverage by contig
plot_cov<-ggplot(tigcov,aes(position,coverage)) +
  geom_line(aes(color=as.character(tigID)))+
  labs(color="contig") +
  ggtitle(bc) +
  theme_bw() +
  theme(plot.title=element_text(size=11))
ggsave(paste0(bc,".coverage.png"),plot_cov,width=6,height=3)

# longest consecutive stretch with $COV and $LOWC coverage
tigcovN<-rbind(filter(tigcov,coverage>=lowc) %>%
        ddply(.(tigID), function(x) R.utils::seqToIntervals(x$position)) %>% 
        mutate(coverage=paste0("N",lowc)),
      filter(tigcov,coverage>=covr) %>%
        ddply(.(tigID), function(x) R.utils::seqToIntervals(x$position)) %>% 
        mutate(coverage=paste0("N",covr)))

# report if contig(s) and remove contig smaller than 200 nt and with longest stretch 10 times smaller than the longest
if (nrow(tigcovN)>0) {
  mutate(tigcovN, length=to-from) %>%
    group_by(coverage) %>%
    filter(length>=200,length>=max(length)/10) %>%
    write.table(paste0(bc,".Ncov.tsv"), row.names=F, sep="\t", quote=F)
}

