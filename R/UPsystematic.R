"UPsystematic" <-
function(pik) 
##pik=first inclusion probabilities
{
    N = length(pik)
    v = cumsum(pik)
    v=c(0,v)
    u = runif(1, 0, 1)
    s = numeric(N)
    j=0
    for(i in 2:(N+1)) 
	   if(v[i-1]<=u && u<v[i]) {j=j+1; s[i-1]=1;u=u+1;}
s
}

