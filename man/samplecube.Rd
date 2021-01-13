\name{samplecube}
\alias{samplecube}
\title{Sample cube method}
\description{
Selects a balanced sample (a vector of 0 and 1) or an almost balanced sample.
Firstly, the flight phase is applied. Next, if needed, the landing phase is applied
on the result of the flight phase.
}
\usage{samplecube(X,pik,order=1,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{pik}{vector of inclusion probabilities.}
\item{order}{ 1, the data are randomly arranged,\cr
 2, no change in data order,\cr
 3, the data are sorted in decreasing order.
}
\item{comment}{a comment is written during the execution if \code{comment} is \code{TRUE}.}
\item{method}{ 1, for a landing phase by linear programming,\cr
2, for a landing phase by suppression of variables.}
}
\seealso{
\code{\link{landingcube}}, \code{\link{fastflightcube}}
}
\references{ 
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.\cr
Chauvet, G. and Tillé, Y. (2006). A fast algorithm of balanced sampling. \emph{Computational Statistics}, 21/1:53--62. \cr
Chauvet, G. and Tillé, Y. (2005). New SAS macros for balanced sampling. In INSEE, editor, \emph{Journées de Méthodologie Statistique}, Paris.\cr
Deville, J.-C. and Tillé, Y. (2004). Efficient balanced sampling: the cube method. \emph{Biometrika}, 91:893--912.\cr
Deville, J.-C. and Tillé, Y. (2005). Variance approximation under balanced sampling. \emph{Journal of Statistical Planning and Inference}, 128/2:411--425. 
} 
\examples{
############
## Example 1
############
# matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1.1,2.2,3.1,4.2,5.1,6.3,7.1,8.1,9.1))
# vector of inclusion probabilities
# the sample size is 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# selection of the sample
s=samplecube(X,pik,order=1,comment=TRUE)
# The selected sample
(1:length(pik))[s==1]
############
## Example 2
############
# 2 strata and 2 auxiliary variables
# we verify the values of the inclusion probabilities by simulations
X=rbind(c(1,0,1,2),c(1,0,2,5),c(1,0,3,7),c(1,0,4,9),
c(1,0,5,1),c(1,0,6,5),c(1,0,7,7),c(1,0,8,6),c(1,0,9,9),
c(1,0,10,3),c(0,1,11,3),c(0,1,12,2),c(0,1,13,3),
c(0,1,14,6),c(0,1,15,8),c(0,1,16,9),c(0,1,17,1),
c(0,1,18,2),c(0,1,19,3),c(0,1,20,4))
pik=rep(1/2,times=20)
ppp=rep(0,times=20)
sim=10 #for accurate results increase this value
for(i in (1:sim))
	ppp=ppp+samplecube(X,pik,1,FALSE) 
ppp=ppp/sim
print(ppp)
print(pik)
############
## Example 3
############
# unequal probability sampling by cube method
# one auxiliary variable equal to the inclusion probability
N=100
pik=runif(N)
pikfin=samplecube(array(pik,c(N,1)),pik,1,TRUE)
############ 
## Example 4
############
# p auxiliary variables generated randomly
N=100
p=7
x=rnorm(N*p,10,3)
# random inclusion probabilities 
pik= runif(N)
X=array(x,c(N,p))
X=cbind(cbind(X,rep(1,times=N)),pik)
pikfin=samplecube(X,pik,1,TRUE)
############ 
## Example 5
############
# strata and an auxiliary variable
N=100
a=rep(1,times=N)
b=rep(0,times=N)
V1=c(a,b,b)
V2=c(b,a,b)
V3=c(b,b,a)
X=cbind(V1,V2,V3)
pik=rep(2/10,times=3*N)
pikfin=samplecube(X,pik,1,TRUE)
############
## Example 6
############
# Selection of a balanced sample using the MU284 population,
# simulation and comparison of the variance with
# unequal probability sampling of fixed sample size.
############
data(MU284)
# Computation of the inclusion probabilities
pik=inclusionprobabilities(MU284$P75,50)
# Definition of the matrix of balancing variables
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84,MU284$REV84)
# Computation of the Horvitz-Thompson estimator for a balanced sample
s=samplecube(X,pik,1,FALSE)
HTestimator(MU284$RMT85[s==1],pik[s==1])
# Computation of the Horvitz-Thompson estimator for an unequal probability sample
s=samplecube(matrix(pik),pik,1,FALSE)
HTestimator(MU284$RMT85[s==1],pik[s==1])
# simulations; for a better accuracy, increase the value of 'sim'
sim=5
res1=rep(0,times=sim)
res2=rep(0,times=sim)
for(i in 1:sim)
{
cat("Simulation number ",i,"\n")
s=samplecube(X,pik,1,FALSE)
res1[i]=HTestimator(MU284$RMT85[s==1],pik[s==1])
s=samplecube(matrix(pik),pik,1,FALSE)
res2[i]=HTestimator(MU284$RMT85[s==1],pik[s==1])
}
# summary and boxplots
summary(res1)
summary(res2)
ss=cbind(res1,res2)
colnames(ss) = c("balanced sampling","uneq prob sampling")
boxplot(data.frame(ss), las=1)
}
\keyword{survey}
\encoding{latin1}


