"cleanstrata" <-
function(st)
############################################
#
# renumber a variable of stratification
#          (qualitative variable)
# the strata receive number from 1 to the last stratum
# the empty strata are suppressed
#
# st is a vector with the numbers of the strata
#
###########################################
{
N=length(st)
a=sort(unique(st))
stc=rep(0,times=N)
for(k in 1:N)for(i in 1:length(a)) if(st[k]==a[i]) stc[k]=i
stc
}

