\name{checkcalibration}
\alias{checkcalibration}
\title{Check calibration}
\description{Check the validity of the calibration. In some cases, the regression or the raking ratio estimators
do not exist, and the g-weights do not allow calibration. The function returns \code{TRUE} or \code{FALSE}.}
\usage{checkcalibration(Xs,piks,t,g)}
\arguments{
\item{Xs}{matrix of calibration variables.}
\item{piks}{vector of inclusion probabilities.}
\item{t}{vector of population totals.}
\item{g}{vector of g-weights.}
}
\seealso{
\code{\link{regressionestimator}}, \code{\link{rakingratio}},
\code{\link{boundedrakingratio}}, \code{\link{boundedregressionestimator}}
}
\examples{
# matrix of auxiliary variables
Xs=cbind(c(1,1,1,1,1,0,0,0,0,0),c(0,0,0,0,0,1,1,1,1,1),c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of totals
t=c(24,26,280)
# the Horvitz-Thompson estimator
tHT=t(1/piks)\%*\%Xs
# the g-weights
g=rakingratio(Xs,piks,t)
# the calibrated estimator is equal to t
checkcalibration(Xs,piks,t,g)
# with this vector of totals
# calibration is impossible
t=c(24,26,1000)
g=rakingratio(Xs,piks,t)
checkcalibration(Xs,piks,t,g)
}
\keyword{survey}
