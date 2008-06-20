\name{landingcube}
\alias{landingcube}
\title{Landing phase for the cube method}
\description{
Landing phase of the cube method using linear programming.
}
\usage{landingcube(X,pikstar,pik,comment=TRUE)}
\arguments{
\item{X}{matrix of auxiliary variables on which the sample must be balanced.}
\item{pikstar}{vector obtained at the end of the flight phase.}
\item{pik}{vector of inclusion probabilities.}
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
\code{\link{samplecube}}, \code{\link{fastflightcube}}
}
\examples{
# matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1.1,2.2,3.1,4.2,5.1,6.3,7.1,8.1,9.1))
# Vector of inclusion probabilities
# The sample has the size equal to 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# pikstar is almost a balanced sample and is ready for the landing phase
pikstar=fastflightcube(X,pik,order=1,comment=TRUE)
# selection of the sample s
s=landingcube(X,pikstar,pik,comment=TRUE)
round(s)
}
\keyword{survey}
\encoding{latin1}

