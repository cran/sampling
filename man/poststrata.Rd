\name{poststrata}
\alias{poststrata}
\title{Postratification}
\description{Poststratification using several criteria.}
\usage{poststrata(data, postnames = NULL)} 
\arguments{
\item{data}{data frame or data matrix; its number of rows is n, the sample size.}
\item{postnames}{vector of poststratification variables.}
}
\value{ 
\item{The function}{produces an object, which contains the following information:}
\item{data}{the final data frame with a new column ('poststratum') containg the unit poststratum.}
\item{npost}{the number of poststrata.}
}
\seealso{
\code{\link{postest}}}
\examples{
# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# the variable "state" has 2 categories ('nc' and 'sc'). 
# the variable "region" has 3 categories (1, 2 and 3).
# the income variable is randomly generated
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# postratification using two criteria: state and region
poststrata(data,postnames=c("state","region"))     
}
\keyword{survey}
