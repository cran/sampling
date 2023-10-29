\name{writesample}
\alias{writesample}
\title{All possible samples of fixed size}
\description{Gives a matrix whose rows are the vectors (with 0 and 1; 1 - a unit is selected, 0 - otherwise)
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
# from a population of size 10
w=writesample(4,10)
# the samples are (read by rows)
t(apply(w,1,function(x) (1:ncol(w))[x==1]))
}
\keyword{survey}