\name{balancedstratification}
\alias{balancedstratification}
\title{Balanced stratification}
\description{
Selects a stratified balanced sample (a vector of 0 and 1).
Firstly, the flight phase is applied in each stratum. Secondly, the strata
are aggregated and the flight phase is applied on the whole population.
Finally, the landing phase is applied on the whole population.
}
\usage{balancedstratification(X,strata,pik,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{strata}{vector of integers that specifies the stratification.}
\item{pik}{vector of inclusion probabilities.}
\item{comment}{a comment is written during the execution if \code{comment} is \code{TRUE}.}
\item{method}{the used method in the function \code{samplecube}.}
}
\references{ 
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.\cr
Chauvet, G. and Tillé, Y. (2006). A fast algorithm of balanced sampling. \emph{Computational Statistics}, 21/1:53--62. \cr
Chauvet, G. and Tillé, Y. (2005). New SAS macros for balanced sampling. In INSEE, editor, \emph{Journées de Méthodologie Statistique}, Paris.\cr
Deville, J.-C. and Tillé, Y. (2004). Efficient balanced sampling: the cube method. \emph{Biometrika}, 91:893--912.\cr
Deville, J.-C. and Tillé, Y. (2005). Variance approximation under balanced sampling. \emph{Journal of Statistical Planning and Inference}, 128/2:411--425. 
} 
\seealso{
\code{\link{samplecube}}, \code{\link{fastflightcube}}, \code{\link{landingcube}}
}
\examples{
############
## Example 1
############
# variable of stratification (3 strata)
strata=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# Vector of inclusion probabilities.
# the sample has its size equal to 9.
pik=rep(3/5,times=15)
# selection of a stratified sample
s=balancedstratification(X,strata,pik,comment=TRUE)
# the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
strata=MU284$REG
pik=inclusionprobabilities(MU284$P75,80)
s=balancedstratification(X,strata,pik,TRUE)
#the selected units are
MU284$LABEL[s==1]
}
\keyword{survey}
\encoding{latin1}

