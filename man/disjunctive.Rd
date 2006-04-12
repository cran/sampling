\name{disjunctive}
\alias{disjunctive}
\title{Disjunctive combination}
\description{
Transform a categorical variable
 into a matrix of indicators. The values of the categorical variable must be integer
 (positive or negative).
}
\usage{disjunctive(strata)}
\arguments{
\item{strata}{vector of integer numbers.}
}
\seealso{\code{
\link{balancedstratification}}
}
\examples{
# definition of the variable of stratification
strata=c(-2,3,-2,3,4,4,4,-2,-2,3,4,0,0,0)
# computation of the matrix
disjunctive(strata)
}
\keyword{survey}
