% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/API_swiss_lipids.R
\name{inchikey_to_swissid_nocharge}
\alias{inchikey_to_swissid_nocharge}
\title{Search for SwissLipids ID from InChIKey (ignoring charge state)

This function uses the SwissLipids API to search for a SwissLipids ID from a given InChIKey. The charge state is ignored and only the atom connectivity and stereochemistry block are used..}
\usage{
inchikey_to_swissid_nocharge(inchikey)
}
\arguments{
\item{inchikey}{InChIKey for which a SwissLipids ID shall be searched for}
}
\description{
Search for SwissLipids ID from InChIKey (ignoring charge state)

This function uses the SwissLipids API to search for a SwissLipids ID from a given InChIKey. The charge state is ignored and only the atom connectivity and stereochemistry block are used..
}
\examples{
library(lipidomicsUtils)
inchikey_to_swissid_nocharge("WTJKGGKOPKCXLL-VYOBOKEXSA-N")

}
\seealso{
\code{\link{inchikey_to_swissid_exact}}

\code{\link{inchikey_to_swissid_structure}}
}
\author{
Michael Witting, \email{michael.witting@helmholtz-muenchen.de}
}
