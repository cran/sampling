\name{srswor}
\alias{srswor}
\title{Simple random sampling without replacement}
\description{
Draws a simple random sampling without replacement of size n (equal probabilities, fixed sample size, without replacement).
}
\usage{
srswor(n,N)
}
\arguments{
\item{n}{sample size.}
\item{N}{population size.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
}
\seealso{\code{\link{srswr}}}
\examples{
############
## Example 1
############
#select a sample
s=srswor(3,10)
#the sample is
(1:10)[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
#select a sample
s=srswor(n,length(Tot))  
#the sample is 
as.vector(name[s==1])
}
\keyword{survey}
