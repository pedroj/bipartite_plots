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
#' #------------------------------------------------------------------------
#' #### NOT RUN. Working on it.
#' #------------------------------------------------------------------------
#------------------------------------------------------------------------------
# Function to initialize a bipartite web for library
# igraph (type igraph), starting from a weighted adjacency matrix.
# Create the graph object (a bipartite, weighted graph) for igraph.
bip_init_igraph <- function (mat) {
                require(igraph)
                igraph::graph_from_incidence_matrix(mat,
                        weighted= T, add.names= NULL)
}
