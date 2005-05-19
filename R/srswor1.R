"srswor1" <-
function(n,N)
##n = sample size
##N = population size
{j=0
 s=numeric(N)
 for(k in 1:N){
   u=runif(1,0,1)
   if(u<(n-j)/(N-k+1)) {j=j+1;s[k]=1;}
               }
s}

