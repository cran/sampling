\name{swissmunicipalities}
\alias{swissmunicipalities}
\docType{data}
\title{The Swiss municipalities population}
\description{This population provides information about the Swiss municipalities 
in 2003.
}
\usage{data(swissmunicipalities)}
\format{
  A data frame with 2896 observations on the following 22 variables.
  \describe{
    \item{CT}{Swiss canton.}
    \item{REG}{Swiss region.}
    \item{COM}{number of the municipality.}
    \item{Nom}{name of the municipality.}
    \item{HApoly}{area of the municipality.}
    \item{Surfacesbois}{wood area.}
    \item{Surfacescult}{area under cultivation.}
    \item{Alp}{mountain pasture area.}
    \item{Airbat}{area with buildings.}
    \item{Airind}{industrial area.}
    \item{P00BMTOT}{number of men.}
    \item{P00BWTOT}{number of women.}
    \item{Pop020}{number of men and women aged between 0 and 20.}
    \item{Pop2040}{number of men and women aged between 20 and 40.}
    \item{Pop4065}{number of men and women aged between 40 and 65.}
    \item{Pop65P}{number of men and women aged between 65 and over.}
    \item{H00PTOT}{number of households.}
    \item{H00P01}{number of households with 1 person.}
    \item{H00P02}{number of households with 2 persons.}
    \item{H00P03}{number of households with 3 persons.}
    \item{H00P04}{number of households with 4 persons.}
    \item{POPTOT}{total population.}
  }
}
%\details{
%}
\source{Swiss Federal Statistical Office.
}
%\references{
%}
\examples{
data(swissmunicipalities)
hist(swissmunicipalities$POPTOT)
}
\keyword{datasets}



