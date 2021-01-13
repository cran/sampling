\name{rec99}
\alias{rec99}
\docType{data}
\title{ The 1999 census data}
\description{
This data provides census information about
the municipalities of the Haute-Garonne department, France, with less than 10000 inhabitants in 1999.
}
\usage{data(rec99)}
\format{
  A data frame with 554 observations on the following 10 variables:
  \describe{
    \item{CODE_N}{municipality code.}
    \item{COMMUNE}{municipality name.}
    \item{BVQ_N}{code of the Daily Life Basin to which the municipality belongs.}
    \item{POPSDC99}{number of inhabitants.}
    \item{LOG}{number of dwellings.}
    \item{LOGVAC}{number of vacant dwellings.}
    \item{STRATLOG}{a four-modality variable which equals 1 if the municipality has less than 100 dwellings, 2 if it has between 100 and 299 dwellings, 
3 if it has between 300 and 999 dwellings and 4 if it has 1000 dwellings or more.}
    \item{surf_m2}{surface in square meters.}
    \item{lat_centre}{geographical latitude of the center.}
    \item{lon_centre}{geographical longitude of the center.}
   }
}
\source{
For the first 8 variables, 'Institut national de la statistique et des études économiques', France (http://www.insee.fr).
The geographical positions are available under the Open Database License ("© OpenStreetMap contributors"). https://www.openstreetmap.org/copyright
}
\examples{
data(rec99)
hist(rec99$LOG)
}
\keyword{datasets}
\encoding{latin1}
