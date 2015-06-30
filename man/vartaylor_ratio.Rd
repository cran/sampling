\name{vartaylor_ratio}
\alias{vartaylor_ratio}
\title{Taylor-series linearization variance estimation of a ratio}
\description{Computes the Taylor-series linearization variance estimation of the ratio \deqn{\frac{\widehat{Y}_s}{\widehat{X}_s}.} 
The estimators in the ratio are Horvitz-Thompson estimators.
}
\usage{vartaylor_ratio(Ys,Xs,pikls)}
\arguments{
\item{Ys}{vector of the first observed variable; its length is equal to n, the sample size.}
\item{Xs}{vector of the second observed variable; its length is equal to n, the sample size.} 
\item{pikls}{matrix of joint inclusion probabilities of the sample units; its dimension is nxn.}
}
\details{
The function implements the following estimator:
\deqn{\widehat{Var}(\frac{\widehat{Ys}}{\widehat{Xs}})=\sum_{i\in s}\sum_{j\in s}\frac{\pi_{ij}-\pi_i\pi_j}{\pi_{ij}}\frac{\widehat{z_i}\widehat{z_j}}{\pi_i\pi_j}} 
where \eqn{\widehat{z_i}=(Ys_i-\widehat{r}Xs_i)/\widehat{X}_s, \widehat{r}=\widehat{Y}_s/\widehat{X}_s, \widehat{Y}_s=\sum_{i\in s}{Ys_i/\pi_i}, \widehat{X}_s=\sum_{i\in s}{Xs_i/\pi_i}}.
}
\references{ 
Woodruff, R. (1971). \emph{A Simple Method for Approximating the Variance of a Complicated Estimate}, Journal of the American Statistical Association, Vol. 66,  No. 334 , pp. 411--414.
} 
\examples{
data(belgianmunicipalities)
attach(belgianmunicipalities)
# inclusion probabilities, sample size 200
pik=inclusionprobabilities(Tot04,200)
# the first variable (population level)
Y=Men04
# the second variable (population level)
X=Women04
# population size
N=length(pik)             
# joint inclusion probabilities for Poisson sampling
pikl=outer(pik,pik,"*")
# draw a sample using Poisson sampling 
s=UPpoisson(pik)           
# sample inclusion probabilities
piks=pik[s==1]            
# the first observed variable
Ys=Y[s==1]
# the second observed variable
Xs=X[s==1]              
# matrix of joint inclusion prob. (sample level)          
pikls=pikl[s==1,s==1] 
# ratio estimator and its estimated variance
vartaylor_ratio(Ys,Xs,pikls)
}
\keyword{survey}
