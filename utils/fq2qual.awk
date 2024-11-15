# need to setup variable a for ASCII offset (generaly 33 or 64)
BEGIN{
	for(n=0;n<256;n++) {
		ord[sprintf("%c",n)]=n
	}
}
{
	if((NR-1) % 4 == 3){
		l=split($0,c,"")
		printf "%s", ord[c[1]]-a
		for(i=2;i<=l;i++){
			printf " %s", ord[c[i]]-a
		}
		printf "\n"
	} else {
		print
	}
}
