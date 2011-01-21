\name{fastflightcube}
\alias{fastflightcube}
\title{Fast flight phase for the cube method}
\description{Executes the fast flight phase 
of the cube method (algorithm of Chauvet and Tillé, 2005, 2006).
The data are sorted following the argument \code{order}. Inclusion probabilities equal to
0 or 1 are tolerated.
}
\usage{fastflightcube(X,pik,order=1,comment=TRUE)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{pik}{vector of inclusion probabilities.}
\item{order}{
1, the data are randomly arranged,\cr
2, no change in data order,\cr
3, the data are sorted in decreasing order.
}
\item{comment}{a comment is written during the execution if \code{comment} is \code{TRUE}.}
}
\references{ 
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.\cr
Chauvet, G. and Tillé, Y. (2006). A fast algorithm of balanced sampling. \emph{Computational Statistics}, 21/1:53--62. \cr
Chauvet, G. and Tillé, Y. (2005). New SAS macros for balanced sampling. In INSEE, editor, \emph{Journées de Méthodologie Statistique}, Paris.\cr
Deville, J.-C. and Tillé, Y. (2004). Efficient balanced sampling: the cube method. \emph{Biometrika}, 91:893--912.\cr
Deville, J.-C. and Tillé, Y. (2005). Variance approximation under balanced sampling. \emph{Journal of Statistical Planning and Inference}, 128/2:411--425. 
} 
\seealso{
\code{\link{samplecube}}
}
\examples{
# Matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1,2,3,4,5,6,7,8,9))
# Vector of inclusion probabilities.
# The sample size is 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# pikstar is almost a balanced sample and is ready for the landing phase
pikstar=fastflightcube(X,pik,order=1,comment=TRUE)
pikstar
}
\keyword{survey}
\encoding{latin1}
