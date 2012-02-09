\name{mstage}
\alias{mstage}
\title{Multistage sampling}
\description{Implements multistage sampling with equal/unequal probabilities.}
\usage{mstage(data, stage=c("stratified","cluster",""), varnames, size, 
method=c("srswor","srswr","poisson","systematic"), pik, description=FALSE)}
\arguments{
\item{data}{data frame or data matrix; its number of rows is N, the population size.}
\item{stage}{list of sampling type at each stage; the possible values are: "stratified", "cluster" 
and "" (without stratification or clustering). For multistage element sampling, this argument is not necessary.}
\item{varnames}{list of stratification or clustering variables.}
\item{size}{list of sample sizes (in the order in which the samples appear in the multistage sampling).}
\item{method}{method to select units; the following methods are implemented: simple random 
sampling without replacement (srswor), simple random sampling with replacement (srswr), 
Poisson sampling (poisson), systematic sampling (systematic); if the method is not specified, 
by default, the method is "srswor".}
\item{pik}{list of selection probabilities or auxiliary information used to compute them; 
this argument is only used for unequal probability sampling (Poisson, systematic). If an
auxiliary information is provided, the function uses the \link{inclusionprobabilities} function for
computing these probabilities. If the method is "srswr" and the sample size is larger than
the population size, the selection probabilities are normalized to one.}
\item{description}{a message is printed if its value is TRUE; the message gives the number 
of selected units and the number of the units in the population. 
By default, its value is FALSE.}
}
\value{
The function returns a list, which contains the stages (if m is this list, the stage i is m$'i' etc)
and the following information:
\item{ID_unit}{the identifier of selected units at each stage.}
\item{Prob_ number _stage}{the inclusion probability at stage 'number'.}
\item{Prob}{the final unit inclusion probability given in the last stage; it is the product of 
the unit inclusion probabilities at each stage.}
}
\seealso{
\code{\link{cluster}}, \code{\link{strata}}, \code{\link{getdata}}}
\examples{
############
## Example 1
############
# Two-stage cluster sampling
# Uses the 'swissmunicipalities' data for drawing a sample of units
data(swissmunicipalities)
# the variable 'REG' (region) has 7 categories;
# it is used as clustering variable in the first-stage sample
# the variable 'CT' (canton) has 26 categories; 
# it is used as clustering variable in the second-stage sample
# 4 clusters (regions) are selected in the first-stage 
# 1 canton is selected in the second-stage from each sampled cluster 
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
m=mstage(swissmunicipalities,stage=list("cluster","cluster"), varnames=list("REG","CT"),
size=list(4,c(1,1,1,1)), method="srswor")
# the first stage is m$'1' and the second stage is m$'2'
# extracts the observed data
# the order of the columns is different from the order in the swsissmunicipalities database
getdata(swissmunicipalities, m)
############
## Example 2
############
# Two-stage element sampling
# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# Generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# The variable "state" has 2 categories ('nc' and 'sc'). 
# The variable "region" has 3 categories (1, 2 and 3).
# The variable "income" is generated using the U(0,1) distribution. 
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100),rep(2,50),rep(3,15),rep(1,30),rep(2,40)),
100*runif(235))
names(data)=c("state","region","income")
# the method is simple random sampling with replacement
# 25 units are drawn in the first-stage
# in the second-stage, 10 units are drawn from the already 25 selected units
m=mstage(data,size=list(25,10),method="srswr") 
# extracts the observed data
getdata(data,m)
############
## Example 3
############
# One-stage stratified cluster sampling
# The same data as in Example 2
# the variable 'state' is used as stratification variable 
# 165 units are in the first stratum and 70 in the second one
# the variable 'region' is used as clustering variable
# 1 cluster (region) is drawn in each stratum using the "srswor" method
m=mstage(data, stage=list("stratified","cluster"), varnames=list("state","region"), 
size=list(c(165,70),c(1,1)),method="srswor") 
# extracts the observed data
getdata(data,m)
# verify the result using a contigency table
xx=getdata(data,m)
table(xx[[2]]$state,xx[[2]]$region)
############
## Example 4
############
# Two-stage cluster sampling
# The same data as in Example 1
data(swissmunicipalities)
# in the first-stage, the clustering variable is 'REG' (region) with 7 categories
# each region is selected with the probability 1/7
# in the second-stage, the clustering variable is 'CT'(canton) with 26 categories
# in the region 1, there are 3 cantons and each canton is selected with the prob. 1/3
# in the region 2, there are 5 cantons and each canton is selected with the prob. 1/5
# in the region 3, there are 3 cantons and each canton is selected with the prob. 1/3
# in the region 4, there is 1 canton, which it is selected with the prob. 1
# in the region 5, there are 7 cantons and each canton is selected with the prob. 1/7
# in the region 6, there are 6 cantons and each canton is selected with the prob. 1/6
# in the region 7, there is 1 canton, which it is selected with the prob. 1
# it is necessary to use a list of selection probabilities at each stage
# prob is the list of the selection probabilities
# the method is systematic sampling (unequal probabilities, without replacement)
# 4 clusters (regions) are drawn in the first-stage 
# 1 cluster (canton) is drawn in the second-stage from each selected region 
# ls is the list of sizes
ls=list(4,c(1,1,1,1))
prob=list(rep(4/7,7),list(rep(1/3,3),rep(1/5,5),rep(1/3,3),rep(1,1),rep(1/7,7),
rep(1/6,6),rep(1,1)))
m=mstage(swissmunicipalities,stage=list("cluster","cluster"),varnames=list("REG","CT"),
size=ls, method="systematic",pik=prob)
# extracts the observed data
getdata(swissmunicipalities,m)
}
\keyword{survey}
