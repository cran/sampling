\name{UPrandomsystematic}
\alias{UPrandomsystematic}
\title{Random systematic sampling}
\description{
Selects a sample using the systematic method, 
when the order of the population units
is random (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPrandomsystematic(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-6.}
}
\details{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise). The value 'eps' is used to control pik 
(pik>eps and pik<1-eps).
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
#select a sample
s=UPrandomsystematic(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
