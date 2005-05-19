\name{cleanstrata}
\alias{cleanstrata}
\title{ Clean strata}
\description{Renumber a variable of stratification
 (qualitative variable). The strata receive a number from 1 to the last stratum. 
The empty strata are suppressed. This function is used in 'balancedstratification'.
}
}
\usage{
cleanstrata(st)
}
\arguments{
  \item{st}{vector with the numbers of the strata.}
}
\seealso{\code{\link{balancedstratification}}}
\examples{
# definition of the stratification variable
strat=c(-2,3,-2,3,4,4,4,-2,-2,3,4,0,0,0)
# renumber the strata
cleanstrata(strat)
}
\keyword{survey}