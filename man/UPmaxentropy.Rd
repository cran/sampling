\name{UPmaxentropy}
\alias{UPmaxentropy}
\alias{UPmaxentropypi2}
\alias{UPMEqfromw}
\alias{UPMEpikfromq}
\alias{UPMEpiktildefrompik}
\alias{UPMEsfromq}
\alias{UPMEpik2frompikw}
\title{Maximum entropy sampling with fixed sample size and unequal probabilities}
\description{
Maximum entropy sampling with fixed sample size and unequal probabilities (or Conditional Poisson sampling) 
is implemented by means of a sequential method.
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
\item{eps}{tolerance in Newton's method; by default is 1E-6.}
\item{q}{matrix of the conditional selection probabilities for the sequential algorithm.} 
\item{w}{parameter vector of the maximum entropy design.} 
}
\details{
The maximum entropy sampling maximizes the entropy criterion:
\deqn{I(p) = - \sum_s p(s)\log[p(s)]}{%
I(p) =  -\sum_s p(s)log[p(s)].}
The main procedure is \code{UPmaxentropy} that allows selecting a sample (a vector of 0 and 1)
from a given vector of inclusion probabilities. The procedure \code{UPmaxentropypi2}
returns the matrix of the joint inclusion probabilities from the first-order inclusion probability vector.
The other procedures are intermediate steps. They can be useful to run simulations as shown
in the examples below. The procedure \code{UPMEpiktildefrompik} computes the vector
of the inclusion probabilities (denoted \code{pikt}) of a Poisson sampling from the vector
of the inclusion probabilities of the maximum entropy sampling.  
The maximum entropy sampling is the conditional
design given the fixed sample size. The vector \code{w} can be easily obtained by 
\code{w=pikt/(1-pikt)}. Once \code{piktilde} and \code{w} are deduced from \code{pik},
a matrix of selection probabilities \code{q} can be derived from the sample size \code{n} 
and the vector \code{w}, by means of the procedure \code{UPMEqfromw}. 
Next, a sample can be selected from \code{q} by using \code{UPMEsfromq}.
In order to generate several samples, 
it is more efficient to compute the matrix \code{q} (which needs some calculation),
and then to use the procedure \code{UPMEsfromq}. The vector of the inclusion probabilities can
be recomputed from \code{q} by using \code{UPMEpikfromq}, which allows to check 
the numerical precision  of the algorithm. The procedure \code{UPMEpik2frompikw}
computes the matrix of the joint inclusion probabilities from \code{q} and \code{w}.
}
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
# Simple example - sample Selection 
pik=c(0.07,0.17,0.41,0.61,0.83,0.91)
# First method
UPmaxentropy(pik)
# Second method by using the intermediate procedures
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
UPMEsfromq(q)
# The matrix of inclusion probabilities
# First method: direct computation from pik
UPmaxentropypi2(pik)
# Second method: computation from pik and w
UPMEpik2frompikw(pik,w)
############
## Example 2
############
# Sample of Belgian municipalities
data(belgianmunicipalities)
attach(belgianmunicipalities)
n=200
pik=inclusionprobabilities(averageincome,n)
s=UPmaxentropy(pik)
#the sample is
as.character(Commune[s==1])
#the joint inclusion probabilities
pi2=UPmaxentropypi2(pik)
rowSums(pi2)/pik/n
############
## Example 3
############
# Selection of 200 samples of Belgian municipalities
# Once matrix q is computed, the selection of a sample is very quick.
# Simulations are thus possible.
data(belgianmunicipalities)
attach(belgianmunicipalities)
pik=inclusionprobabilities(averageincome,200)
pik=pik[pik!=1]
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
N=length(pik)
tt=rep(0,times=N)
#number of simulations
sim=200
for(i in 1:sim) tt = tt+UPMEsfromq(q)
tt=tt/sim
sum(abs(tt-pik))
}
\keyword{survey} 
\encoding{latin1}

