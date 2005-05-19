\name{balancedtwostage}
\alias{balancedtwostage}
\title{Balanced two stage sampling}
\description{
Select a balanced two-stage sample.
The function returns a matrix which contains 5 vectors:
 the selected units (0 or 1), 
 the final inclusion probabilities,
 the selected units after the first stage,
 the inclusion probabilities of the first stage,
 the inclusion probabilities of the second stage.
}
\usage{balancedtwostage(X,selection,m,n,PU,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{m}{number of primary units to be selected.}
\item{n}{number of secondary units to be selected.}
\item{PU}{vector of integers that defines the primary units.}
\item{selection}{1, for simple random sampling at each stage,\cr
        2, for selfweighted two-stage sampling.}
\item{comment}{a comment is written during the execution if \code{comment} is equal to \code{TRUE}.}
\item{method}{the used method in the procedure samplecube.}
}
\seealso{
\code{\link{samplecube}}, \code{\link{fastflightcube}}, \code{\link{landingcube}},
\code{\link{balancedstratification}}, \code{\link{balancedcluster}}
}
\examples{
############
## Example 1
############
# definition of the primary units (3 primary units)
PU=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# Selection of 2 clusters
s=balancedtwostage(X,1,2,4,PU,comment=TRUE)
# The sample of clusters and the inclusion probabilities
s
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$ME84)
N=dim(X)[1]
PU=MU284$CL
m=20
n=60
res=balancedtwostage(X,1,m,n,PU,TRUE)
res
}
\keyword{survey}
