#' @title standardization
#' @description
#' To calculate the Z-score using variance normalization, the formula is as follows:
#'
#' \eqn{Z = \frac{(x - mean(x))}{sd(x)}}
#'
#' @param x A numeric vector
#'
#' @return A standardized numeric vector
#' @export
#'
#' @examples
#' standardize_vector(1:10)
#'
standardize_vector = \(x){
  return((x - mean(x,na.rm = TRUE)) / stats::sd(x,na.rm = TRUE))
}

#' @title normalization
#'
#' @param x A continuous numeric vector.
#' @param to_left (optional) Specified minimum. Default is `0`.
#' @param to_right (optional) Specified maximum. Default is `1`.
#'
#' @return A continuous vector which has normalized.
#' @export
#'
#' @examples
#' normalize_vector(c(-5,1,5,0.01,0.99))
#'
normalize_vector = \(x,to_left = 0,to_right = 1){
  xmin = range(x,na.rm = TRUE)[1]
  xmax = range(x,na.rm = TRUE)[2]
  xnew = (x - xmin) / (xmax - xmin) * (to_right - to_left) + to_left
  return(xnew)
}

#' @title generate subsets of a set
#'
#' @param set A vector.
#' @param empty (optional) When `empty` is `TRUE`, the generated subset includes the empty set,
#' otherwise the empty set is removed. Default is `TRUE`.
#' @param self (optional) When `self` is `TRUE`, the resulting subset includes the set itself,
#' otherwise the set itself is removed. Default is `TRUE`.
#'
#' @return A list.
#' @export
#'
#' @examples
#' generate_subsets(letters[1:3])
#' generate_subsets(letters[1:3],empty = FALSE)
#' generate_subsets(letters[1:3],self = FALSE)
#' generate_subsets(letters[1:3],empty = FALSE,self = FALSE)
#'
generate_subsets = \(set,empty = TRUE,self = TRUE) {
  n = length(set)
  subsets = list(c())
  for (i in seq(set)) {
    subsets = c(subsets, utils::combn(set, i, simplify = FALSE))
  }
  if (!empty) {subsets = subsets[-1]}
  if (!self & empty) {subsets = subsets[-2^n]}
  if (!self & !empty) {subsets = subsets[-(2^n-1)]}
  return(subsets)
}
