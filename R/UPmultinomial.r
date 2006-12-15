"UPmultinomial" <-
function(pik) 
as.vector(rmultinom(1,sum(pik),pik/sum(pik)))

