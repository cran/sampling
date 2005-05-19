\name{UPpoisson}
\alias{UPpoisson}
\title{Poisson sampling}
\description{
Draw a Poisson sample, by using a prescribed vector of first order inclusion 
probabilities (unequal probabilities, without replacement, random sample size). 
}
\usage{UPpoisson(pik)}
\arguments{
\item{pik}{vector of first order inclusion probabilities of size N.}
}
\details{Return a vector of size N (N is the size population), indicating the unit status
(0-unselected, 1-selected). 
}
\seealso{
\code{\link{inclusionprobabilities}}
}
\examples{
############
## Example 1
############
# definition of pik
pik=c(1/3,1/3,1/3)
# select a sample
UPpoisson(pik)
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
pik=inclusionprobabilities(Tot,n)
# select a sample
s=UPpoisson(pik)  
as.vector(name[s==1])
}
\keyword{survey}
