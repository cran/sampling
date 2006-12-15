\name{UPmidzunopi2}
\alias{UPmidzunopi2}
\title{Joint inclusion probabilities for Midzuno sampling}
\description{
Compute the joint (second-order) inclusion probabilities for Midzuno sampling. 
}
\usage{
UPmidzunopi2(pik)
}
\arguments{
\item{pik}{the vector of the first-order inclusion probabilities.}
}
\details{
Return a NxN matrix with the first order inclusion probability for
each unit k in the population on the first diagonal and with the joint inclusion
probability of units k and l in position (k,l) in the
matrix, where k and l are not equal (N is the population size).
}
\seealso{\code{\link{UPmidzuno}}
}
\references{
Midzuno, H. (1952), On the sampling system with probability proportional to sum of size.
\emph{ Annals of the Institute of Statistical Mathematics}, 3:99-107.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#matrix of the joint inclusion probabilities
UPmidzunopi2(pik)
}
\keyword{survey}
