\name{checkcalibration}
\alias{checkcalibration}
\title{Check calibration}
\description{Checks the validity of the calibration. In some cases, the calibration estimators
do not exist, and the g-weights do not allow calibration.} 
\value{
\item{}{The function returns three objects:} 
\item{message}{a message concerning the calibration,}
\item{result}{TRUE if the calibration is possible and FALSE, otherwise.}
\item{value}{value of max(abs(tr-total)/total, which is used as criterium to validate the 
calibration, where tr=crossprod(Xs, g*d).}
}
\usage{checkcalibration(Xs, d, total, g, EPS=1e-6)}
\arguments{
\item{Xs}{matrix of calibration variables.}
\item{d}{vector of initial weights.}
\item{total}{vector of population totals.}
\item{g}{vector of g-weights.}
\item{EPS}{the control value used to verify the calibration, by default equal to 1e-6.}
}
\details{In the case where calibration is not possible, the 'value' indicates the difference
in obtaining the calibration.}
\seealso{
\code{\link{calib}} 
}
\examples{
# matrix of auxiliary variables
Xs=cbind(c(1,1,1,1,1,0,0,0,0,0),c(0,0,0,0,0,1,1,1,1,1),c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
pik=rep(0.2,times=10)
# vector of totals
total=c(24,26,280)
# the g-weights
g=calib(Xs,d=1/pik,total,method="raking")
# the calibration is possible
checkcalibration(Xs,d=1/pik,total,g)
}
\keyword{survey}
