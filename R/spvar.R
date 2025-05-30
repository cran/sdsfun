#' @title spatial variance
#' @details
#' The spatial variance formula is
#' \eqn{\Gamma = \frac{\sum_i \sum_{j \neq i} \omega_{ij}\frac{(y_i-y_j)^2}{2}}{\sum_i \sum_{j \neq i} \omega_{ij}}}
#'
#' @param x A numerical vector .
#' @param wt The spatial weight matrix.
#' @param method (optional) The method for calculating spatial variance, which can be chosen as
#' either `cpp` or `r`. Default is `cpp`.
#'
#' @return A numerical value.
#' @export
#'
#' @examples
#' gzma = sf::read_sf(system.file('extdata/gzma.gpkg',package = 'sdsfun'))
#' wt1 = inverse_distance_swm(gzma)
#' spvar(gzma$PS_Score,wt1)
#'
spvar = \(x,wt,method = c("cpp","r")){
  method = match.arg(method)
  if (method == "cpp"){
    gammav = RcppSpatialVariance(x,wt)
  } else {
    dn = data.frame(x,x) %>%
      stats::dist() %>%
      {.^2/4} %>%
      as.matrix()
    gammav = sum(dn * wt) / sum(wt)
  }
  return(gammav)
}


#' only spade power of spatial determinant
#'
#' @param y Dependent variable
#' @param hs Independent variable
#' @param wt Spatial weight matrix
#'
#' @return A numeric value
#' @export
#'
#' @examples
#' gzma = sf::read_sf(system.file('extdata/gzma.gpkg',package = 'sdsfun'))
#' wt1 = inverse_distance_swm(gzma)
#' spade_psd(y = gzma$PS_Score,
#'           hs = discretize_vector(gzma$PS_Score,5),
#'           wt = wt1)
#'
spade_psd = \(y,hs,wt){
  hs = as.integer(as.factor(hs))
  return(CalcSPADEPSD(y,hs,wt))
}
