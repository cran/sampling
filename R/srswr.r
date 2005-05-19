########################################################################
# Select a simple random sample with replacement.
#########################################################################

srswr<-function(n,N) as.vector(rmultinom(1,n,rep(n/N,times=N)))
