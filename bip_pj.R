# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggplot2. Code from Francois Briatte, using his fucntion ggnet.
# DATE: 15Jul2013.
#-------------------------------------------------------------------------
#.........................................................................
require(downloader)
 
# PJ example. Based on a gist by F Briatte to just feed the network data 
# from its adjacency matrix to ggnet
link = "https://raw.github.com/pedroj/bipartite_plots/master/data/NCH_quant_bmatrix.txt"
file = "data/NCH_quant_bmatrix.txt"
if(!file.exists(file)) download(link, file, mode = "wb")
M <- read.table(file, sep = "\t", dec = ",", header = TRUE, row.names = 1)
 
#
# Bipartite network initialization, starting from an adjacency matrix.
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
 
#
# Pass the network, edge weights and mode to ggnet.
#
source_url("https://raw.github.com/briatte/ggnet/master/ggnet.R", prompt = FALSE)
net = bipartite.network(M, modes = c("one", "two"))
ggnet(net,
      segment.size = edge.weights(M, 15), segment.alpha = .25,
      label = TRUE, color = "black",
      node.group = get.vertex.attribute(net, "mode"))
