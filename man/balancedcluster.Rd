\name{balancedcluster}
\alias{balancedcluster}
\title{Balanced cluster}
\description{
Select a balanced sample of clusters and
return a matrix that contains the vector of inclusion probabilities and
                      the selected sample.
}
\usage{balancedcluster(X,m,cluster,selection=1,comment=TRUE,method=1)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{m}{number of clusters to be selected.}
\item{cluster}{vector of integers that defines the clusters.}
\item{selection}{1, selection of the clusters with unequal probabilities proportional 
 to the size,\cr 2, selection of the clusters with equal probabilities.}
\item{comment}{a comment is written during the execution if \code{comment} is equal to \code{TRUE}.}
\item{method}{the used method in the function samplecube.}
}
\seealso{
\code{\link{samplecube}}, \code{\link{fastflightcube}}, \code{\link{landingcube}}
}
\examples{
############
## Example 1
############
# definition of the clusters (3 clusters)
cluster=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# Matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# Selection of 2 clusters
s=balancedcluster(X,2,cluster,2,TRUE)
# The sample of clusters with the inclusion probabilities of the clusters
s
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
b=balancedcluster(X,10,MU284$CL,1,TRUE)
b
}
\keyword{survey}
