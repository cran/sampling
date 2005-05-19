UPsystematicpi2<-function(pik)
#######################################################
# Compute the joint inclusion probabilities of the 
# systematic sampling.
#######################################################
{
N=length(pik)
V=array(0,c(N,N))
for(l in 2:N) {for(k in 1:(l-1)) V[k,l]= sum(pik[k:(l-1)])}
for(k in 2:N) {for(l in 1:(N)) V[k,l]= sum(pik[k:N])+sum(pik[1:(l-1)])}
V<-V-floor(V)
pik2=array(0,c(N,N))
for(l in 2:N) 
for(k in 1:(l-1))
   pik2[l,k]=pik2[k,l]=min(max(0,pik[k]-V[k,l]),pik[l])+min(pik[k],max(0,V[k,l]+pik[l]-1))
for(k in 1:N) pik2[k,k]=pik[k]
pik2
}

