\name{UPopips}
\alias{UPopips}
\title{Order pips sampling}
\description{
Implements order \eqn{\pi ps} sampling (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPopips(lambda,type=c("pareto","uniform","exponential"),eps=1e-6)
}
\arguments{
\item{lambda}{vector of working inclusion probabilities or target ones.}
\item{type}{the type of order sampling (pareto, uniform, exponential).}
\item{eps}{control value, by default equal to 1e-6.}
}
\value{
Returns a vector (with elements 0 and 1) of size N, the population size.  
Each element k of this vector indicates the status of unit k 
(1, unit k is selected in the sample; 0, otherwise).
The value eps is used to control lambda (lambda>eps & lambda < 1-eps).
}
\references{
Rosén, B. (1997), Asymptotic theory for order sampling, \emph{Journal of Statistical Planning and Inference}, 
62:135-158.\cr
Rosén, B. (1997), On sampling with probability proportional to size, \emph{Journal of Statistical Planning and Inference}, 
62:159-191.\cr
}
\examples{
#define the working inclusion probabilities
lambda<-c(0.2,0.7,0.8,0.5,0.4,0.4)
#draw a Pareto sample
s<-UPopips(lambda, type="pareto")
#the sample is
which(s==1)
}
\keyword{survey}
\encoding{latin1}
