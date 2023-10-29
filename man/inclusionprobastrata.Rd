\name{inclusionprobastrata}
\alias{inclusionprobastrata}
\title{Inclusion probabilities for a stratified design}
\description{Computes the inclusion probabilities for a stratified design. 
The inclusion probabilities are equal in each stratum.}
\usage{inclusionprobastrata(strata,nh)}
\arguments{
\item{strata}{vector that defines the strata.}
\item{nh}{vector of the number of selected units in each stratum.}
}
\seealso{
\code{\link{balancedstratification}}
}
\examples{
# the strata
strata=c(1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3)
# sample size in each stratum
nh=c(2,3,3)
# inclusion probabilities for each stratum
pik=inclusionprobastrata(strata,nh)
#check for each stratum
cbind(strata, pik)
}
\keyword{survey}
