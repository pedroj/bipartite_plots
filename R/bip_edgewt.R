#' Function to compute scaled edge weights for plotting.
#'
#' @import ggplot2
#'
#' @param M the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#' @param x a scaling parameter. Just tune it (x parameter) to adequate values for the specific dataset.
#'
#' @details Compute scaled edge weights for plotting. x is a constant helping to scale the edge thickness in the plots; just tune it (x parameter) to adequate values for the specific dataset. Input can be a data.frame or a matrix, representing the adjacency matrix.
#'
#' @return A vector of scaled edge weights for plotting.
#' @export
#'
#' @examples
#' #------------------------------------------------------------------------
#' # Working on it.
#' #------------------------------------------------------------------------
#----------------------------------------------------------------------------
bip_edgewt<- function(M, x = 30) {
    if(!is.matrix(M)) as.matrix(M)
    # Transpose.
    M <- t(M)
    # Edge list and weights.
    M <- cbind(expand.grid(dimnames(M))[2:1], as.vector(M))
    # Discard null weights.
    M <- subset(M, M[, 3] != 0)
    # Scaled weights.
    M.scaled <- x*log(M[, 3] + 1) / max(log(M[, 3] + 1))
    # Vector of edge weights.
    return(M.scaled) # A numeric vector with scaled edge lengths.
}
#----------------------------------------------------------------------------
