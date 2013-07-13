# --------------------------------------------------------------------------
# Plotting a bipartite network from the weighted (quantitative) adjacency
# matrix of a two-mode network. Uses objects of type network.
#
bip_qtplot <- function (mat) {
    # Energy, weighted graphs
    ewt <- vectorize(mat)  
    net <- network.initialize(dim(mat)[1] + dim(mat)[2],
                              bipartite = c(dim(mat)[1]), 
                              directed=F)
    net <- network.bipartite(as.matrix(mat), net)
# This scales the weighted links for a better graphing
    ewt.scaled <- log(ewt[,3] + 1.0) / max(log(ewt[,3] + 1.0)) / 2
    plot.network(net,
                 usearrows=FALSE, jitter= T,
                 #   mode= "circle",
                 #   mode= "fruchtermanreingold",
                 mode = "kamadakawai", 
                 label = network.vertex.names(mat1), displaylabels = T,
                 boxed.labels = F,
                 label.pad =0,
                 label.pos = 5,
                 label.cex = 0.5,
                 vertex.col = c(rep("brown2",dim(mat)[1]),
                              rep("darkolivegreen3",dim(mat)[2])), 
                 vertex.cex = 2,
                 vertex.sides = c(rep(5,dim(mat)[1]),
                                 rep(20,dim(mat)[2])),
                 vertex.lty = 1, 
                 edge.lty = 1,
                 # edge.lwd=(ewt[,3])/6,
                 edge.lwd = 25 * (ewt.scaled), # Adjust constant for 
                                               # better line widths
                 edge.col = "grey", edge.curve = 0.2,
                 label.lty = NULL, usecurve = F)
}

