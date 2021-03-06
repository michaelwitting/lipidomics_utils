#' @title Generation of different shorthand notation level
#' 
#' This function simplifies a given shorthand notation to a lower level notation, e.g. PC(16:0/18:2(9Z,12Z)) to PC(16:0/18:2) or PC(16:0_18:2) or PC(34:2).
#' 
#' @param x Shorthand notation of a fatty acyl lipid, e.g. PC(16:0/18:2(9Z,12Z))
#' @param level Either \code{structural}, \code{molecular} or \code{species} for the respective levels according to SwissLipids hierachy
#' @examples 
#' library(lipidomicsUtils)
#' get_gl_shorthand("PC(16:0/18:2(9Z,12Z))")
#' 
#' @author Michael Witting, \email{michael.witting@@helmholtz-muenchen.de}
#'
#' @export
get_gp_shorthand <- function(x, level = c("structural", "molecular", "species")) {
  
  # detection of functional groups
  if(stringr::str_detect(x, "\\d+(OH|OOH|O|NH2)")) {
    stop("Functional groups other than methyl branches on fatty acyls currently not supported, only DBs")
  }
  
  if(level == "structural") {
    
    lipid <- .get_gp_position_level(x)
    
  } else if(level == "molecular") {
    
    lipid <- .get_gp_acyl_level(x)
    
  } else if(level == "species") {
    
    lipid <- .get_gp_species_level(x)
    
  }
  
  # return result
  return(lipid)
  
}

#' Private function
#' 
#' 
.get_gp_position_level <- function(x) {
  
  # get subclass
  lipid_subclass <- lipidomicsUtils::get_lipid_subclass(x)
  lipid_mainclass <- lipidomicsUtils::get_lipid_mainclass(x)
  
  # isolate fatty acids
  fatty_acyls <- lipidomicsUtils::isolate_fatty_acyls(x)
  
  # make simplified versions
  fatty_acyls_simple <- unlist(lapply(fatty_acyls, function(x) {
    carbon <- lipidomicsUtils::get_carbon_number(x)
    bonds <- lipidomicsUtils::get_bond_number(x)
    
    return(paste0(carbon, ":", bonds))
  }))

  # check for possible ether bond
  if(stringr::str_detect(lipid_subclass, "-(O|P)")) {
    
    etherbond <- stringr::str_extract_all(lipid_subclass, "-(O|P)")
    etherbond <- stringr::str_replace_all(etherbond, "-", "")
    etherbond <- paste0(etherbond, "-")
    
  } else {
    
    etherbond <- ""
    
  }
  
  #generate lipid
  position <- paste0(lipid_mainclass, "(", etherbond, paste0(fatty_acyls_simple, collapse = "/"), ")")
  
  # return result
  return(position)
  
}

#' Private function
#' 
#' 
.get_gp_acyl_level <- function(x) {
  
  # get subclass
  lipid_subclass <- lipidomicsUtils::get_lipid_subclass(x)
  lipid_mainclass <- lipidomicsUtils::get_lipid_mainclass(x)
  
  # isolate fatty acids
  fatty_acyls <- lipidomicsUtils::isolate_fatty_acyls(x)
  
  # make simplified versions
  fatty_acyls_simple <- unlist(lapply(fatty_acyls, function(x) {
    carbon <- lipidomicsUtils::get_carbon_number(x)
    bonds <- lipidomicsUtils::get_bond_number(x)
    
    return(paste0(carbon, ":", bonds))
  }))
  
  # check for possible ether bond
  if(stringr::str_detect(lipid_subclass, "-(O|P)")) {
    
    etherbond <- stringr::str_extract_all(lipid_subclass, "-(O|P)")
    etherbond <- stringr::str_replace_all(etherbond, "-", "")
    etherbond <- paste0(etherbond, "-")
    
  } else {
    
    etherbond <- ""
    
  }
  
  #generate lipid
  if(stringr::str_detect(lipid_subclass, "-(O|P)")) {
    
    acyl <- paste0(lipid_mainclass, "(", etherbond, fatty_acyls_simple[1], "_", paste0(sort(fatty_acyls_simple[-1]), collapse = "_"), ")")
    
  } else {
    
    acyl <- paste0(lipid_mainclass, "(", etherbond, paste0(sort(fatty_acyls_simple), collapse = "_"), ")")
    
  }
  
  # return result
  return(acyl)
  
}

#' Private function
#' 
#' 
.get_gp_species_level <- function(x) {
  
  # get subclass
  lipid_subclass <- lipidomicsUtils::get_lipid_subclass(x)
  lipid_mainclass <- lipidomicsUtils::get_lipid_mainclass(x)
  
  # isolate fatty acids
  fatty_acyls <- lipidomicsUtils::isolate_fatty_acyls(x)
  
  # get total carbon and double bond number
  total_carbon <- sum(unlist(lapply(fatty_acyls, function(x) {
    lipidomicsUtils::get_carbon_number(x)
  })))
  
  total_bond <- sum(unlist(lapply(fatty_acyls, function(x) {
    lipidomicsUtils::get_bond_number(x)
  })))
  
  # check for possible ether bond
  if(stringr::str_detect(lipid_subclass, "-O")) {
    
    species <- paste0(lipid_mainclass, "(O-", total_carbon, ":", total_bond, ")")
    
  } else if(stringr::str_detect(lipid_subclass, "-P")) {
    
    species <- paste0(lipid_mainclass, "(O-", total_carbon, ":", total_bond + 1, ")")
    
  } else {
    
    species <- paste0(lipid_mainclass, "(", total_carbon, ":", total_bond, ")")
    
  }
  
  # return result
  return(species)
  
}
