\name{UPmidzuno}
\alias{UPmidzuno}
\title{Midzuno sampling}
\description{
Uses the Midzuno's method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPmidzuno(pik,eps=1e-6)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-6.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size. 
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise). The value 'eps' is used to
control pik (pik>eps & pik < 1-eps).  
}
\seealso{\code{\link{UPtille}}
}
\references{
Midzuno, H. (1952), On the sampling system with probability proportional to sum of size.
\emph{ Annals of the Institute of Statistical Mathematics}, 3:99-107.\cr
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89-101.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPmidzuno(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
\encoding{latin1}

