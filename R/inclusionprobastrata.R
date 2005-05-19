"inclusionprobastrata" <-
function(strat,nh)
############################################################
# return a vector of inclusion probabilities.
# the inclusion probabilities are equal in each strata
#  
#  strata is a vector that defines the strata 
#  nh is a vector with the number of units to be selected in each strata
############################################################
{
EPS=0.00000000001;
N=length(strat)
v=unique(strat)
ma=max(v)
if(min(v)<1) cat("Error : the stratification variable has incorect values (less than 1)\n")
Nh=rep(0,times=ma)
for(i in 1:N) Nh[strat[i]]=Nh[strat[i]]+1
for(i in 1:ma) 
    if(nh[i]/Nh[i]>1+EPS) 
         cat("Error : in stratum ",i," the sample size is larger than the population size\n")
pik=rep(0,times=max(v))
for(i in 1:N)  pik[i]=nh[strat[i]]/Nh[strat[i]]
pik
}

