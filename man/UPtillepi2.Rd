\name{UPtillepi2}
\alias{UPtillepi2}
\title{Joint inclusion probabilties for Tillé sampling}
\description{
Computes the joint (second-order) inclusion probabilities for Tillé sampling.
}
\usage{
UPtillepi2(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of the first-order inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-6.}
}
\details{
Returns a NxN matrix of the following form: the main diagonal contains the first-order inclusion 
probabilities for each unit k in the population; elements (k,l) are the joint inclusion
probabilities of units k and l, with k not equal to l. N is the population size. The value \code{eps} is used to
control \code{pik} (pik>eps & pik < 1-eps).
}
\seealso{\code{\link{UPtille}}
}
\references{
Tillé, Y. (1996), An elimination procedure of unequal probability sampling without
replacement, \emph{Biometrika}, 83:238-241.
}
\examples{
#defines the prescribed inclusion probabilities 
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
pik_joint=UPtillepi2(pik)
#the joint inclusion probabilities  
pik_joint
}
\keyword{survey}
\encoding{latin1}

