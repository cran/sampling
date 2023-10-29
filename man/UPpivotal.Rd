\name{UPpivotal}
\alias{UPpivotal}
\title{Pivotal sampling}
\description{
Selects an unequal probability sample using 
the pivotal method (unequal probabilities, without replacement, fixed sample size). 
}
\usage{
UPpivotal(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
\item{eps}{control value, by default equal to 1e-6.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
The value eps is used to control pik (pik>eps & pik < 1-eps).
}
\seealso{\code{\link{UPrandompivotal}}
}
\references{
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89-101.\cr
Chauvet, G. and Tillé, Y. (2006). A fast algorithm of balanced sampling. \emph{to appear in Computational Statistics}.\cr
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer. 
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPpivotal(pik)
#the sample is
which(s==1)
}
\keyword{survey}
\encoding{latin1}

