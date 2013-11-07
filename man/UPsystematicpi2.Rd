\name{UPsystematicpi2}
\alias{UPsystematicpi2}
\title{Joint inclusion probabilities for systematic sampling}
\description{
Computes the joint (second-order) inclusion probabilities for systematic sampling.
}
\usage{
UPsystematicpi2(pik)
}
\arguments{
\item{pik}{vector of the first-order inclusion probabilities.}
}
\value{
Returns a NxN matrix of the following form: the main diagonal contains the first-order inclusion 
probabilities for each unit k in the population; elements (k,l) are the joint inclusion
probabilities of units k and l, with k not equal to l. N is the population size. 
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
#matrix of the joint inclusion probabilities
UPsystematicpi2(pik)
}
\keyword{survey}
