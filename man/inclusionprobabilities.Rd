\name{inclusionprobabilities}
\alias{inclusionprobabilities}
\title{Inclusion probabilities}
\description{Compute and return a vector
of the first order inclusion probabilities from a vector of positive numbers.
}
\usage{inclusionprobabilities(a,n)}
\arguments{
\item{a}{vector of positive numbers.}
\item{n}{sample size.}
}
\seealso{
\code{\link{inclusionprobastrata}}
}
\examples{
############
## Example 1
############
# a vector of positive numbers
a<-1:20
# computation of the inclusion probabilities for a sample size n=12
pik=inclusionprobabilities(a,12)
pik
############
## Example 2
############
# Computation of the inclusion probabilities proportional to the number 
# of inhabitants in each municipality of the Belgian database.
data(belgianmunicipalities)
pik=inclusionprobabilities(belgianmunicipalities$Tot04,200)
data.frame(pik=pik,name=belgianmunicipalities$Commune)
sum(pik)
}
\keyword{survey}
