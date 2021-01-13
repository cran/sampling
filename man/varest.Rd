\name{varest}
\alias{varest}
\title{Variance estimation using the Deville's method}
\description{Computes the variance estimation of an estimator of the population total using the Deville's method.}
\usage{varest(Ys,Xs=NULL,pik,w=NULL)}
\arguments{
\item{Ys}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{Xs}{matrix of the auxiliary variables; for the calibration estimator, this is the matrix of the sample calibration variables.} 
\item{pik}{vector of the first-order inclusion probabilities; its length is equal to n, the sample size.}
\item{w}{vector of the calibrated weights (for the calibration estimator); its length is equal to n, the sample size.}
}
\details{
The function implements the following estimator:
\deqn{\widehat{Var}(\widehat{Ys})=\frac{1}{1-\sum_{k\in s} a_k^2}\sum_{k\in s}(1-\pi_k)\left(\frac{y_k}{\pi_k}-\frac{\sum_{l\in s} (1-\pi_{l})y_l/\pi_l}{\sum_{l\in s} (1-\pi_l)}\right)}
where \eqn{a_k=(1-\pi_k)/\sum_{l\in s} (1-\pi_l)}.
}
\references{ 
Deville, J.-C. (1993). \emph{Estimation de la variance pour les enquêtes en deux phases}. Manuscript, INSEE, Paris.
} 
\seealso{
\code{\link{calibev}}
}
\examples{
# Belgian municipalities data base
data(belgianmunicipalities)
attach(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=TaxableIncome
# Draws a Tille sample of size 200
s=UPtille(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the variance estimation of the Horvitz-Thompson estimator
varest(Ys=y[s==1],pik=pik[s==1])
# for an example using calibration estimator see the 'calibration' vignette 
# vignette("calibration", package="sampling")
}
\keyword{survey}
