\name{UPbrewer}
\alias{UPbrewer}
\title{Brewer sampling}
\description{
Uses the Brewer's method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPbrewer(pik,eps=1e-06)
}
\arguments{
\item{pik}{vector of the inclusion probabilities.}
\item{eps}{the control value, by default equal to 1e-06; it is used to
control pik (pik>eps & pik < 1-eps).}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
}
\seealso{\code{\link{UPsystematic}}
}
\references{
Brewer, K. (1975), A simple procedure for $pi$pswor, \emph{Australian Journal of Statistics}, 17:166-172.
}
\examples{
#define the inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPbrewer(pik)
#the sample is
(1:length(pik))[s==1]
}
\keyword{survey}
