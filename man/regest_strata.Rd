\name{regest_strata}
\alias{regest_strata}
\title{Regression estimator for a stratified design}
\description{Computes the regression estimator of the population total for a stratified sampling, using the 
design-based approach. The same regression model is used for
all strata. The underling regression model is a model without intercept.}
\usage{regest_strata(formula,weights,Tx_strata,strata,pikl,
sigma=rep(1,length(weights)),description=FALSE)}
\arguments{
\item{formula}{regression model formula (y~x).}
\item{weights}{vector of the weights; its length is equal to n, the sample size.}
\item{Tx_strata}{population total of x, the auxiliary variable.}
\item{strata}{vector of stratum identificator.}
\item{pikl}{joint inclusion probabilities for the sample.}
\item{sigma}{vector of positive values accounting for heteroscedasticity.}
\item{description}{if TRUE, the following components are printed for each stratum:
 the Horvitz-Thompson estimator, the estimated beta coefficients, their estimated standard error, t_values, p_values, 
and the covariance matrix. By default, FALSE.}
}
\value{
The function returns the value of the regression estimator computed as the sum of the
stratum estimators.
}
\seealso{
\code{\link{regest}}
}
\examples{
# generates artificial data
y=rgamma(10,3)
x=y+rnorm(10)
Stratum=c(1,1,2,2,2,3,3,3,3,3)
# population size
N=200
# sample size
n=10
# assume proportional allocation, nh/Nh=n/N 
# joint inclusion probabilities (for the sample)
pikl=matrix(n*(n-1)/(N*(N-1)),n,n)
diag(pikl)=n/N
regest_strata(formula=y~x-1,weights=rep(N/n,n),Tx_strata=c(50,30,40),
strata=Stratum,pikl,description=TRUE)
}
\keyword{survey}
