UPMEpiktildefrompik<-function(pik,eps=0.0000001) 
# Newton algorithm to find the inclusion probabilities of the
# Poisson design from which the maximum entropy design 
#is the conditional Poisson sampling
{ 
N=length(pik)
n=sum(pik) 
pikt=pik 
arr=1 
while(arr>eps) 
{ 
w=(pikt)/(1-pikt) 
q=UPMEqfromw(w,n)
pikt1=pikt+pik-UPMEpikfromq(q) 
arr=sum(abs(pikt-pikt1)) 
pikt=pikt1 
} 
pikt
} 
