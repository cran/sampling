\name{UPopips}
\alias{UPopips}
\title{Order $\pi$ps sampling}
\description{
Implements order $\pi$ps sampling (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPopips(lambda,type=c("pareto","uniform","exponential"))
}
\arguments{
\item{lambda}{vector of working inclusion probabilities or target ones.}
\item{type}{the type of order sampling (pareto, uniform, exponential).}
}
\details{
Returns a vector of selected units of size n, the sample size.  
}
\seealso{\code{\link{inclusionprobabilities}}
}
\references{
Ros\'en, B. (1997), Asymptotic theory for order sampling, \emph{Journal of Statistical Planning and Inference}, 
62:135-158.\cr
Ros\'en, B. (1997), On sampling with probability proportional to size, \emph{Journal of Statistical Planning and Inference}, 
62:159-191.\cr
}
\examples{
#define the working inclusion probabilities
lambda=c(0.2,0.7,0.8,0.5,0.4,0.4)
#draw a Pareto sample
s=UPopips(lambda, type="pareto")
#the sample is
s
}
\keyword{survey}



