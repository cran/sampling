\name{calib}
\alias{calib}
\title{g-weights of the calibration estimator}
\description{Computes the g-weights of the calibration estimator. The g-weights should lie in the specified bounds for the 
truncated and logit methods. 
}
\usage{calib(Xs,d,total,q=rep(1,length(d)),method=c("linear","raking","truncated",
"logit"),bounds=c(low=0,upp=10),description=FALSE,max_iter=500)}
\arguments{
\item{Xs}{matrix of calibration variables.}
\item{d}{vector of initial weights.}
\item{total}{vector of population totals.}
\item{q}{vector of positive values accounting for heteroscedasticity; the variation of the g-weights is reduced for small values of q.}
\item{method}{calibration method (linear, raking, logit, truncated).}
\item{bounds}{vector of bounds for the g-weights used in the truncated and logit methods; 
'low' is the smallest value and 'upp' is the largest value.}
\item{description}{if description=TRUE, summary of initial and final weights are printed, 
and their boxplots and histograms are drawn; by default, its value is FALSE.}
\item{max_iter}{maximum number of iterations in the Newton's method.} 
}
\value{Returns the vector of g-weights.}
\references{ 
Cassel, C.-M., S�rndal, C.-E., and Wretman, J. (1976). Some results on generalized difference estimation and generalized regression estimation for finite population.\emph{Biometrika}, 63:615--620. \cr
Deville, J.-C. and S�rndal, C.-E. (1992). Calibration estimators in survey sampling. \emph{Journal of the American Statistical Association}, 87:376--382.\cr
Deville, J.-C., S�rndal, C.-E., and Sautory, O. (1993). Generalized raking procedure in survey sampling. \emph{Journal of the American Statistical Association}, 88:1013--1020.\cr
} 
\details{The argument \emph{method} implements the methods given in the paper of Deville and S�rndal(1992).}
\seealso{
\code{\link{checkcalibration}}, \code{\link{calibev}}, \code{\link{gencalib}}
}
\examples{
############
## Example 1
############
# matrix of sample calibration variables 
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10)
)
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of population totals
total=c(24,26,290)
# the g-weights using the truncated method
g=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.75,1.2))
# the calibration estimator of X is equal to 'total' vector
t(g/piks)\%*\%Xs
# the g-weights are between lower and upper bounds
range(g)
############
## Example 2
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(
Men03/mean(Men03),
Women03/mean(Women03),
Diffmen,
Diffwom,
TaxableIncome/mean(TaxableIncome),
Totaltaxation/mean(Totaltaxation),
averageincome/mean(averageincome),
medianincome/mean(medianincome))
# selection of a sample with expectation size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # sample matrix of calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # expected sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))\%*\%X)  
# computation of the g-weights
# by means of different calibration methods
g1=calib(Xs,d=1/piks,total,method="linear")
g2=calib(Xs,d=1/piks,total,method="raking")
g3=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.5,1.5))
g4=calib(Xs,d=1/piks,total,method="logit",bounds=c(0.5,1.5))
# in some cases, the calibration is not possible,
# particularly when bounds are used.
# if the calibration is possible, the calibration estimator of X is printed
if(checkcalibration(Xs,d=1/piks,total,g1)$result) 
    print(c((g1/piks) \%*\% Xs)) else print("error")
if(!is.null(g2))
    if(checkcalibration(Xs,d=1/piks,total,g2)$result) 
if(!is.null(g3))
     if(checkcalibration(Xs,d=1/piks,total,g3)$result & all(g3<=1.5) & all(g3>=0.5))
        print(c((g3/piks) \%*\% Xs)) else print("error")
if(!is.null(g4))
    if(checkcalibration(Xs,d=1/piks,total,g4)$result & all(g4<=1.5) & all(g4>=0.5)) 
         print(c((g4/piks) \%*\% Xs)) else print("error")
detach(belgianmunicipalities)
############
## Example 3
############
# Example of calibration and adjustment for nonresponse in the 'calibration' vignette
# vignette("calibration", package="sampling")
}
\keyword{survey}
\encoding{latin1}
