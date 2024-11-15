# need to setup variable a for ASCII offset (generaly 33 or 64), t for minimum quality threshold and variable w for window size
# bridging allowed: two stretches of bases above quality treshold separated by less than one window size are kept together (see "i-(w-1) <= e[r]" )
BEGIN{
	for(n=0;n<256;n++) {
		ord[sprintf("%c",n)]=n
	}
}
{
	if((NR-1) % 4 == 0){id=$0}
	if((NR-1) % 4 == 1){
		split($0,x,"")
	}
	if((NR-1) % 4 == 2){sep=$0}
	if((NR-1) % 4 == 3){
		l=split($0,c,"")
		for(i=1;i<=l;i++){
			k[i]=ord[c[i]]-a
		}
		r=1
		s[r]=1
		e[r]=(w-1)
		for(i=w;i<=l;i++){
			n=0
			for(j=i-(w-1);j<=i;j++){
				n+=k[j]
			}
			if(n/w >= t){
				if( e[r] == i-1 || i-(w-1) <= e[r] ){
					e[r]=i
				} else {
					r+=1
					s[r]=i-(w-1)
					e[r]=i
				}
			}
		}
		L=0
		for(i=1;i<=r;i++){
			l=e[i]-s[i]
			#print i,s[i],e[i],l
			if(l>L){
				L=l
				S=s[i]
				E=e[i]
			}
		}
		if(e[r] > (w-1)) {
			seq=""
			qual=""
			for(i=S;i<=E;i++){
				seq=seq""x[i]
				qual=qual""c[i]
			}
			printf "%s\n%s\n%s\n%s\n", id,seq,sep,qual
		}
	}
}
