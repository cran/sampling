\name{gencalib}
\alias{gencalib}
\title{g-weights of the generalized calibration estimator}
\description{Computes the g-weights of the generalized calibration estimator. The g-weights should lie in the specified bounds for the 
truncated and logit methods. 
}
\usage{gencalib(Xs,Zs,d,total,q=rep(1,length(d)),method=c("linear","raking","truncated","logit"),
bounds=c(low=0,upp=10),description=FALSE,max_iter=500,C=1)}
\arguments{
\item{Xs}{matrix of calibration variables.}
\item{Zs}{matrix of instrumental variables with same dimension as Xs.}
\item{d}{vector of initial weights.}
\item{total}{vector of population totals.}
\item{q}{vector of positive values accounting for heteroscedasticity; the variation of the g-weights is reduced for small values of q.}
\item{method}{calibration method (linear, raking, logit, truncated).}
\item{bounds}{vector of bounds for the g-weights used in the truncated and logit methods; 
'low' is the smallest value and 'upp' is the largest value.}
\item{description}{if description=TRUE, summary of initial and final weights are printed, 
and their boxplots and histograms are drawn; by default, its value is FALSE.}
\item{max_iter}{maximum number of iterations in the Newton's method.} 
\item{C}{value of the centering constant, by default equals 1.}
}
\value{The function returns the vector of g-weights.}
\details{
The generalized calibration or the instrument vector method computes the g-weights 
\eqn{g_k=F(\lambda'z_k),} where \eqn{z_k} is a vector with values defined for \eqn{k\in s} (or \eqn{k\in r} where \eqn{r} is the set of respondents) and sharing the dimension of the specified auxiliary vector 
\eqn{x_k}. The vectors \eqn{z_k} and \eqn{x_k} have to be stronlgy correlated. The vector \eqn{\lambda} is determined from the calibration equation \eqn{\sum_{k\in s} d_kg_k x_k=\sum_{k\in U} x_k} or \eqn{\sum_{k\in r} d_kg_k x_k=\sum_{k\in U} x_k}. 
The function \eqn{F} plays the same role as in the calibration method (see \code{\link{calib}}). If Xs=Zs the calibration method is obtain. If the method is "logit"
the g-weights will be centered around the constant C, with low<C<upp. In the calibration method C=1 (see \code{\link{calib}}). 
}
\references{ 
Deville, J.-C. (1998). La correction de la nonréponse par calage ou par échantillonnage équilibré. Paper presented at the \emph{Congrès de l'ACFAS, Sherbrooke, Québec}.\cr
Deville, J.-C. (2000). Generalized calibration and application for weighting for non-response, \emph{COMPSTAT 2000: proceedings in computational statistics}, p. 65--76.\cr
Estevao, V.M., and Särndal, C.E. (2000). A functional form approach to calibration. \emph{Journal of Official Statistics}, 16, 379--399.\cr
Kott, P.S. (2006). Using calibration weighting to adjust for nonresponse and coverage errors. \emph{Survey Methodology}, 32, 133--142.\cr
} 
\seealso{
\code{\link{checkcalibration}}, \code{\link{calib}}
}
\examples{
############
## Example 1
############
# matrix of sample calibration variables 
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of population totals
total=c(24,26,290)
# matrix of instrumental variables
Zs=Xs+matrix(runif(nrow(Xs)*ncol(Xs)),nrow(Xs),ncol(Xs))
# the g-weights using the truncated method
g=gencalib(Xs,Zs,d=1/piks,total,method="truncated",bounds=c(0.5,1.5))
# the calibration estimator of X is equal to the 'total' vector
t(g/piks)\%*\%Xs
# the g-weights are between lower and upper bounds
summary(g)
############
## Example 2
############
# Example of generalized g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(Totaltaxation/mean(Totaltaxation),medianincome/mean(medianincome))
# selection of a sample with expected size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # sample calibration variable matrix 
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))\%*\%X)  
# the population total
total
Z=cbind(TaxableIncome/mean(TaxableIncome),averageincome/mean(averageincome))
# defines the instrumental variables
Zs=Z[s==1,]
# computation of the generalized g-weights
# by means of different generalized calibration methods
g1=gencalib(Xs,Zs,d=1/piks,total,method="linear")
g2=gencalib(Xs,Zs,d=1/piks,total,method="raking")
g3=gencalib(Xs,Zs,d=1/piks,total,method="truncated",bounds=c(0.5,8))
g4=gencalib(Xs,Zs,d=1/piks,total,method="logit",bounds=c(0.5,1.5))
# In some cases, the calibration does not exist
# particularly when bounds are used.
# if the calibration is possible, the calibration estimator of Xs is printed
if(checkcalibration(Xs,d=1/piks,total,g1)$result) print(c((g1/piks)\%*\% Xs)) else print("error")
if(!is.null(g2))
if(checkcalibration(Xs,d=1/piks,total,g2)$result) print(c((g2/piks)\%*\% Xs)) else print("error")
if(!is.null(g3))
if(checkcalibration(Xs,d=1/piks,total,g3)$result) print(c((g3/piks)\%*\% Xs)) else print("error")
if(!is.null(g4))
if(checkcalibration(Xs,d=1/piks,total,g4)$result) print(c((g4/piks)\%*\% Xs)) else print("error")
############
## Example 3
############
# Example of generalized calibration and adjustment for unit nonresponse in the 'calibration' vignette
vignette("calibration", package="sampling")
}