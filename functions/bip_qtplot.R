# --------------------------------------------------------------------------
# Plotting a bipartite network from the weighted (quantitative) adjacency
# matrix of a two-mode network. Uses objects of type network.
#
bip_qtplot<- function (mat) {
    #Energy, weighted graphs
    mymat<-mat
    ewt<-vectorize(mymat)  
    mat1<-network.initialize(dim(mymat)[1]+dim(mymat)[2],
                             bipartite=c(dim(mymat)[1]),directed=F)
    mat1<-network.bipartite(as.matrix(mymat),mat1)
    # png(filename="mymat.wei.png", width = 2000, height = 2000)
    # This scales the weighted links for a better graphing
    ewt.scaled <- log(ewt[,3]+1.0) / max(log(ewt[,3]+1.0))/2
    plot.network(mat1,
                 usearrows=FALSE,jitter= T,
                 #   mode= "circle",
                 #   mode= "fruchtermanreingold",
                 mode= "kamadakawai", 
                 label=network.vertex.names(mat1),displaylabels = T,
                 boxed.labels= F,label.pad=0,label.pos= 5,label.cex= 0.5,
                 vertex.col=c(rep("brown2",dim(mymat)[1]),
                              rep("darkolivegreen3",dim(mymat)[2])), 
                 vertex.cex= 2,
                 vertex.sides= c(rep(5,dim(mymat)[1]),
                                 rep(20,dim(mymat)[2])),
                 vertex.lty=1, edge.lty=1,
                 #            edge.lwd=(ewt[,3])/6,
                 edge.lwd=25*(ewt.scaled), # Adjust constant for 
                                           # better line widths
                 edge.col="grey", edge.curve = 0.2,
                 label.lty=NULL,usecurve = F)
} #.........................................................................
