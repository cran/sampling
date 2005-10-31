"UPrandompivotal" <-
function(pik)
##########################################
# select an unequal probability sample by means of 
# the random pivotal method.
##########################################
{
N=length(pik)
v=sample(c(N),N)
s=numeric(N)
s[v]=UPpivotal(pik[v])
s
}

