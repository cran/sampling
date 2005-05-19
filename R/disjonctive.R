"disjonctive" <-
function(strat)
#
# transform a categorical variable
# into a matrix of indicators
#
#########################################
{
strat=round(strat)
N=length(strat)
mi=min(strat)
ma=max(strat)
H=ma-mi+1
disjon=array(0,c(N,H))
iii=(strat-mi+1)
for(i in 1:N) disjon[i,iii[i]]=1
tot=rep(0, times = H) 
for(i in 1:H) tot[i]=sum(disjon[,i])
disjon=disjon[,(tot>0)]
disjon
}

