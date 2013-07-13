# Function to initialize a bipartite web for library network (type network),
# starting from an adjacency matrix.
bip_init_network <- function (mymat, modes = c("A", "P")) {
    require(network)
    if(!is.matrix(mymat)) mymat <- as.matrix(mymat)
    a = dim(mymat)[1]
    p = dim(mymat)[2]
    net <- network.initialize(a + p,
                               bipartite = a, directed=FALSE)
    network.bipartite(mymat, net, 
                      names.eval=list(row.names(mymat), colnames(mymat)))
    set.vertex.attribute(net,"mode",
                         c(rep(modes[1], a), rep(modes[2], p)))
}
