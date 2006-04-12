"UPtillepi2" <-
function(pik,eps=1e-6)
{
liste= pik>eps & pik < 1-eps
pikb=pik[liste]
N=length(pikb)
n=sum(pikb)
pp=1
UN=rep(1,times=N)
b=rep(1,times=N)
for(i in 1:(N-n))
{
a=inclusionprobabilities(pikb,N-i)
vv=1-a/b
b=a
d=vv %*% t(UN)
pp=pp*(1-d-t(d))
}
for(i in 1:N) pp[i,i]=pikb[i]
ppf=pik%*%t(pik)
ppf[liste,liste]=pp
ppf
}

