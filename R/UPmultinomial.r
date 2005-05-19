########################################################################
# Multinomial or Hansen-Hurwitz design (with replacement).
#########################################################################

UPmultinomial<-function(pik) 
as.vector(rmultinom(1,sum(pik),pik/sum(pik)))
