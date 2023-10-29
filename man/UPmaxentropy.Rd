\name{UPmaxentropy}
\alias{UPmaxentropy}
\alias{UPmaxentropypi2}
\alias{UPMEqfromw}
\alias{UPMEpikfromq}
\alias{UPMEpiktildefrompik}
\alias{UPMEsfromq}
\alias{UPMEpik2frompikw}
\title{Maximum entropy sampling}
\description{
Maximum entropy sampling with fixed sample size and unequal probabilities (or Conditional Poisson sampling) 
is implemented by means of a sequential method (unequal probabilities, without replacement, fixed sample size).
}
\usage{
UPmaxentropy(pik) 
UPmaxentropypi2(pik)
UPMEqfromw(w,n)
UPMEpikfromq(q) 
UPMEpiktildefrompik(pik,eps=1e-6)
UPMEsfromq(q)
UPMEpik2frompikw(pik,w)
}
\arguments{
\item{n}{sample size.}
\item{pik}{vector of prescribed inclusion probabilities.}
\item{eps}{tolerance in the Newton's method; by default is 1E-6.}
\item{q}{matrix of the conditional selection probabilities for the sequential algorithm.} 
\item{w}{parameter vector of the maximum entropy design.} 
}
\details{
The maximum entropy sampling maximizes the entropy criterion:
\deqn{I(p) = - \sum_s p(s)\log[p(s)]}{%
I(p) =  -\sum_s p(s)log[p(s)].}
The main procedure is \code{UPmaxentropy} which selects a sample (a vector of 0 and 1)
from a given vector of inclusion probabilities. The procedure \code{UPmaxentropypi2}
returns the matrix of joint inclusion probabilities from the first-order inclusion probability vector.
The other procedures are intermediate steps. They can be useful to run simulations as shown
in the examples below. The procedure \code{UPMEpiktildefrompik} computes the vector
of the inclusion probabilities (denoted \code{pikt}) of a Poisson sampling from the vector
of the inclusion probabilities of the maximum entropy sampling.  
The maximum entropy sampling is the conditional
design given the fixed sample size. The vector \code{w} can be easily obtained by 
\code{w=pikt/(1-pikt)}. Once \code{piktilde} and \code{w} are deduced from \code{pik},
a matrix of selection probabilities \code{q} can be derived from the sample size \code{n} 
and the vector \code{w} via \code{UPMEqfromw}. 
Next, a sample can be selected from \code{q} using \code{UPMEsfromq}.
In order to generate several samples, 
it is more efficient to compute the matrix \code{q} (which needs some calculation),
and then to use the procedure \code{UPMEsfromq}. The vector of the inclusion probabilities can
be recomputed from \code{q} using \code{UPMEpikfromq}, which also checks 
the numerical precision  of the algorithm. The procedure \code{UPMEpik2frompikw}
computes the matrix of the joint inclusion probabilities from \code{q} and \code{w}.
}
\references{
Chen, S.X., Liu, J.S. (1997).
Statistical applications of the Poisson-binomial and conditional Bernoulli distributions,
\emph{Statistica Sinica}, 7, 875-892;\cr
Deville, J.-C. (2000).
\emph{Note sur l'algorithme de Chen, Dempster et Liu.}
Technical report, CREST-ENSAI, Rennes.\cr
Matei, A., Tillé, Y. (2005) Evaluation of variance approximations and estimators in maximum entropy sampling with unequal
probability and fixed sample size, 
\emph{Journal of Official Statistics}, Vol. 21, No. 4, p. 543-570.\cr
Tillé, Y. (2006), \emph{Sampling Algorithms}, Springer.
}
\examples{
############
## Example 1
############
# Simple example - sample selection 
pik=c(0.07,0.17,0.41,0.61,0.83,0.91)
# First method
UPmaxentropy(pik)
# Second method by using intermediate procedures
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
UPMEsfromq(q)
# Matrix of joint inclusion probabilities
# First method: direct computation from pik
UPmaxentropypi2(pik)
# Second method: computation from pik and w
UPMEpik2frompikw(pik,w)
############
## Example 2
############
# other examples in the 'UPexamples' vignette
# vignette("UPexamples", package="sampling")
}
\keyword{survey} 
\encoding{latin1}
