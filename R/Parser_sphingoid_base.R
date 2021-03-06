#' @title Get all sphingoid bases
#' 
#' This functions isolates all sphingoid bases from a given lipid shorthand notation and returns them as vector. upported modifications are currently hydroxy groups (OH), hydroperoxy groups (OOH), keto groups (O) and amino groups (NH2)
#' 
#' @param lipid Shorthand notation of a acyl (as string), e.g. "Cer(d16:1(4E,1OH,3OH,15Me)/22:0)"
#' @examples
#' library(lipidomicsUtils) 
#' isolate_fatty_acyls("Cer(d16:1(4E,1OH,3OH,15Me)/22:0)")
#' 
#' @author Michael Witting, \email{michael.witting@@helmholtz-muenchen.de}
#'
#' @export
isolate_sphingoid_base <- function(lipid) {
  
  .Deprecated("This function will be removed in the next version. Use isolate_sphingoid() instead.")
  
  # get all possible building blocks
  #sphingoid_base <- stringr::str_extract_all(lipid, "(m|d|t|O-|P-)*\\d+:\\d+(\\((\\d*(E|Z|Me|OH),*)*\\))*")[[1]]
  sphingoid_base <- stringr::str_extract_all(lipid, "(m|d|t|O-|P-)*\\d+:\\d+(\\((\\d*(E|Z|Me|OH|OOH|O|NH2)(\\[(S|R)\\])*,*)*\\))*")[[1]]
  
  # remove sphingoid bases
  filter <- stringr::str_detect(sphingoid_base, "^(m|d|t)", negate = FALSE)
  sphingoid_base <- sphingoid_base[filter]
  
  return(sphingoid_base)
  
}

#' @title Get all sphingoid bases
#' 
#' This functions isolates all sphingoid bases from a given lipid shorthand notation and returns them as vector. upported modifications are currently hydroxy groups (OH), hydroperoxy groups (OOH), keto groups (O) and amino groups (NH2)
#' 
#' @param lipid Vector or list of shorthand notations, e.g. c("Cer(d16:1(4E,1OH,3OH,15Me)/22:0)", "HexCer(d18:1/22:0)")
#' @examples
#' library(lipidomicsUtils)
#' lipids <- c("Cer(d16:1(4E,1OH,3OH,15Me)/22:0)", "HexCer(d18:1/22:0)")
#' isolate_sphingoids(lipids)
#' 
#' @author Michael Witting, \email{michael.witting@@helmholtz-muenchen.de}
#'
#' @export
isolate_sphingoids <- function(lipids) {
  
  # use of lapply for list and vectors
  sphingoids <- lapply(lipids, FUN = .isolate_sphingoid)
  return(sphingoids)
  
}

# helper function to isolate radyls from a single lipid
.isolate_sphingoid <- function(lipid) {
  
  # get all possible building blocks
  #sphingoid_base <- stringr::str_extract_all(lipid, "(m|d|t|O-|P-)*\\d+:\\d+(\\((\\d*(E|Z|Me|OH),*)*\\))*")[[1]]
  sphingoid_base <- stringr::str_extract_all(lipid, "(m|d|t|O-|P-)*\\d+:\\d+(\\((\\d*(E|Z|Me|OH|OOH|O|NH2)(\\[(S|R)\\])*,*)*\\))*")[[1]]
  
  # remove sphingoid bases
  filter <- stringr::str_detect(sphingoid_base, "^(m|d|t)", negate = FALSE)
  sphingoid_base <- sphingoid_base[filter]
  
  return(sphingoid_base)
}