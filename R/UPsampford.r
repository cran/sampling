"UPsampford" <-
function(pik,eps=0.000005)
########################################################################
# Select an unequal probability sample by means of the Sampford
# method.
#########################################################################
{
liste= pik>eps & pik < 1-eps
pikb=pik[liste]
n=sum(pikb)
N=length(pikb)
sb=rep(2,times=N)
y=pikb/(1-pikb)/sum(pikb/(1-pikb))
while(sum(sb<=1)!=N)
{
sb=as.vector(rmultinom(1,1,pikb/sum(pikb))+rmultinom(1,n-1,y))
}
s=pik
s[liste]=sb
s
}

