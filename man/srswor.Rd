\name{srswor}
\alias{srswor}
\title{Simple random sampling without replacement}
\description{
Draw a simple random sampling without replacement of size n.
}
\usage{
srswor(n,N)
}
\details{
Return a vector (0 and 1) of size N which is the population size. 
}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\seealso{\code{\link{sample}}, \code{\link{srswr}}}
\examples{
############
## Example 1
############
#select a sample
srswor(3,10)
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
#select a sample
s=srswor(n,length(Tot))  
as.vector(name[s==1])
}
\keyword{survey}
