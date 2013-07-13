# -------------------------------------------------------------------------
# Function bip_binplot, to plot a network object corresponding 
# to a binary adjacency matrix.
# mymat is the adjacency matrix, to get the dimensions from.
# net is a network object corresponding to mymat. The object net can
# be initialized with function bip_init_network.R
#
bip_binplot <- function (mymat, net) {
    #   require(grDevices)
    if(!is.matrix(mymat)) mymat <- as.matrix(mymat)
    if (!is.network(net)) 
        stop("plot.network requires a network object.")
    if (network.size(net) == 0) 
        stop("plot.network called on a network of order zero - 
             nothing to plot.")
    plot.network(net,
                 usearrows=FALSE, jitter= T,
                 #   mode= "circle",
                 #   mode= "fruchtermanreingold",
                 mode= "kamadakawai", 
                 label=network.vertex.names(net), 
                 displaylabels = T,
                 boxed.labels= F, 
                 label.pad= 0, 
                 label.pos= 5, 
                 label.cex= 0.6,
                 #  vertex.col=c(rep(rgb(1, 0, 0, 0.6),dim(mymat)[1]),
                 #               rep(rgb(0, 1, 0, 0.6),dim(mymat)[2])),
                 vertex.col=c(rep("coral3", dim(mymat)[1]),
                              rep("darkolivegreen3", dim(mymat)[2])),
                 vertex.cex= 2,
                 vertex.sides= c(rep(5, dim(mymat)[1]),
                                 rep(20, dim(mymat)[2])),
                 vertex.lty= 0, 
                 edge.lty= 0.7, 
                 edge.col= 8, 
                 label.lty= NULL,
                 usecurve = FALSE)
}
