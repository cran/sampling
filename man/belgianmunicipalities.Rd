\name{belgianmunicipalities}
\alias{belgianmunicipalities}
\docType{data}
\title{ The Belgian municipalities population}
\description{This data provides information about
the Belgian population of July 1, 2004 compared to that of July 1,  
2003, and some financial information about the municipality incomes at the end of 2001. }
\usage{data(belgianmunicipalities)}
\format{
A data frame with 589 observations on the following 17 variables:
  \describe{
    \item{Commune}{municipality name.}
    \item{INS}{`Institut National de statistique' code.}
    \item{Province}{province number.}
    \item{Arrondiss}{administrative division number.}
    \item{Men04}{number of men on July 1, 2004.}
    \item{Women04}{number of women on July 1, 2004.}
    \item{Tot04}{total population on July, 1, 2004.}
    \item{Men03}{number of men on July 1, 2003.}
    \item{Women03}{number of women on July 1, 2003.}
    \item{Tot03}{total population on July 1, 2003.}
    \item{Diffmen}{number of men on July 1, 2004 minus the number of men on July 1, 2003.}
    \item{Diffwom}{number of women on July 1, 2004 minus the number of women on July 1, 2003.}
    \item{DiffTOT}{difference between the total population on July 1, 2004 and on July 1, 2003.}
    \item{TaxableIncome}{total taxable income in euros in 2001.}
    \item{Totaltaxation}{total taxation in euros in 2001.}
    \item{averageincome}{average of the income-tax return in euros in 2001.}
    \item{medianincome}{median of the income-tax return in euros in 2001.}
  }
}
\source{http://www.statbel.fgov.be/figures/download\_fr.asp
}
\examples{
data(belgianmunicipalities)
hist(belgianmunicipalities$medianincome)
}
\keyword{datasets}
