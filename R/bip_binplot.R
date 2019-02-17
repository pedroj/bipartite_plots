#' Function bip_binplot, to plot a network object corresponding 
#' to a binary adjacency matrix.
#' 
#' mymat is the adjacency matrix, to get the dimensions from.
#' net is a network object corresponding to mymat. The object net can
#' be initialized with function bip_netinit.R
#'
#' @import ggplot2
#'
#' @param mymat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#' @param net, a ntework object.
#'
#' @details Plot of a network object corresponding to a binary adjacency matrix (qualitative, presence-absence, data.
#' @return A plot object.
#' @export
#'
#' @examples
#' #------------------------------------------------------------------------
#' # Working on it.
#' #------------------------------------------------------------------------
#----------------------------------------------------------------------------
bip_binplot <- function (mymat, net, 
                         usearrows=FALSE, 
                         mode= "kamadakawai",
                         displaylabels=   T,
                         label.cex=     0.6,
                         vertex.cex=    1.0,
                         edge.lty=      0.7
                         ) {
    #   require(grDevices)
    if (!is.network(net)) 
        stop("plot.network requires a network object.")
    if (network.size(net) == 0) 
        stop("plot.network called on a network of order zero - 
             nothing to plot.")
    plot.network(net,
                 usearrows=usearrows, jitter= T,
                 #   mode= "circle",
                 #   mode= "fruchtermanreingold",
                 mode= "kamadakawai", 
                 label=network.vertex.names(net), 
                 displaylabels = displaylabels,
                 boxed.labels= F, 
                 label.pad=0, label.pos= 5, label.cex= label.cex,
                 #  vertex.col=c(rep(rgb(1, 0, 0, 0.6),dim(mymat)[1]),
                 #               rep(rgb(0, 1, 0, 0.6),dim(mymat)[2])),
                 vertex.col=c(rep("coral3", dim(mymat)[1]),
                              rep("darkolivegreen3", dim(mymat)[2])),
                 vertex.cex= vertex.cex,
                 vertex.sides= c(rep(5,dim(mymat)[1]),
                                 rep(20,dim(mymat)[2])),
                 vertex.lty= 0, edge.lty= edge.lty, edge.col= 8, 
                 label.lty= NULL, usecurve = F)
}
