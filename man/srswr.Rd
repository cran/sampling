\name{srswr}
\alias{srswr}
\title{Simple random sampling with replacement}
\description{
Draw a simple random sampling with replacement of size n.
}
\usage{
srswr(n,N)
}
\details{
Return a vector (0 and 1) of size N which is the population size. 
}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\seealso{\code{\link{rmultinom}}, \code{\link{UPmultinomial}}
}
\examples{
srswr(3,10)
}
\keyword{survey}
