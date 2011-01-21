\name{Hajekestimator}
\alias{Hajekestimator}
\title{The Hajek estimator}
\description{Computes the Hájek estimator of the population total or population mean.}
\usage{Hajekestimator(y,pik,N=NULL,type=c("total","mean"))} 
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{pik}{vector of the first-order inclusion probabilities; its length is equal to n, the sample size.}
\item{N}{population size; N is only used for the total estimator; for the mean estimator its value is NULL.}
\item{type}{the estimator type: total or mean.}
}
\seealso{
\code{\link{HTestimator}}
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
# Computes the Hajek estimator of the population mean
Hajekestimator(y[s==1],pik[s==1],type="mean")
# Computes the Hajek estimator of the population total
Hajekestimator(y[s==1],pik[s==1],N=N,type="total")
}
\keyword{survey}
