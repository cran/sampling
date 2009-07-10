\name{rhg_strata}
\alias{rhg_strata}
\title{Response homogeneity groups for stratified sampling}
\description{Computes the response homogeneity groups and the response probability for each 
unit in these groups for stratified sampling. 
}
\usage{rhg_strata(X,selection)}
\arguments{
\item{X}{X is the sample data frame; it should contain the columns 'ID\_unit','Stratum', and 'status'; 
'ID\_unit' denotes the unit identifier (a number); 'Stratum' denotes the unit stratum; 'status' is a 1/0 variable denoting the response/non-response of a unit in the sample.}
\item{selection}{vector of variable names used to construct the groups.}
}
\details{
Into a response homogeneity group, the reponse probability is the same for
all units. Data are missing at random within groups, conditionally on the selected sample.
}
\value{
\item{}{The initial sample data frame and also the following components:} 
\item{rhgroup}{the response homogeneity group for each unit conditionally on its stratum.}
\item{prob\_response}{the response probability for each unit; for the units with status=0, this probability
is 0.}
}
\references{ 
Särndal, C.-E., Swensson, B. and Wretman, J. (1992). Model Assisted Survey Sampling. \emph{Springer}
} 
\seealso{
\code{\link{rhg}}, \code{\link{calib}}
}
\examples{
############
## Example 1
############
# uses Example 2 from the 'strata' function help file
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# draws a sample
s1=strata(data,c("region","state"),size=c(10,5,10,4,6), method="systematic",pik=data$income)
# extracts the observed data
s1=getdata(data,s1)
# generates randomly the 'status' variable (1-sample respondent, 0-otherwise)
status=runif(nrow(s1))
for(i in 1:length(status))
 if(status[i]<0.3)  status[i]=0 else status[i]=1
# adds the 'status' variable to the sample data frame s1
s1=cbind.data.frame(s1,status)
# creates classes of income using the median of income
# suppose that the income is available for all units in sample
classincome=numeric(nrow(s1))
for(i in 1:length(classincome))
 if(s1$income[i]<median(s1$income))  classincome[i]=1 else classincome[i]=2
# adds 'classincome' to s1
s1=cbind.data.frame(s1,classincome)
# computes the response homogeneity groups using the 'classincome' variable   
rhg_strata(s1,selection=c("classincome"))
############
## Example 2
############
# the same data as in Example 1
# but we also add the 'sex' column (1-female, 2-male)
# suppose that the sex is available for all units in sample
sex=c(rep(1,12),rep(2,8),rep(1,10),rep(2,5))
s1=cbind.data.frame(s1,sex)
# computes the response homogeneity groups using the 'classincome' and 'sex' variables   
rhg_strata(s1,selection=c("classincome","sex"))
}
\keyword{survey}





