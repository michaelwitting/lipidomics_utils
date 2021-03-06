% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Parser_functional_groups.R
\name{get_amino_groups}
\alias{get_amino_groups}
\title{Get all amino groups

This function returns all amino groups in a acyl, alkyl, alkenyl, sphingoid base etc.}
\usage{
get_amino_groups(x)
}
\arguments{
\item{lipid}{Lipid for which the mass shall be calculated.}
}
\description{
Get all amino groups

This function returns all amino groups in a acyl, alkyl, alkenyl, sphingoid base etc.
}
\examples{
library(lipidomicsUtils)
get_peroxy_groups("18:0(5NH2)")

}
\seealso{
\code{\link{get_methyl_branches}}

\code{\link{get_double_bonds}}

\code{\link{get_hydroxy_groups}}

\code{\link{get_keto_groups}}

\code{\link{get_peroxy_groups}}
}
\author{
Michael Witting, \email{michael.witting@helmholtz-muenchen.de}
}
