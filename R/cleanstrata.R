"cleanstrata" <-
function(st)
############################################
#
# renumber a variable of stratification
# (qualitative variable)
# the strata receive number from 1 to the last stratum
# the empty strata are suppressed
#
# st is a vector with the strata numbers
#
###########################################
{
a=sort(unique(st)) 
b=1:length(a) 
names(b)=a 
as.vector(b[as.character(st)]) 
}

