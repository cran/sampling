"UPsampford" <-
function(pik,eps=1e-6)
{
if(any(is.na(pik))) stop("there are missing values in the pik vector")
n=sum(pik)
if(n!=trunc(n)) stop("the sum of pik is not integer")
list= pik>eps & pik < 1-eps
pikb=pik[list]
n=sum(pikb)
N=length(pikb)
s=pik
if(N<1) stop("the pik vector has all elements outside of the range [eps,1-eps]")
else 
{
sb=rep(2,N)
y=pikb/(1-pikb)/sum(pikb/(1-pikb))
while(sum(sb<=1)!=N)
	sb=as.vector(rmultinom(1,1,pikb/sum(pikb))+rmultinom(1,n-1,y))
s[list]=sb
}
s
}
