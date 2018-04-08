#' Function to initialize a bipartite web for library network (type network).
#'
#' @import network
#' @param mymat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#' @param mode1 name for the upper mode.
#' @param mode2 name for the lower mode.
#' @details Function to initialize a bipartite web for library network (type network),
# starting from its adjacency matrix. Usually we assume animal species are rows (mode1), plant species are columns (mode2).
#'
#' @return A network object.
#'
#' @examples
#' #------------------------------------------------------------------------
#' #### NOT RUN # Working on it.
#' #------------------------------------------------------------------------
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
