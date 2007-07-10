\name{HTestimator}
\alias{HTestimator}
\title{The Horvitz-Thompson estimator}
\description{Computes the Horvitz-Thompson estimator of the population total.}
\usage{HTestimator(y,pik,s)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to N, the population size.}
\item{pik}{vector of the first-order inclusion probabilities.}
\item{s}{vector of size N, with 0/1 elements indicating the unit 
status: 1 - unit is selected in the sample, 0 - otherwise.}
}
\seealso{
\code{\link{UPtille}}
}
\examples{
# Belgian municipalities data base
data(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(belgianmunicipalities$Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=belgianmunicipalities$TaxableIncome
# Draws a Poisson sample of expected size 200
s=UPpoisson(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y,pik,s)
}
\keyword{survey}