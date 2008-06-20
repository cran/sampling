\name{HTstrata}
\alias{HTstrata}
\title{The Horvitz-Thompson estimator for a stratified design}
\description{Computes the Horvitz-Thompson estimator of the population total for a stratified design.}
\usage{HTstrata(y,pik,strata,description=FALSE)}
\arguments{
\item{y}{vector of the variable of interest; its length is equal to n, the sample size.}
\item{pik}{vector of the first-order inclusion probabilities for the sampled units; its length is equal to n, the sample size.}
\item{strata}{vector of size n, with elements indicating the unit stratum.}
\item{description}{if TRUE, the estimator is printed for each stratum; by default, FALSE.}
}
\seealso{
\code{\link{HTestimator}}
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
# computes the HT estimator of the variable Pop020 
HTstrata(x$Pop020,x$Prob,x$Stratum,description=TRUE)
}
\keyword{survey}