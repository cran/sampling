\name{UPsampfordpi2}
\alias{UPsampfordpi2}
\title{Joint inclusion probabilities for Sampford sampling}
\description{
Computes the joint (second-order) inclusion probabilities for Sampford sampling.
}
\usage{
UPsampfordpi2(pik)
}
\arguments{
\item{pik}{vector of the first-order inclusion probabilities.}
}
\value{
Returns a NxN matrix of the following form: the main diagonal contains the first-order inclusion 
probabilities for each unit k in the population; elements (k,l) are the joint inclusion
probabilities of units k and l, with k not equal to l. N is the population size. 
}
\seealso{\code{\link{UPsampford}}
}
\references{
Sampford, M. (1967), On sampling without replacement with unequal probabilities of
selection, \emph{Biometrika}, 54:499-513.\cr
Wu, C. (2004). R/S-PLUS Implementation of pseudo empirical
likelihood methods under unequal probability sampling. Working
paper 2004-07, Department of Statistics and Actuarial Science,
University of Waterloo.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#matrix of the joint inclusion probabilities
UPsampfordpi2(pik)
}
\keyword{survey}
