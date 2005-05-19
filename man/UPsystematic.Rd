\name{UPsystematic}
\alias{UPsystematic}
\title{Systematic sampling}
\description{
Use systematic method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPsystematic(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size.  
}
\seealso{\code{\link{inclusionprobabilities}},\code{\link{UPrandomsystematic}}
}
\references{
Madow, W.G. (1949), On the theory of systematic sampling, II, 
\emph{Annals of Mathematical Statistics}, 20, 333-354. 
}
\examples{
############
## Example 1
############
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPsystematic(pik)
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#select a sample
s=UPsystematic(pik)  
as.vector(name[s==1])
}
\keyword{survey}
