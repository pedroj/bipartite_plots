#
# Bipartite network initialization, starting from an adjacency matrix.
# Code from François Briatte and Pedro Jordano.
#
bipartite.network <- function(M, modes = c("A", "P")) {
    require(network)
    stopifnot(length(modes) == 2)
    if(!is.matrix(M)) M <- as.matrix(M)
    x = dim(M)[1]
    y = dim(M)[2]
    net <- network.initialize(x + y, bipartite = x, directed = FALSE)
    net <- network.bipartite(M, net, 
                             names.eval = list(rownames(M), colnames(M)))
    x = rep(modes[1], x)
    y = rep(modes[2], y)
    set.vertex.attribute(net, "mode", c(x, y))
    return(net)
}
 
#
# Compte edge weights
# x is a constant helping to scale the edge thickness in the plots;
# just tune it to adequate values for the specific dataset.
#
edge.weights <- function(M, x = 30) {
    # Transpose.
    M <- t(M)
    # Edge list and weights.
    M <- cbind(expand.grid(dimnames(M))[2:1], as.vector(M))
    # Discard null weights.
    M <- subset(M, M[, 3] != 0)
    # Scaled weights.
    M.scaled <- x*log(M[, 3] + 1) / max(log(M[, 3] + 1))
    # Vector of edge weights.
    return(M.scaled)
}
