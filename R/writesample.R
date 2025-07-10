writesample<-function(n,N)
{
  cc<-choose(N,n)
  P<-matrix(0,cc,N)
  R<-combn(N,n)
  for(i in seq_len(cc)) P[i,R[,i]]<-1
  P
}