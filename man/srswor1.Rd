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
Return a vector (with elements 0 and 1) of size N, where N is the population size.  
Each element k of this vector indicates the status of the unit k 
(1, the unit k is selected in the sample; 0, otherwise).
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
s=srswor1(3,10)
#the sample is
(1:10)[s==1]
}
\keyword{survey}
