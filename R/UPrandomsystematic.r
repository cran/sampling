UPrandomsystematic<-function(pik)
##########################################
# select an unequal probability sample by means of 
# the random systematic method.
##########################################
{
N=length(pik)
v=sample(N,N)
s=numeric(N)
s[v]=UPsystematic(pik[v])
s
}
