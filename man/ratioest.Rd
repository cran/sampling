\name{ratioest}
\alias{ratioest}
\title{The ratio estimator}
\description{Computes the ratio estimator of the population total.}
\usage{ratioest(y,x,Tx,pik)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{x}{vector of auxiliary information; its length is equal to n, the sample size.}
\item{Tx}{population total of x.}
\item{pik}{vector of the first-order inclusion probabilities; its length is equal to n, the sample size.}
}
\value{The function returns the value of the ratio estimator.}
\seealso{
\code{\link{regest}}
}
\examples{
data(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[MU284$RMT85<=3000,]
attach(MU281)
# computes the inclusion probabilities using the variable P85; sample size 120
pik=inclusionprobabilities(P85,120)
# defines the variable of interest
y=RMT85
# defines the auxiliary information
x=CS82
# draws a systematic sample of size 120
s=UPsystematic(pik)
# computes the ratio estimator
ratioest(y[s==1],x[s==1],sum(x),pik[s==1])
}
\keyword{survey}