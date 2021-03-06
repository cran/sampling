\name{cluster}
\alias{cluster}
\title{Cluster sampling}
\description{Cluster sampling with equal/unequal probabilities.}
\usage{cluster(data, clustername, size, method=c("srswor","srswr","poisson",
"systematic"),pik,description=FALSE)}
\arguments{
\item{data}{data frame or data matrix; its number of rows is N, the population size.}
\item{clustername}{the name of the clustering variable.}
\item{size}{sample size.}
\item{method}{method to select clusters; the following methods are implemented: simple random 
sampling without replacement (srswor), simple random sampling with replacement (srswr), 
Poisson sampling (poisson), systematic sampling (systematic); if the method is not specified, 
by default the method is "srswor".}
\item{pik}{vector of inclusion probabilities or auxiliary information used to compute them; 
this argument is only used for unequal probability sampling (Poisson, systematic). If an
auxiliary information is provided, the function uses the \link{inclusionprobabilities} function for
computing these probabilities.}
\item{description}{a message is printed if its value is TRUE; the message gives the number 
of selected clusters, the number of units in the population and the number of selected units. 
By default, the value is FALSE.}
}
\value{
The function returns a data set with the following information: the selected clusters, the identifier of the units in the selected clusters,
the final inclusion probabilities for these units (they are equal for the units included in the same cluster). If method is "srswr", the number of replicates is also given. 
}
\seealso{
\code{\link{mstage}}, \code{\link{strata}}, \code{\link{getdata}}}
\examples{
############
## Example 1
############
# Uses the swissmunicipalities data to draw a sample of clusters
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as clustering variable
# the sample size is 3; the method is simple random sampling without replacement
cl=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="srswor")
# extracts the observed data 
# the order of the columns is different from the order in the initial database
getdata(swissmunicipalities, cl)
############
## Example 2
############
# the same data as in Example 1
# the sample size is 3; the method is systematic sampling
# the pik vector is randomly generated using the U(0,1) distribution
cl_sys=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="systematic",
pik=runif(7))
# extracts the observed data
getdata(swissmunicipalities,cl_sys)
}
\keyword{survey}
