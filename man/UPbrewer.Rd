\name{UPbrewer}
\alias{UPbrewer}
\title{Brewer sampling}
\description{
Use Brewer method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPbrewer(pik,eps=5e-06)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{the control value, by default equal to 5e-06.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size.  The value eps is used to
control pik (pik>eps & pik < 1-eps). 
}
\seealso{\code{\link{UPsystematic}}
}
\references{
Brewer, K. (1963), A model of systematic sampling with unequal probabilities, \emph{Australian Journal of Statistics}, 5:5-13.\cr
Brewer, K. (1975), A simple procedure for $\pi$pswor, \emph 
{Australian Journal of Statistics}, 17:166-172.
}
\examples{
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPbrewer(pik)
}
\keyword{survey}
