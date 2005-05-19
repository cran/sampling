UPmidzunopi2<-function(pik) 
#####################################################
# Joint inclusion probabilities of the Midzuno method
#####################################################
{
N=length(pik)
UN=rep(1,times=N)
b=1-pik%*%t(UN)
1-b-t(b)+UPtillepi2(1-pik)
}
