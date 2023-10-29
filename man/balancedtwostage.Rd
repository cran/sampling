\name{balancedtwostage}
\alias{balancedtwostage}
\title{Balanced two-stage sampling}
\description{
Selects a balanced two-stage sample.}
\usage{balancedtwostage(X,selection,m,n,PU,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{selection}{1, for simple random sampling without replacement at each stage,\cr
        2, for self-weighting two-stage selection.}
\item{m}{number of primary sampling units to be selected.}
\item{n}{number of second-stage sampling units to be selected.}
\item{PU}{vector of integers that defines the primary sampling units.}
\item{comment}{a comment is written during the execution if \code{comment} is \code{TRUE}.}
\item{method}{the used method in the function \code{samplecube}.}
}
\value{The function returns a matrix whose columns are the following five vectors:
 the selected second-stage sampling units (0 - unselected, 1 - selected), 
 the final inclusion probabilities,
 the selected primary sampling units,
 the inclusion probabilities of the first stage,
 the inclusion probabilities of the second stage.}
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
# selection of 2 primary sampling units and 4 second-stage sampling units
# sample and inclusion probabilities
s=balancedtwostage(X,1,2,4,PU,comment=TRUE)
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
# sample and inclusion probabilities
s=balancedtwostage(X,1,m,n,PU,TRUE)
s
}
\keyword{survey}
