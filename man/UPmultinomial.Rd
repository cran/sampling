\name{UPmultinomial}
\alias{UPmultinomial}
\title{Multinomial sampling}
\description{
Use Hansen-Hurwitz method to select a sample of units (unequal probabilities, with replacement, fixed sample size).
}
\usage{
UPmultinomial(pik)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size.  
}
\seealso{\code{\link{rmultinom}}
}
\references{
Hansen, M. and Hurwitz, W. (1943), On the theory of sampling from finite populations.
\emph{Annals of Mathematical Statistics}, 14:333-362.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPmultinomial(pik)
}
\keyword{survey}
