\name{UPpivotal}
\alias{UPpivotal}
\title{Pivotal sampling}
\description{
Select an unequal probability sample by means of 
the pivotal method (unequal probabilities, without replacement, fixed sample size). 
}
\usage{
UPpivotal(pik,eps=1e-12)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-12.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size. The value eps is used to
control pik (pik>eps & pik < 1-eps).
}
\seealso{\code{\link{UPrandompivotal}}
}
\references{
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89-101.\cr
Chauvet, G. and Tillé, Y. (2004). A fast algorithm of balanced sampling. \emph{Submitted for publication}. 
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPpivotal(pik)
}
\keyword{survey}
\encoding{latin1}

