# Function to initialize a bipartite web for library 
# igraph (type igraph), starting from a weighted adjacency matrix.
#
require(igraph)
# Build a graph from a weighted adjacency matrix (mymat).
#
# Create the graph object (a bipartite, weighted graph) for igraph.
bip_init_igraph <- function (mymat) {
              graph.incidence(mymat, weighted = T)
}
