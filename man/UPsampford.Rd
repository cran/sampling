\name{UPsampford}
\alias{UPsampford}
\title{Sampford sampling}
\description{
Uses the Sampford's method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPsampford(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-6.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
The value eps is used to control pik (pik>eps & pik < 1-eps). 
The sample size must be small with respect to the 
population size; otherwise, the selection time can be very long.
}
\seealso{\code{\link{UPsampfordpi2}}
}
\references{
Sampford, M. (1967), On sampling without replacement with unequal probabilities of
selection, \emph{Biometrika}, 54:499-513.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
s=UPsampford(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
