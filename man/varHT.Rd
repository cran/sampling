\name{varHT}
\alias{varHT}
\title{Variance estimators of the Horvitz-Thompson estimator}
\description{Computes variance estimators of the Horvitz-Thompson estimator of the population total.}
\usage{varHT(y,pikl,method)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{pikl}{matrix of second-order inclusion probabilities; its dimension is nxn.}
\item{method}{if 1, an unbiased variance estimator is computed; if 2, the Sen-Yates-Grundy variance estimator for fixed sample size is computed; be default, the method is 1.}
}
\details{
If method is 1, the following estimator is implemented
\deqn{\widehat{Var}(\widehat{Y}_{HT})_1=\sum_{k\in s}\sum_{\ell\in s}
\frac{y_k y_\ell}{\pi_{k\ell} \pi_k \pi_\ell}(\pi_{k\ell} - \pi_k \pi_\ell)}
If method is 2, the following estimator is implemented
\deqn{\widehat{Var}(\widehat{Y}_{HT})_2=\frac{1}{2}\sum_{k\in s}\sum_{\ell\in s}
\left(\frac{y_k}{\pi_k} - \frac{y_\ell}{\pi_\ell}\right)^2 \frac{\pi_k \pi_\ell-\pi_{k\ell}}{\pi_{k\ell}}}}
\seealso{
\code{\link{HTestimator}}
}
\examples{
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=rnorm(N,10,2)
# Draws a Poisson sample of expected size n
s=UPpoisson(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the second-order inclusion prob. for Poisson sampling
pikl=outer(pik,pik,"*")
diag(pikl)=pik
# Computes the variance estimator (method=1, the sample size is not fixed)
varHT(y[s==1],pikl[s==1,s==1],1)
# Draws a Tille sample of size n
s=UPtille(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the second-order inclusion prob. for Tille sampling
pikl=UPtillepi2(pik)
# Computes the variance estimator (method=2, the sample size is fixed)
varHT(y[s==1],pikl[s==1,s==1],2)
}
\keyword{survey}