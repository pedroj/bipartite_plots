#' Function to initialize a bipartite web for library igraph (type igraph).
#'
#' @param mat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#'
#' @details Function to initialize a bipartite web for library igraph (type igraph), starting from a weighted adjacency matrix.
#' Create the graph object (a bipartite, weighted graph) for igraph.
#'
#' @return A graph object.
#'
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
<<<<<<< HEAD
                graph_from_incidence_matrix(mat, 
=======
                graph_from_incidence_matrix(mat,
>>>>>>> ggbipart
                        weighted= T, add.names= NULL)
}
 
