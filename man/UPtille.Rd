\name{UPtille}
\alias{UPtille}
\title{Tillé sampling}
\description{
Use Tillé method to select a sample of units (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPtille(pik,eps=0.000005)
}
\arguments{
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{the control value, by default equal to 0.000005.}
}
\details{
Return a vector (0 and 1) of size N, where N is the population size. The value eps is used to
control pik (pik>eps & pik < 1-eps).
}
\seealso{\code{\link{UPsystematic}}
}
\references{
Tillé, Y. (1996), An elimination procedure of unequal probability sampling without
replacement, \emph{Biometrika}, 83:238-241.\cr
Deville, J.-C. and Tillé, Y. (1998), 
Unequal probability sampling without replacement through a splitting method, 
\emph{Biometrika}, 85:89-101.
}
\examples{
############
## Example 1
############
#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
UPtille(pik)
############
## Example 2
############
# Selection of samples of municipalities       
# with equal or unequal probabilities.         
# Comparison of the accuracy by a boxplot.                                                 
b=data(belgianmunicipalities)
pik=inclusionprobabilities(belgianmunicipalities$Tot04,200)
N=length(pik)
n=sum(pik)
sim=10
ss=array(0,c(sim,9))
# the interest variable
y=belgianmunicipalities$TaxableIncome
# simulation and computation of the Horvitz-Thompson estimator
for(i in 1:sim)
{
cat("Step ",i,"\n")
ss[i,]=ss[i,]+c(
c(crossprod(y,UPpoisson(pik)/pik)),
c(crossprod(y,UPrandomsystematic(pik)/pik)),
c(crossprod(y,UPrandompivotal(pik)/pik)),
c(crossprod(y,UPtille(pik)/pik)),
c(crossprod(y,UPmidzuno(pik)/pik)),
c(crossprod(y,UPsystematic(pik)/pik)),
c(crossprod(y,UPpivotal(pik)/pik)),
c(crossprod(y,UPmultinomial(pik)/pik)) ,
c(crossprod(y,srswor(n,N)*N/n)))
}
# boxplot of the estimators
colnames(ss) <- 
c("poisson","rsyst","rpivotal","tille","midzuno","syst","pivotal","multinom","srswor")
boxplot(data.frame(ss), las=3)
# The results  of the simulations can be interpreted.
# Simple random sampling, multinomial sampling, 
#  and Poisson sampling are not accurate.
# All the methods of unequal probability sampling seem
# to have the same accuracy, except systematic sampling and pivotal sampling
# that have variances which depend on the order of the file.
}
\keyword{survey}
\encoding{latin1}

