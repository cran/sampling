\name{UPpoisson}
\alias{UPpoisson}
\title{Poisson sampling}
\description{
Draws a Poisson sample using a prescribed vector of first-order inclusion 
probabilities (unequal probabilities, without replacement, random sample size). 
}
\usage{UPpoisson(pik)}
\arguments{
\item{pik}{vector of the first-order inclusion probabilities.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise). The value 'eps' is used to
control pik (pik>eps & pik < 1-eps). 
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
# selects a sample
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
getdata(name,s)
}
\keyword{survey}
