#!/bin/bash

grep -v "^>" $1 |\
 sed 's/\(.\)/\1 /g' |\
 awk 'BEGIN{nt[1]="A";nt[2]="T";nt[3]="C";nt[4]="G";nt[5]="N"} {l=NF;for(i=1;i<=NF;i++){a[i,$i]+=1}}  END {print "pos A T C G N"; for(i=1;i<=l;i++){printf "%s",i;for(j=1;j<=5;j++){(a[i,nt[j]]=="")?r=0:r=a[i,nt[j]]; printf " %s", r}; printf "\n"}}' |\
 awk '{if(NR==1){print $0,"entropy"} else {H=0;s=$2+$3+$4+$5+$6; for(i=2;i<=5;i++){t=$i+$6/4;if(t>0){H+=(($i+$6/4)/s)*(log(($i+$6/4)/s)/log(2))}}; (H<0)?h=-H:h=H; print $0,h; tot+=h}}	END {print "mean _ _ _ _ _",tot/(FNR-1)}'
