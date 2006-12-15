"UPrandompivotal" <-
function(pik)
{
N=length(pik)
v=sample(c(N),N)
s=numeric(N)
s[v]=UPpivotal(pik[v])
s
}

