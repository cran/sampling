"UPpoisson" <-
function(pik) 
{if(any(is.na(pik))) stop("there are missing values in the pik vector")
n=sum(pik)
n=.as_int(n)
as.numeric(runif(length(pik))<pik)
}
