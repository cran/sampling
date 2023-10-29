\name{regest}
\alias{regest}
\title{Regression estimator}
\description{Computes the regression estimator of the population total, using the 
design-based approach. The underling regression model is a model without intercept.}
\usage{regest(formula,Tx,weights,pikl,n,sigma=rep(1,length(weights)))}
\arguments{
\item{formula}{regression model formula (y~x).}
\item{Tx}{population total of x, the auxiliary variable.}
\item{weights}{vector of the weights; its length is equal to n, the sample size.}
\item{pikl}{matrix of joint inclusion probabilities for the sample.}
\item{n}{the sample size.}
\item{sigma}{vector of positive values accounting for heteroscedasticity.}
}
\value{The function returns a list with following components: 
\item{regest}{value of the regression estimator.}
\item{coefficients}{vector of estimated beta coefficients.}
\item{std_error}{estimated standard error of the estimated coefficients.}
\item{t_value}{t-values associated to the coefficients.}
\item{p_value}{p-values associated to the coefficients.}
\item{cov_mat}{covariance matrix of the estimated coefficients.}
\item{weights}{specified weights.}
\item{y}{response variable.}
\item{x}{model matrix.}
}
\seealso{
\code{\link{ratioest}},\code{\link{regest_strata}}
}
\examples{
# uses the MU284 population to draw a systematic sample
data(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[MU284$RMT85<=3000,]
attach(MU281)
# computes the inclusion probabilities using the variable P85; sample size 40
pik=inclusionprobabilities(P85,40)
# joint inclusion probabilities for systematic sampling
pikl=UPsystematicpi2(pik)
# draws a systematic sample of size 40
s=UPsystematic(pik)
# defines the variable of interest for the selected sample
y=RMT85[s==1]
# defines the auxiliary information for the selected sample
x1=CS82[s==1]
x2=SS82[s==1]
# joint inclusion probabilities for the selected sample
pikls=pikl[s==1,s==1]
# first-order inclusion probabilities for the selected sample
piks=pik[s==1]
# computes the regression estimator with the model y~x1+x2-1 
r=regest(formula=y~x1+x2-1,Tx=c(sum(CS82),sum(SS82)),weights=1/piks,pikl=pikls,n=40)
# the regression estimator
r$regest
# the estimated beta coefficients 
r$coefficients
# the regression estimator is the same as the calibration estimator (method="linear") 
Xs=cbind(x1,x2)
total=c(sum(CS82),sum(SS82))
g1=calib(Xs,d=1/piks,total,method="linear")
checkcalibration(Xs,d=1/piks,total,g1)
calibev(y,Xs,total,pikls,d=1/piks,g1,with=TRUE,EPS=1e-6)
detach(MU281)
}
\keyword{survey}
