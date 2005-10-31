"UPbrewer" <-
function(pik, eps = 5e-06)
##########################################
# select an unequal probability sample by means of the Brewer method.
##########################################
{
liste = pik > eps & pik < 1 - eps
pikb = pik[liste]
N = length(pikb)
n = sum(pikb)
sb=rep(0,times=N)
for(i in 1:n)
{
n=sum(pikb)
a=sum(pikb*sb)
p=(1-sb)*pikb*(n-a-pikb)/(n-a-pikb*(n-(i-1)))
p=p/sum(p)
for(i in 2:N) p[i]=p[i]+p[i-1]
u=runif(1)
j=1
while(u>=p[j]) j=j+1
sb[j]=1
}
s = pik
s[liste] = sb
round(s)
}

