\name{inclusionprobastrata}
\alias{inclusionprobastrata}
\title{Strata inclusion probabilities}
\description{Compute the inclusion probabilities for a stratified design. 
The inclusion probabilities 
are equal in each strata.}
\usage{inclusionprobastrata(strat,nh)}
\arguments{
\item{strat}{vector that defines the strata.}
\item{nh}{vector with the number of units to be selected in each strata.}
}
\seealso{
\code{\link{balancedstratification}}
}
\examples{
# the strata
strata=c(1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3)
# sample size in each stratum
nh=c(2,3,3)
inclusionprobastrata(strata,nh)
}
\keyword{survey}
