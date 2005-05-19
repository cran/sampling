\name{UPsampford}
\alias{UPsampford}
\title{Sampford sampling}
\description{
Use Sampford method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPsampford(pik,eps=0.000005)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{the control value, by default equal to 0.000005.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size. The value eps is used to
control pik (pik>eps & pik < 1-eps). The sample size must be small with respect to the 
population size; otherwise, the selection time can be very long.
}
\seealso{\code{\link{UPsystematic}}
}
\references{
Sampford, M. (1967), On sampling without replacement with unequal probabilities of
selection, \emph{Biometrika}, 54:499-513.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
UPsampford(pik)
}
\keyword{survey}
