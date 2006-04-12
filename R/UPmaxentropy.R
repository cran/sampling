"UPmaxentropy" <-
function(pik) 
{ 
n=sum(pik)
if(n>=2)
{
pik2=pik[pik!=1]
n=sum(pik2)
piktilde=UPMEpiktildefrompik(pik2) 
w=piktilde/(1-piktilde) 
q=UPMEqfromw(w,n)
s2=UPMEsfromq(q)
s=rep(0,times=length(pik))
s[pik==1]=1
s[pik!=1][s2==1]=1
}
if(n==0) s=rep(0,times=length(pik))
if(n==1) s=as.vector(rmultinom(1, 1,pik)) 
s
}

