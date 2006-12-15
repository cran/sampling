\name{writesample}
\alias{writesample}
\title{All possible samples of fixed size}
\description{Give a matrix which contains in its rows the vectors (0 or 1)
of all samples of fixed size.}
\usage{writesample(n,N)}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\seealso{
\code{\link{landingcube}}
}
\examples{
# all samples of size 4
# from a population of size 10.
w=writesample(4,10)
# the samples are
t(apply(w,1,function(x) (1:ncol(w))[x==1]))
}
\keyword{survey}