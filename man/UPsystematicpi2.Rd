\name{UPsystematicpi2}
\alias{UPsystematicpi2}
\title{Joint inclusion probabilities for systematic sampling}
\description{
Compute the joint inclusion probabilities for systematic sampling.
}
\usage{
UPsystematicpi2(pik)
}
\arguments{
\item{pik}{vector of first order inclusion probabilities.}
}
\details{
Return a NxN matrix with the first order inclusion probability for
each unit k in the population on the first diagonal and with the joint inclusion
probability of units k and l in position (k,l) in the
matrix, where k and l are not equal (N is the population size).
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
UPsystematicpi2(pik)
}
\keyword{survey}
