UPopips<-function(lambda, type=c("pareto","uniform","exponential"),eps = 1e-6)
{
  if(anyNA(lambda)) stop("there are missing values in the lambda vector")
  type <- match.arg(type)
  list<- (lambda > eps & lambda < 1 - eps)
  lambda1 <- lambda[list]
  N <- length(lambda1)
  n <-.as_int(sum(lambda1))
  omega <- runif(N)
  s<-lambda
  s1<-switch(type,pareto=(omega*(1-lambda1)/((1-omega)*lambda1)),
         uniform=omega/lambda1, exponential=log(1-omega)/log(1-lambda1))
  s1<-order(s1)    
  s1<-s1[seq_len(n)]
  s[list][s1]<-1
  s
}
