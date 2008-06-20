\name{inclusionprobastrata}
\alias{inclusionprobastrata}
\title{Inclusion probabilities for strata}
\description{Computes the inclusion probabilities for a stratified design. 
The inclusion probabilities are equal in each stratum.}
\usage{inclusionprobastrata(strata,nh)}
\arguments{
\item{strata}{vector that defines the strata.}
\item{nh}{vector with the number of units to be selected in each stratum.}
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
