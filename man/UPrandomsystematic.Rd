\name{UPrandomsystematic}
\alias{UPrandomsystematic}
\title{Random systematic sampling}
\description{
Select a sample using the systematic method, 
when the order of units in population
is random (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPrandomsystematic(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (with elements 0 and 1) of size N, where N is the population size.  
Each element k of this vector indicates the status of the unit k 
(1, the unit k is selected in the sample; 0, otherwise).
}
\seealso{\code{\link{UPsystematic}}
}
\references{
Madow, W.G. (1949), On the theory of systematic sampling, II, 
\emph{Annals of Mathematical Statistics}, 20, 333-354. 
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPrandomsystematic(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
