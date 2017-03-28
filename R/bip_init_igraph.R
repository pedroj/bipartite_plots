# Function to initialize a bipartite web for library 
# igraph (type igraph), starting from a weighted adjacency matrix.
# Create the graph object (a bipartite, weighted graph) for igraph.
bip_init_igraph <- function (mat) {
                require(igraph)
                graph_from_incidence_matrix(mat, 
                        weighted= T, add.names= NULL)
}
 
