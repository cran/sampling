\name{UPrandompivotal}
\alias{UPrandompivotal}
\title{Random pivotal sampling}
\description{
Select a sample by means of 
the pivotal method, when the order of the units in the population is random (unequal probabilities, 
without replacement, fixed sample size). 
}
\usage{
UPrandompivotal(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (with elements 0 and 1) of size N, where N is the population size.  
Each element k of this vector indicates the status of the unit k 
(1, the unit k is selected in the sample; 0, otherwise).
}
\seealso{\code{\link{UPpivotal}}
}
\references{
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89--101.\cr
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPrandompivotal(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
\encoding{latin1}
