#' Function to vectorze an adjacency matrix.
#'
#' @param mat the adjacency matrix.
#' @details Like in STACK: Turn table (C) into (D):
#' The input matrix should be read with row.names=1 option and a blank entry at the upper left corner.
#'
#' C
#'    a  b  c  d
#' A  3  2  .  .
#' B  .  .  1  1
#'
#' D
#' A  a  3
#' A  b  2
#' A  c  .
#' A  d  .
#' B  a  .
#' B  b  .
#' B  c  1
#' B  d  1
#' #-------------------------------------------------------------
#'
#' @return A vector object.
#' @export
#' @examples
#' # A weighted plant-frugivore adjacency matrix shipped with the package.
#' mat <- as.matrix(read.csv(
#'     system.file("extdata", "sdw02_adj_fru.csv", package = "ggbipart"),
#'     comment.char = "#", row.names = 1, check.names = FALSE))
#' edges <- vectorize(mat)
#' head(edges)
vectorize <- function(mat)
{
  mat <- t(mat)
  cbind(expand.grid(dimnames(mat))[2:1], as.vector(mat))
}
