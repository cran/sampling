\name{writesample}
\alias{writesample}
\title{All possible samples of fixed size}
\description{Give a matrix which contains in its rows the vectors (0 or 1)
of all the samples of fixed size.}
\usage{writesample(n,N)}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\seealso{
\code{\link{landingcube}}
}
\examples{
# matrix with the samples of size 4
# from a population of size 10.
writesample(4,10)
}
\keyword{survey}