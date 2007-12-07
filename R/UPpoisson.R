"UPpoisson" <-
function(pik,eps=1e-6) 
{if(any(is.na(pik))) stop("there are missing values in the pik vector")
list=pik>eps & pik < 1-eps
pikb=pik[list]
s=pik
s[list]=runif(length(pikb))<pikb
s
}

