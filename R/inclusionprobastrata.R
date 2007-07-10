"inclusionprobastrata" <-
function(strat,nh)
{
EPS=1e-6
N=length(strat)
v=unique(strat)
ma=max(v)
if(min(v)<1) stop("the stratification variable has incorect values (less than 1)\n")
Nh=rep(0,times=ma)
for(i in 1:N) Nh[strat[i]]=Nh[strat[i]]+1
for(i in 1:ma) 
    if(nh[i]/Nh[i]>1+EPS) 
        warning("in stratum ",i," the sample size is larger than the population size\n")
pik=rep(0,times=max(v))
for(i in 1:N)  pik[i]=nh[strat[i]]/Nh[strat[i]]
pik
}
