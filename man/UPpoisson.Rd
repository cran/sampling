\name{UPpoisson}
\alias{UPpoisson}
\title{Poisson sampling}
\description{
Draw a Poisson sample, by using a prescribed vector of first-order inclusion 
probabilities (unequal probabilities, without replacement, random sample size). 
}
\usage{UPpoisson(pik)}
\arguments{
\item{pik}{vector of first-order inclusion probabilities.}
}
\details{
Return a vector (with elements 0 and 1) of size N, where N is the population size.  
Each element k of this vector indicates the status of the unit k 
(1, the unit k is selected in the sample; 0, otherwise).

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
s=UPpoisson(pik)
#the sample is
(1:length(pik))[s==1]
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
#the sample is
as.vector(name[s==1])
}
\keyword{survey}
