#---------------------------------------------------------------------------
# Function to initialize a bipartite web for library network (type network),
# starting from its adjacency matrix.
# Usually we assume animal species are rows, plant species are columns.
#---------------------------------------------------------------------------
bip_init_network <- function (mymat, modes= c("A", "P")) {
    require(network)
    require(ggnet)
    if(!is.matrix(mymat)) mymat <- as.matrix(mymat)
    a<- dim(mymat)[1]    # Animals are rows
    p<- dim(mymat)[2]    # Plants are columns
    net<- network(mymat,
                  matrix.type = "bipartite",
                  ignore.eval = FALSE,
    #             names.eval = "weights")
                  names.eval=list(row.names(mymat), colnames(mymat)))
}
#---------------------------------------------------------------------------
