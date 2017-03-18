#---------------------------------------------------------------------------
# Function to initialize a bipartite web for library network (type network),
# starting from its adjacency matrix.
# Usually we assume animal species are rows, plant species are columns.
#---------------------------------------------------------------------------
bip_init_network <- function (mymat, mode1="P", mode2="A") {
    require(network)
    require(ggnet)
    if(!is.matrix(mymat)) mymat <- as.matrix(mymat)
    p<- dim(mymat)[1]    # Plants are rows
    a<- dim(mymat)[2]    # Animals are columns
    net<- network::network(mymat,
                  matrix.type = "bipartite",
                  ignore.eval = FALSE,
                  names.eval = "weights")
    net
    network::set.vertex.attribute(net,"mode",c(rep(mode1,p), rep(mode2,a)))
}
#---------------------------------------------------------------------------
