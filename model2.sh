#!/bin/bash

#number of total samples in the data set (*2 for diploid species)
Nsampl=`echo $(( 140 * 2 ))` ## total sample size

PopCent=`echo $(( 10 * 2 ))`  # Central subpopulations sample size (each one)
PCentr0=0                     # Ghost populations
PopNorth=`echo $(( 10 * 2 ))` # North subpopulations sample size (each one)
PopCoast=`echo $(( 10 * 2 ))` # Coast subpopulations sample size (each one)
PopSouth=`echo $(( 10 * 2 ))` # South subpopulations sample size (each one)

#while loop iterates draws from the prior
while read p; do
	Theta=`echo $p | awk '{print $1}'`
	Ne_C=`echo $p | awk '{print $2}'`
	Ne_N=`echo $p | awk '{print $3}'`
	Ne_S=`echo $p | awk '{print $4}'`
	Ne_Co=`echo $p | awk '{print $5}'`
	tau_N=`echo $p | awk '{print $6}'`
	tau_Co=`echo $p | awk '{print $7}'`
	tau_S=`echo $p | awk '{print $8}'`
	mig_Ce=`echo $p | awk '{print $9}'`
	mig_N=`echo $p | awk '{print $10}'`
	mig_Co=`echo $p | awk '{print $11}'`
	mig_S=`echo $p | awk '{print $12}'` 
	mig_CeN=`echo $p | awk '{print $13}'`
	mig_CeCo=`echo $p | awk '{print $14}'`
	mig_CeS=`echo $p | awk '{print $15}'`
	no_mig=0
	
	msString1=`echo "$Nsampl 105 -t $Theta -r 0.94 1040 -I 17 $PopCent $PopCent $PopCent $PopCent $PopCent $PopCent $PopNorth $PopNorth $PopCoast $PopCoast $PopCoast $PopSouth $PopSouth $PopSouth $PCentr0 $PCentr0 $PCentr0"`
	msString2=`echo "-n 7 $Ne_N -n 8 $Ne_N -n 9 $Ne_Co -n 10 $Ne_Co -n 11 $Ne_Co -n 12 $Ne_S -n 13 $Ne_S -n 14 $Ne_S -n 17 $Ne_Co"`
	migString=`echo "-ma x $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_Ce x $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_Ce $mig_Ce x $mig_Ce $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_Ce $mig_Ce $mig_Ce x $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_Ce $mig_Ce $mig_Ce $mig_Ce x $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce x $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce $mig_Ce $mig_CeCo $mig_CeN $mig_CeN $mig_CeN $mig_CeN $mig_CeN $mig_CeN x $mig_N $no_mig $no_mig $no_mig $no_mig $no_mig $no_mig $mig_CeN $mig_CeN $no_mig $mig_CeN $mig_CeN $mig_CeN $mig_CeN $mig_CeN $mig_CeN $mig_N x $no_mig $no_mig $no_mig $no_mig $no_mig $no_mig $mig_CeN $mig_CeN $no_mig $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $no_mig $no_mig x $mig_Co $mig_Co $no_mig $no_mig $no_mig $mig_CeCo $mig_CeCo $mig_Co $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $no_mig $no_mig $mig_Co x $mig_Co $no_mig $no_mig $no_mig $mig_CeCo $mig_CeCo $mig_Co $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $no_mig $no_mig $mig_Co $mig_Co x $no_mig $no_mig $no_mig $mig_CeCo $mig_CeCo $mig_Co $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $no_mig $no_mig $no_mig $no_mig $no_mig x $mig_S $mig_S $mig_CeS $mig_CeS $no_mig $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $no_mig $no_mig $no_mig $no_mig $no_mig $mig_S x $mig_S $mig_CeS $mig_CeS $no_mig $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $mig_CeS $no_mig $no_mig $no_mig $no_mig $no_mig $mig_S $mig_S x $mig_CeS $mig_CeS $no_mig $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS x $mig_Ce $mig_CeCo $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_Ce $mig_CeN $mig_CeN $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeS $mig_CeS $mig_CeS $mig_Ce x $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $mig_CeCo $no_mig $no_mig $mig_Co $mig_Co $mig_Co $no_mig $no_mig $no_mig $mig_CeCo $mig_CeCo x"`
	divString=`echo "-ej $tau_S 12 17 -ej $tau_S 13 17 -ej $tau_S 14 17 -ej $tau_Co 9 16 -ej $tau_Co 10 16 -ej $tau_Co 11 16 -ej $tau_Co 17 16 -ej $tau_N 7 15 -ej $tau_N 8 15"`

#Simulates data, and calculates summary statistics
	./ms `echo "$msString1 $msString2 $migString $divString"` | perl -p -e 's/-I 17 20 20 20 20 20 20 20 20 20 20 20 20 20 20 0 0 0/-I 14 20 20 20 20 20 20 20 20 20 20 20 20 20 20/' | perl ./msSS.pl | R --slave -e 'x <- read.table(file="stdin"); x <- t(colMeans(x)); write.table(x,"sum_stats", col.names = F, row.names = F, quote = F, sep="\t")'
	{ echo "$p" ; cat sum_stats; } | paste -d"\t" -s >> all_prior
	rm -rf seedms sum_stats
done < all_params
