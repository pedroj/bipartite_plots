# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggplot2 ----------------------------------------------------------
#-------------------------------------------------------------------------
# Draft code for plotting a bipartite network in ggplot2
#.........................................................................
require(network)
require(ggplot2)
require(sna)
require(ergm)
#
# Assign the matrix and the network objects here.
# mymat is a matrix with column names and row names.
# net is a network object.
# mymat <- nch    # NOTE: edit and uncomment this line.
# net <- nch.net   # NOTE: edit and uncomment this line.
#
if(!require(ggplot2)) stop("must first install 'ggplot2' package.")
if(!require(network)) stop("must first install 'igraph' package.")
if(!require(sna)) stop("must first install 'reshape2' package.")
if(!require(ergm)) stop("must first install 'reshape2' package.")
#
# Compute scaled weights, to use later with graphing links.
source("./functions/vectorize.R") # Uses my function vectorize
ewt <- vectorize(mymat)
ewt <- subset(ewt,ewt[,3]!=0)
ewt.scaled <- 30*log(ewt[,3]+1.0) / max(log(ewt[,3]+1.0))
#
# Input the adjacency matrix (mymat) and the network object (net)
m <- as.matrix.network.adjacency(net) # get sociomatrix
# get coordinates from Fruchterman and Reingold's 
# force-directed placement algorithm.
plotcord <- data.frame(gplot.layout.fruchtermanreingold(m, 
                                                        layout.par=NULL)) 
# or get it them from Kamada-Kawai's algorithm: 
# plotcord <- data.frame(gplot.layout.kamadakawai(m, NULL)) 
colnames(plotcord) = c("X1","X2")
edglist <- as.matrix.network.edgelist(net)
edges <- data.frame(plotcord[edglist[,1],], plotcord[edglist[,2],])
colnames(edges) <-  c("X1","Y1","X2","Y2")
edges$midX  <- (edges$X1 + edges$X2) / 2
edges$midY  <- (edges$Y1 + edges$Y2) / 2
plotcord$vnames <- as.factor(network.vertex.names(net))
pnet <- ggplot()  + 
    geom_segment(aes(x=X1, y=Y1, xend = X2, yend = Y2,
                     size = ewt.scaled), 
                 data=edges, colour="grey", alpha=0.4) +
    geom_point(aes(plotcord$X1, plotcord$X2, 
                   color=c(rep("grey90",dim(m)[1]),
                           rep("grey60",dim(m)[2]))), 
               size=10, alpha=0.8) +
    geom_text(aes(plotcord$X1, plotcord$X2), 
              size = 4, #hjust = 0, #vjust=0.5, 
              label = plotcord$vnames) +
    scale_colour_brewer(palette="Set1") +
    scale_x_continuous(breaks = NULL) + 
    scale_y_continuous(breaks = NULL) +
    # discard default grid + titles in ggplot2 
    theme(panel.background = element_blank()) + 
    theme(legend.position="none") +
    theme(axis.title.x = element_blank(), 
          axis.title.y = element_blank()) +
    theme(legend.background = element_rect(colour = NA)) + 
    theme(panel.background = element_rect(fill = "white", 
                                          colour = NA)) + 
    theme(panel.grid.minor = element_blank(), 
          panel.grid.major = element_blank())
print(pnet)
#
# --------------------------------------------------------------------------