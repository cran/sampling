\name{UPtillepi2}
\alias{UPtillepi2}
\title{Joint inclusion probabilties for Tillé sampling}
\description{
Compute the joint inclusion probabilities for Tillé sampling.
}
\usage{
UPtillepi2(pik,eps=0.000005)
}
\arguments{
\item{pik}{vector of first order inclusion probabilities.}
\item{eps}{the control value, by default equal to 0.000005.}
}
\details{
Return a NxN matrix  with the first order inclusion probability for
each unit k in the population on the first diagonal and with the joint inclusion
probability of units k and l in position (k,l) in the
matrix, where k and l are not equal (N is the population size). The value eps is used to
control pik (pik>eps & pik < 1-eps).
}
\seealso{\code{\link{UPtille}}
}
\references{
Tillé, Y. (1996), An elimination procedure of unequal probability sampling without
replacement, \emph{Biometrika}, 83:238-241.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
UPtillepi2(pik)
}
\keyword{survey}
\encoding{latin1}

