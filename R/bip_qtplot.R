#' Function to plot a bipartite weighted network.
#'
#' @import network
#' @param mat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#' @details Plotting a bipartite network from the weighted (quantitative) adjacency
# matrix of a two-mode network. Uses objects of type network and a traditional plot.
#'
#' @return A plot object.
#'
#' @examples
#' #------------------------------------------------------------------------
#' #### NOT RUN # Working on it.
#' #------------------------------------------------------------------------
#---------------------------------------------------------------------------
bip_qtplot <- function (mat) {
    # Energy, weighted graphs
    ewt <- vectorize(mat)
    net <- network(mat,
                   matrix.type = "bipartite",
                   ignore.eval = FALSE,
                   # names.eval = "weights")
                   names.eval=list(row.names(mat), colnames(mat)))
# This scales the weighted links for a better graphing
    ewt.scaled <- log(ewt[,3] + 1.0) / max(log(ewt[,3] + 1.0)) / 2
    plot.network(net,
                 usearrows=FALSE, jitter= T,
                 #   mode= "circle",
                 mode= "fruchtermanreingold",
                 #mode = "kamadakawai",
                 label = network.vertex.names(net), displaylabels = T,
                 boxed.labels = F,
                 label.pad =0,
                 label.pos = 5,
                 label.cex = 1,
                 vertex.col = c(rep("#FC9272",dim(mat)[1]),
                              rep("#9ECAE1",dim(mat)[2])),
                 vertex.cex = 3,
                 vertex.sides = c(rep(5,dim(mat)[1]),
                                 rep(20,dim(mat)[2])),
                 vertex.lty = 1,
                 edge.lty = 1,
                 # edge.lwd=(ewt[,3])/6,
                 edge.lwd = 25 * (ewt.scaled), # Adjust constant for
                                               # better line widths
                 edge.col = "#D9D9D9", edge.curve = 0.01,
                 label.lty = NULL, usecurve = T)
}
#---------------------------------------------------------------------------
