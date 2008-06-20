\name{regest}
\alias{regest}
\title{The regression estimator}
\description{Computes the regression estimator of the population total, using the 
design-based approach.}
\usage{regest(formula,Tx,weights,pikl,n,sigma=rep(1,length(weights)))}
\arguments{
\item{formula}{the regression model formula (y~x).}
\item{Tx}{population total of x, the auxiliary variable.}
\item{weights}{vector of the weights; its length is equal to n, the sample size.}
\item{pikl}{the matrix of joint inclusion probabilities for the sample.}
\item{n}{the sample size.}
\item{sigma}{vector of positive values accounting for heteroscedasticity.}
}
\value{The function returns an object, which is a list containing 
the following components: 
\item{regest}{the value of the regression estimator.}
\item{coefficients}{a vector of beta coefficients.}
\item{std_error}{the standard error of coefficients.}
\item{t\_value}{the t-values associated to the coefficients.}
\item{p\_value}{the p-values associated to the coefficients.}
\item{cov_mat}{the covariance matrix of the coefficients.}
\item{weights}{the specified weights.}
\item{y}{the response variable.}
\item{x}{the model matrix.}
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
# the joint inclusion probabilities for systematic sampling
pikl=UPsystematicpi2(pik)
# draws a systematic sample of size 40
s=UPsystematic(pik)
# defines the variable of interest
y=RMT85[s==1]
# defines the auxiliary information
x1=CS82[s==1]
x2=SS82[s==1]
# the joint inclusion probabilities for s
pikls=pikl[s==1,s==1]
# the first-order inclusion probabilities for s
piks=pik[s==1]
# computes the regression estimator with the model y~x1+x2-1 
r=regest(formula=y~x1+x2-1,Tx=c(sum(CS82),sum(SS82)),weights=1/piks,pikl=pikls,n=40)
# the regression estimator is
r$regest
# the beta coefficients are
r$coefficients
# regression estimator is the same as the calibration estimator 
Xs=cbind(x1,x2)
total=c(sum(CS82),sum(SS82))
g1=calib(Xs,d=1/piks,total,method="linear")
checkcalibration(Xs,d=1/piks,total,g1)
calibev(y,Xs,total,pikls,d=1/piks,g1,with=TRUE,EPS=1e-6)
}
\keyword{survey}