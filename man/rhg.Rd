\name{rhg}
\alias{rhg}
\title{Response homogeneity groups}
\description{Computes the response homogeneity groups and the response probability for each 
unit in these groups. 
}
\usage{rhg(X,selection)}
\arguments{
\item{X}{sample data frame; it should contain the columns 'ID_unit' and 'status'; 
'ID_unit' denotes the unit identifier (a number); 'status' is a 1/0 variable denoting the response/non-response of a unit.}
\item{selection}{vector of variable names in X used to construct the groups.}
}
\details{
Into a response homogeneity group, the reponse probability is the same for
all units. Data are missing at random within groups, conditionally on the selected sample.
}
\value{
The initial sample data frame and also the following components:
\item{rhgroup}{the response homogeneity group for each unit.}
\item{prob_response}{the response probability for each unit; for the units with status=0, this probability
is 0.}
}
\references{ 
Särndal, C.-E., Swensson, B. and Wretman, J. (1992). Model Assisted Survey Sampling. \emph{Springer}
} 
\seealso{
\code{\link{rhg_strata}}, \code{\link{calib}}
}
\examples{
# defines the inclusion probabilities for the population
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
# X is the population data frame
X=cbind.data.frame(pik,c("A","B","A","A","C","B"))
names(X)=c("Prob","town")
# selects a sample using systematic sampling
s=UPsystematic(pik)
# Xs is the sample data frame
Xs=getdata(X,s)
# adds the status column to Xs (1 - sample respondent, 0 otherwise)
Xs=cbind.data.frame(Xs,status=c(1,0,1))
# creates the response homogeneity groups using the 'town' variable
rhg(Xs,selection="town")
}
\keyword{survey}
\encoding{latin1}

