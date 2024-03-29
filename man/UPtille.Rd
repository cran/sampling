\name{UPtille}
\alias{UPtille}
\title{Tille sampling}
\description{
Uses the Till�'s method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPtille(pik,eps=1e-6)
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
\seealso{\code{\link{UPsystematic}}
}
\references{
Till�, Y. (1996), An elimination procedure of unequal probability sampling without
replacement, \emph{Biometrika}, 83:238-241.\cr
Deville, J.-C. and Till�, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89-101.
}
\examples{
############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPtille(pik)
#the sample is
which(s==1)
############
## Example 2
############
# see in the 'UPexamples' vignette
# vignette("UPexamples", package="sampling")
}
\keyword{survey}
\encoding{latin1}
