"inclusionprobastrata" <-
function(strata,nh)
{
EPS=1e-6
N=length(strata)
v=unique(strata)
ma=max(v)
if(min(v)<1) stop("the stratification variable has incorect values (less than 1)\n")
Nh=rep(0,times=ma)
for(i in 1:N) Nh[strata[i]]=Nh[strata[i]]+1
for(i in 1:ma) 
    if(nh[i]/Nh[i]>1+EPS) 
        warning("in stratum ",i," the sample size is larger than the population size\n")
pik=rep(0,times=max(v))
for(i in 1:N)  pik[i]=nh[strata[i]]/Nh[strata[i]]
pik
}
