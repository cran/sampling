"UPsystematic" <-
function (pik) 
{
pik1=pik[pik>0 & pik< 1]
N=length(pik1)
a=(c(0,cumsum(pik1))-runif(1,0,1)) %% 1
s1=as.integer(a[1:N]>a[2:(N+1)])
s=pik
s[pik>0 & pik< 1]=s1
s
}

