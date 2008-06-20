"UPsystematic"<-function(pik,eps=1e-6) 
{
if(any(is.na(pik))) stop("there are missing values in the pik vector")
n=sum(pik)
if(abs(n-trunc(n))<1e-6) n=trunc(n) 
else stop("the sum of pik is not integer")
list=pik > eps & pik < 1-eps
pik1 = pik[list]
N = length(pik1)
a = (c(0, cumsum(pik1)) - runif(1, 0, 1))%%1
s1 = as.integer(a[1:N] > a[2:(N + 1)])
s = pik
s[list] = s1
s
}

