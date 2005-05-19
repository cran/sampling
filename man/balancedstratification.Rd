\name{balancedstratification}
\alias{balancedstratification}
\title{Balanced stratification}
\description{
Select a stratified balanced sample (a vector of 0 and 1).
Firstly, the flight phase is applied in each stratum. Secondly, the strata
are aggregated and the flight phase is applied on the whole population.
Finally, the landing phase is applied on the whole population.
}
\usage{balancedstratification(X,strat,pik,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{strat}{vector of integers that specifies the stratification.}
\item{pik}{vector of inclusion probabilities.}
\item{comment}{a comment is written during the execution if \code{comment} is equal to \code{TRUE}.}
\item{method}{the used method in the procedure samplecube.}
}
\references{ 
Chauvet, G. and Tillé, Y. (2004). A fast algorithm of balanced sampling. \emph{Submitted for publication}. \cr
Chauvet, G. and Tillé, Y. (2005). New SAS macros for balanced sampling. In INSEE, editor, \emph{Journées de Méthodologie Statistique}, Paris.\cr
Deville, J.-C. and Tillé, Y. (2004). Efficient balanced sampling: the cube method. \emph{Biometrika}, 91, 893-912.\cr
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
strat=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# Vector of inclusion probabilities.
# The sample has a size equal to 9.
pik=rep(3/5,times=15)
# Selection of the stratified sample
s=balancedstratification(X,strat,pik,comment=TRUE)
# The sample
s
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
strat=MU284$REG
pik=inclusionprobabilities(MU284$P75,80)
s=balancedstratification(X,strat,pik,TRUE)
############
## Example 3
############
data(swissmunicipalities)
swiss=swissmunicipalities
X=cbind(swiss$HApoly,
        swiss$Surfacesbois,
        swiss$P00BMTOT,
        swiss$P00BWTOT,
        swiss$POPTOT,
        swiss$Pop020,
        swiss$Pop2040,
        swiss$Pop4065,
        swiss$Pop65P,
        swiss$H00PTOT )
pik=inclusionprobabilities(swiss$POPTOT,400)
sample=balancedstratification(X,swiss$REG,pik,comment=TRUE)
as.character(swiss$Nom[sample==1])
}
\keyword{survey}
\encoding{latin1}

