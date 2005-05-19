\name{UPrandompivotal}
\alias{UPrandompivotal}
\title{Random pivotal sampling}
\description{
Select an unequal probability sample by means of 
the pivotal method, when the order of the units in the population is random.
}
\usage{
UPrandompivotal(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size. 
}
\seealso{\code{\link{UPpivotal}}
}
\references{
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89--101.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPrandompivotal(pik)
}
\keyword{survey}
\encoding{latin1}
