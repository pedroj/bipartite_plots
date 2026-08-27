#' Function to initialize a bipartite web for library igraph (type igraph).
#'
#' @param mat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#'
#' @details Function to initialize a bipartite web for library igraph (type igraph), starting from a weighted adjacency matrix.
#' Create the graph object (a bipartite, weighted graph) for igraph.
#'
#' @return A graph object.
#'
#' @export
#' @examples
#' mat <- as.matrix(read.csv(
#'     system.file("extdata", "sdw02_adj_fru.csv", package = "ggbipart"),
#'     comment.char = "#", row.names = 1, check.names = FALSE))
#' g <- bip_init_igraph(mat)
#' g
#------------------------------------------------------------------------------
# Function to initialize a bipartite web for library
# igraph (type igraph), starting from a weighted adjacency matrix.
# Create the graph object (a bipartite, weighted graph) for igraph.
bip_init_igraph <- function (mat) {
                igraph::graph_from_biadjacency_matrix(mat,
                        weighted= T, add.names= NULL)
}
