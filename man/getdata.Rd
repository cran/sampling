\name{getdata}
\alias{getdata}
\title{Get data}
\description{Extracts the observed data from a data frame (a population). 
The function is used after a sample has been drawn from this population.
}
\usage{getdata(data, m)}
\arguments{
\item{data}{population data frame or data matrix; its number of rows is N, the population size.}
\item{m}{vector of selected units or sample data frame.}
}
\seealso{
\code{\link{srswor}}, \code{\link{UPsystematic}}, \code{\link{strata}}, 
\code{\link{cluster}}, \code{\link{mstage}}}
\examples{
############
## Example 1
############
# Generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# The variable 'state' has 2 categories (nc and sc); 
# the variable 'region' has 3 categories (1, 2 and 3);
# the variable 'income' is generated using the U(0,1) distribution.
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),
matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# the inclusion probabilities are computed using the variable 'income'
pik=inclusionprobabilities(data$income,20)
# draws a sample using systematic sampling (sample size is 20)
s=UPsystematic(pik) 
# extracts the observed data
getdata(data,s)
############
## Example 2
############
# see other examples in 'strata', 'cluster', 'mstage' help files
}
\keyword{survey}