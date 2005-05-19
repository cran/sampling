\name{MU284}
\alias{MU284}
\docType{data}
\title{ The MU284 population }
\description{
This data are from Särndal et al (1992), see Appendix B, p. 652.  
}
\usage{data(MU284)}
\format{
  A data frame with 284 observations on the following 11 variables.
  \describe{
    \item{LABEL}{identifier number from 1 to 284.}
    \item{P85}{1985 population (in thousands).}
    \item{P75}{1975 population (in thousands).}
    \item{RMT85}{revenues from 1985 municipal taxation (in millions of kronor).}
    \item{CS82}{number of Conservative seats in municipal council.}
    \item{SS82}{number of Social-Democratic seats in municipal council.}
    \item{S82}{total number of seats in municipal council.}
    \item{ME84}{number of municipal employees in 1984.}
    \item{REV84}{real estate values according to 1984 assessment (in millions of kronor).}
    \item{REG}{geographic region indicator.}
    \item{CL}{cluster indicator (a cluster consists of a set of neighboring).}
  }
}
\references{
Särndal, C.-E., Swensson, B., and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}, Springer Verlag, 
New York.
}
\source{
http://lib.stat.cmu.edu/datasets/mu284
}
\examples{
data(MU284)
hist(MU284$RMT85)
}
\keyword{datasets}
\encoding{latin1}
