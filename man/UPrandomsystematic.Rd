\name{UPrandomsystematic}
\alias{UPrandomsystematic}
\title{Random systematic sampling}
\description{
Use systematic method to select a sample of units, 
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
Return a vector (0 and 1) of size N, where N is the population size. 
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
UPrandomsystematic(pik)
}
\keyword{survey}
