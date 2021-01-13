"UPrandomsystematic" <-
function(pik,eps=1e-6)
{
if(any(is.na(pik))) stop("there are missing values in the pik vector")
N=length(pik)
v=sample.int(N,N)
s=numeric(N)
s[v]=UPsystematic(pik[v],eps)
s
}

