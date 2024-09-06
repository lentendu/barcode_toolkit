BEGIN{
	FS="\t"
}
{
	if($1 in tax == 0) {
		tax[$1]=""
		tn+=1
		taxo[tn]=$1
	}
	if($2 in ran == 0) {
		ran[$2]=""
		rn+=1
		rank[rn]=$2
	}
	count[$2,$1]=$3
} END {
	printf "%s",R
	for(j=1;j<=rn;j++) {
		printf "\t%s",rank[j]
	}
	printf "\n"
	for(i=1;i<=tn;i++) {
		printf "%s",taxo[i]
		for(j=1;j<=rn;j++) {
			printf "\t%s",count[rank[j],taxo[i]]
		}
		printf "\n"
	}
}
