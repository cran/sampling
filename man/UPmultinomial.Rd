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
\item{pik}{vector of the the inclusion probabilities.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
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
#the sample is
(1:length(pik))[s==1] 
}
\keyword{survey}
