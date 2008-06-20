"UPpoisson" <-
function(pik) 
{if(any(is.na(pik))) stop("there are missing values in the pik vector")
n=sum(pik)
if(abs(n-trunc(n))<1e-6) n=trunc(n) 
else stop("the sum of pik is not integer")
as.numeric(runif(length(pik))<pik)
}
