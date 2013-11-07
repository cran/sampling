\name{HTestimator}
\alias{HTestimator}
\title{The Horvitz-Thompson estimator}
\description{Computes the Horvitz-Thompson estimator of the population total.}
\usage{HTestimator(y,pik)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{pik}{vector of the first-order inclusion probabilities; its length is equal to n, the sample size.}
}
\seealso{
\code{\link{UPtille}}
}
\examples{
data(belgianmunicipalities)
attach(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=TaxableIncome
# Draws a Poisson sample of expected size 200
s=UPpoisson(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
}
\keyword{survey}