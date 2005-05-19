\name{srswor1}
\alias{srswor1}
\title{Selection-rejection method}
\description{
Draw a simple random sampling without replacement of size n, using the selection-rejection method.
}
\usage{
srswor1(n,N)
}
\details{
Return a vector (0 and 1) of size N which is the population size. 
}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\references{Fan, C.T., Muller, M.E., Rezucha, I. (1962), Development of sampling plans by using sequential (item by item)
selection techniques and digital computer, \emph{Journal of the American Statistical Association}, 57, 387-402.
}
\seealso{\code{\link{srswor}}}
\examples{
srswor1(3,10)
}
\keyword{survey}
