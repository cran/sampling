"UPrandomsystematic" <-
function(pik)
{
N=length(pik)
v=sample(N,N)
s=numeric(N)
s[v]=UPsystematic(pik[v])
s
}

