\name{Hajekstrata}
\alias{Hajekstrata}
\title{The Hajek estimator for a stratified design}
\description{Computes the Hájek estimator of the population total or population mean for a stratified design.}
\usage{Hajekstrata(y,pik,strata,N=NULL,type=c("total","mean"),description=FALSE)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{pik}{vector of the first-order inclusion probabilities for the sampled units; its length is equal to n, the sample size.}
\item{strata}{vector of size n, with elements indicating the unit stratum.}
\item{N}{vector of population sizes of strata; N is only used for the total estimator; for the mean estimator its value is NULL.}
\item{type}{the estimator type: total or mean.}
\item{description}{if TRUE, the estimator is printed for each stratum; by default, FALSE.}
}
\seealso{
\code{\link{HTstrata}}
}
\examples{
# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population 
# it is used as stratification variable
# computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7
# 589 913 321 171 471 186 245
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(swissmunicipalities,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), 
method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the swsissmunicipalities database
x=getdata(swissmunicipalities, st)
# computes the population sizes of strata
N=table(swissmunicipalities$REG)
N=N[unique(x$REG)]
# computes the Hajek estimator of the variable Pop020 
Hajekstrata(x$Pop020,x$Prob,x$Stratum,N,type="total",description=TRUE)}
\keyword{survey}
