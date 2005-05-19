\name{UPmidzuno}
\alias{UPmidzuno}
\title{Midzuno sampling}
\description{
Use Midzuno method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPmidzuno(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size.  
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
UPmidzuno(pik)
}
\keyword{survey}
\encoding{latin1}

