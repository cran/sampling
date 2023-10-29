\name{UPmultinomial}
\alias{UPmultinomial}
\title{Multinomial sampling}
\description{
Uses the Hansen-Hurwitz method to select a sample of units (unequal probabilities, with replacement, fixed sample size).
}
\usage{
UPmultinomial(pik)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
}
\value{
Returns a vector of size N, the population size. Each element k of this vector indicates 
the number of replicates of unit k in the sample.
}
\references{
Hansen, M. and Hurwitz, W. (1943), On the theory of sampling from finite populations.
\emph{Annals of Mathematical Statistics}, 14:333-362.
}
\examples{
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPmultinomial(pik)
#the selected units are
which(s!=0)
#with the number of replicates 
s[s!=0]
#or use
rep((1:length(pik))[s!=0],s[s!=0]) 
}
\keyword{survey}
