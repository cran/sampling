\name{srswr}
\alias{srswr}
\title{Simple random sampling with replacement}
\description{
Draws a simple random sampling with replacement of size n (equal probabilities, fixed sample size, with replacement).
}
\usage{
srswr(n,N)
}
\value{
Returns a vector of size N, the population size. Each element k of this vector indicates 
the number of replicates for unit k in the sample.
}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\seealso{\code{\link{UPmultinomial}}
}
\examples{
s=srswr(3,10)
#the selected units are 
(1:10)[s!=0]
#with the number of replicates 
s[s!=0]
}
\keyword{survey}
