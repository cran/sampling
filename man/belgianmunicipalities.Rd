\name{belgianmunicipalities}
\alias{belgianmunicipalities}
\docType{data}
\title{ The Belgian municipalities population}
\description{This population provides information about
the Belgian population on 1st July 2004 comparative with 1st July
2003, and some financial information about the municipality incomes in the end of 2001. }
\usage{data(belgianmunicipalities)}
\format{
A data frame with 589 observations on the following 17 variables.
  \describe{
    \item{Commune}{municipality name.}
    \item{INS}{'Institut National de statistique' code.}
    \item{Province}{province number.}
    \item{Arrondiss}{administrative division number.}
    \item{Men04}{number of men in 1st July 2004.}
    \item{Women04}{number of women in 1st July 2004.}
    \item{Tot04}{total population in 1st July 2004.}
    \item{Men03}{number of men in 1st July 2003.}
    \item{Women03}{number of women in 1st July 2003.}
    \item{Tot03}{total population in 1st July 2003.}
    \item{Diffmen}{number of men in 1st July 2004 minus the number of men in 1st July 2003.}
    \item{Diffwom}{number of women in 1st July 2004 minus the number of women in 1st July 2003.}
    \item{DiffTOT}{difference between the total population in 1st July 2004 and 1st July 2003.}
    \item{TaxableIncome}{total taxable income in euros in 2001.}
    \item{Totaltaxation}{total taxation in euros in 2001.}
    \item{averageincome}{average of the income-tax return in euros in 2001.}
    \item{medianincome}{median of the income-tax return in euros in 2001.}
  }
}
%\details{
%}
\source{http://www.statbel.fgov.be/figures/download\_fr.asp
}
%\references{
%  }
\examples{
data(belgianmunicipalities)
hist(belgianmunicipalities$medianincome)
}
\keyword{datasets}
