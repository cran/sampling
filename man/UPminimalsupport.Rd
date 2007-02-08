\name{UPminimalsupport}
\alias{UPminimalsupport}
\title{Minimal support sampling}
\description{
Uses minimal support method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPminimalsupport(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise). 
}
}
\references{
Deville, J.-C., Tillé, Y. (1998), Unequal probability sampling without replacement 
through a splitting method, \emph{Biometrika }, 85, 89-101.\cr
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.
}
\examples{
############
## Example 1
############
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPminimalsupport(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#select a sample
s=UPminimalsupport(pik)  
#the sample is
as.vector(name[s==1])
}
\keyword{survey}
