\name{inclusionprobastrata}
\alias{inclusionprobastrata}
\title{Strata inclusion probabilities}
\description{Return a vector of the inclusion probabilities for a stratified design. 
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
strat=c(1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3)
# size of the sample in the strata.
nh=c(2,3,3)
inclusionprobastrata(strat,nh)
}
\keyword{survey}
