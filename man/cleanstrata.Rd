\name{cleanstrata}
\alias{cleanstrata}
\title{ Clean strata}
\description{Renumbers a variable of stratification
(categorical variable). The strata receive a number from 1 to the last stratum number. 
The empty strata are suppressed. This function is used in `balancedstratification'.
}
\usage{
cleanstrata(strata)
}
\arguments{
  \item{strata}{vector of stratum numbers.}
}
\seealso{\code{\link{balancedstratification}}}
\examples{
# definition of the stratification variable
strata=c(-2,3,-2,3,4,4,4,-2,-2,3,4,0,0,0)
# renumber the strata
cleanstrata(strata)
}
\keyword{survey}
