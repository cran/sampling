\name{calibev}
\alias{calibev}
\title{Calibration estimator and its variance estimation}
\description{Computes the calibration estimator of the population total and its variance estimation using the residuals' method.
}
\usage{calibev(Ys,Xs,total,pikl,d,g,q=rep(1,length(d)),with=FALSE,EPS=1e-6)}
\arguments{
\item{Ys}{vector of interest variable; its size is n, the sample size.}
\item{Xs}{matrix of sample calibration variables.}
\item{total}{vector of population totals for calibration.}
\item{pikl}{matrix of joint inclusion probabilities of the sample units.}
\item{d}{vector of initial weights of the sample units.}
\item{g}{vector of g-weights; its size is n, the sample size.}
\item{q}{vector of positive values accounting for heteroscedasticity; its size is n, the sample size.}
\item{with}{if TRUE, the variance estimation takes into account the initial weights d; otherwise, the final weights w=g*d are taken
into account; by default, its value is FALSE.}
\item{EPS}{tolerance in checking the calibration; by default, its value is 1e-6.}
}
\value{
The function returns two values:
\item{cest}{the calibration estimator,} 
\item{evar}{its estimated variance.}
}
\details{
If with is TRUE, the following formula is used
\deqn{\widehat{Var}(\widehat{Ys})=\sum_{k\in s}\sum_{\ell\in s}((\pi_{k\ell}-\pi_k\pi_{\ell})/\pi_{k\ell})(d_ke_k)(d_\ell e_\ell)}{\hat{Var}(\hat{Ys})=\sum_{k\in s}\sum_{\ell\in s}((\pi_{k\ell}-\pi_k\pi_{\ell})/\pi_{k\ell})(d_ke_k)(d_\ell e_\ell)}
else 
\deqn{\widehat{Var}(\widehat{Ys})=\sum_{k\in s}\sum_{\ell\in s}((\pi_{k\ell}-\pi_k\pi_{\ell})/\pi_{k\ell})(w_ke_k)(w_\ell e_\ell)}{\hat{Var}(\hat{Ys})=\sum_{k\in s}\sum_{\ell\in s}((\pi_{k\ell}-\pi_k\pi_{\ell})/\pi_{k\ell})(w_ke_k)(w_\ell e_\ell)}
where \eqn{e_k} denotes the residual of unit k.
}
\references{ 
Deville, J.-C. and Särndal, C.-E. (1992). Calibration estimators in survey sampling. \emph{Journal of the American Statistical Association}, 87:376--382.\cr
Deville, J.-C., Särndal, C.-E., and Sautory, O. (1993). Generalized raking procedure in survey sampling. \emph{Journal of the American Statistical Association}, 88:1013--1020.\cr
} 
\seealso{
\code{\link{calib}}
}
\examples{
############
## Example
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of systematic sampling.
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
# selection of a sample of size 200
# using systematic sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPsystematic(pik)         # draws a sample s using systematic sampling    
Xs=X[s==1,]                 # matrix of sample calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))\%*\%X)  
g1=calib(Xs,d=1/piks,total,method="linear") # computes the g-weights
pikl=UPsystematicpi2(pik)   # computes the matrix of joint inclusion probabilities 
pikls=pikl[s==1,s==1]       # the same matrix for the units in the sample
Ys=Tot04[s==1]          # the variable of interest is Tot04 (sample level)
calibev(Ys,Xs,total,pikls,d=1/piks,g1,with=FALSE,EPS=1e-6)
detach(belgianmunicipalities)
}
\keyword{survey}
\encoding{latin1}
