# Plotting bipartite networks from adjacency weighted matrix 
# of two-mode network.
# A modified version, with igraph -------------------------------------------
#
# Requires input of the weighted "mymmat" matrix and its graph object, "g".
bip_gplot <- function (mymat, g) {
    ewt<-vectorize(mymat)  
    ewt.scaled <- log(ewt[,3]+1.0) / max(log(ewt[,3]+1.0))
    if (!is.igraph(g)) 
        stop("bip_gplot requires a graph object.")
    igraph.options(label.dist= 0, label.degree= pi/2, label.cex= 1,
                   label.family= "mono",
                   edge.lty= 1, curved= 0.5,
                   edge.color= rgb(0, 0, 0, 0.5),
                   verbose=TRUE)
    plot(g,
         layout= layout.kamada.kawai,
         # vertex.color=c(rep(c("coral3",alpha=0.6), dim(mymat)[1]),
         #          rep(c("darkolivegreen3",alpha=0.6), dim(mymat)[2])),
         vertex.color=c(rep(rgb(0.8, 0.1, 0, 0.8), dim(mymat)[1]),
                        rep(rgb(0, 0.8, 0.2, 0.8), dim(mymat)[2])),
         #        mark.col= c("coral3","darkolivegreen3"),
         vertex.size= 12,
         vertex.shape= c(rep("square",dim(mymat)[1]),
                         rep("circle",dim(mymat)[2])),
         edge.width=25*(ewt.scaled)) # Adjust constant for 
    # better line widths
    #        edge.width=E(g)$weight/20)
}
