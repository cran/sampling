HTestimator<-function(y,pik,s)
{crossprod(y[s==1],s[s==1]/pik[s==1])}

