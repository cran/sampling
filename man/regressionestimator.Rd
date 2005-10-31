\name{regressionestimator}
\alias{regressionestimator}
\title{g-weights of the regression estimator}
\description{Compute the g-weights of the regression estimator.}
\usage{regressionestimator(Xs,piks,tot,q=rep(1,times=length(piks)))}
\arguments{
\item{Xs}{matrix of calibration variables.}
\item{piks}{vector of inclusion probabilities.}
\item{tot}{vector of population totals.}
\item{q}{vector of weights for the distance. The variation of the g-weights is reduced for the small values of q. When a component of q is null, the corresponding g-weight remains equal to 1.}
}
\references{ 
Cassel, C.-M., Särndal, C.-E., and Wretman, J. (1976). Some results on generalized difference estimation and generalized regression estimation for finite population.\emph{Biometrika}, 63:615--620. \cr
Deville, J.-C. and Särndal, C.-E. (1992). Calibration estimators in survey sampling. \emph{Journal of the American Statistical Association}, 87:376--382.\cr
Deville, J.-C., Särndal, C.-E., and Sautory, O. (1993). Generalized raking procedure in survey sampling. \emph{Journal of the American Statistical Association}, 88:1013--1020.\cr
} 
\seealso{
\code{\link{rakingratio}}, \code{\link{boundedrakingratio}}, \code{\link{boundedregressionestimator}}, \code{\link{checkcalibration}}
}
\examples{
############
## Example 1
############
# matrix of auxiliary variables
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of totals
t=c(24,26,280)
# the Horvitz-Thompson estimator
tHT=t(1/piks)\%*\%Xs
# the g-weights
g=regressionestimator(Xs,piks,t)
# the calibrated estimator is equal to t
tcal=t(g/piks)\%*\%Xs
############
## Example 2
############
# Example of rakingratio, regresssion, boundedregression and boundedrakingratio estimators,
# with the data of Belgian municipalities.
# Firstly, a sample is selected by means of a Poisson sampling.
# Next, the g-weights and the calibrated estimators are calculated.
# the database of Belgian municipalities
data(belgianmunicipalities)
attach(belgianmunicipalities)
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
# by means of inclusion probabilities proportional to the 
# average income by means of a Poisson sampling
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # matrix of calibration variables of the sample
piks=pik[s==1]              # inclusion probabilities of the sample
n=length(piks)              # sample size
# vector of population totals of the auxiliary variables
t=c(t(rep(1,times=N))\%*\%X)  
# The Horvitz-Thompson estimators of auxiliary variables 
c((1/piks) \%*\% Xs)
# The true total 
t
# Computation of the g-weights
# by means of the methods of calibration.
g1=regressionestimator(Xs,piks,t)
g2=rakingratio(Xs,piks,t)
g3=boundedregressionestimator(Xs,piks,t,LOW=0.5,UP=1.5)
g4=boundedrakingratio(Xs,piks,t,LOW=0.5,UP=1.5)
# In some cases, the calibration does not exist
# particularly when bounds are used.
# If they exist the calibration estimators are the following.
if(checkcalibration(Xs,piks,t,g1)) c((g1/piks) \%*\% Xs) else print("error")
if(checkcalibration(Xs,piks,t,g2)) c((g2/piks) \%*\% Xs) else print("error")
if(checkcalibration(Xs,piks,t,g3)) c((g3/piks) \%*\% Xs) else print("error")
if(checkcalibration(Xs,piks,t,g4)) c((g4/piks) \%*\% Xs) else print("error")
############
## Example 3
############
# Computation of the ratio estimator as 
# a particular case of the regression estimator.
# The q-weights must be the inverse of the calibration variable.
############
data(belgianmunicipalities)
attach(belgianmunicipalities)
pik=inclusionprobabilities(averageincome,200)
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # matrix of calibration variables of the sample
piks=pik[s==1]              # inclusion probabilities of the sample
# The Horvitz-Thompson estimator
sum(TaxableIncome[s==1]/piks)
# The ratio estimator
sum(Tot04)*sum(TaxableIncome[s==1]/piks)/sum(Tot04[s==1]/piks)
# The ratio estimator as a particular case of the regression estimator
g=regressionestimator(Tot04[s==1],piks,sum(Tot04),q=1/Tot04[s==1])
sum(g*TaxableIncome[s==1]/piks)
}
\keyword{survey}
\encoding{latin1}

