\name{UPsystematic}
\alias{UPsystematic}
\title{Systematic sampling}
\description{
Uses the systematic method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPsystematic(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-6.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
}
\seealso{\code{\link{inclusionprobabilities}}, \code{\link{UPrandomsystematic}}
}
\references{
Madow, W.G. (1949), On the theory of systematic sampling, II, 
\emph{Annals of Mathematical Statistics}, 20, 333-354. 
}
\examples{
############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPsystematic(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPsystematic(pik)  
#the sample is
as.vector(name[s==1])
# extracts the observed data
getdata(belgianmunicipalities,s)
}
\keyword{survey}
