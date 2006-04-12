"UPtille" <-
function(pik,eps=1e-6)
{
liste= pik>eps & pik < 1-eps
pikb=pik[liste]
N=length(pikb)
n=sum(pikb)
sb=rep(1,times=N)
b=rep(1,times=N)
for(i in 1:(N-n))
{a=inclusionprobabilities(pikb,N-i)
v=1-a/b
b=a
p=v*sb
for(i in 2:N) p[i]=p[i]+p[i-1]
u=runif(1)
j=1
while( u>=p[j] ) j=j+1
sb[j]=0
}
s=pik
s[liste]=sb
s
}

