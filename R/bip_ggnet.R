#----------------------------------------------------------------------------
#' Plotting bipartite networks from adjacency matrix of a two-mode network.
#'
#' @import ggplot2
#' @param net the network object. Either a two-mode object of class
#'   \code{network} (e.g. as returned by \code{bip_init_network}) or a bipartite
#'   object of class \code{igraph} (e.g. as returned by \code{bip_init_igraph}).
#'   igraph input is converted internally to a two-mode \code{network} object.
#' @param mat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#'   Optional: if not supplied it is extracted from \code{net}, using the
#'   edge weights when present.
#' @param mode the type of energy-minimization algorithm to plot the network. By default it's mode= "fruchtermanreingold".
#'
#' @param mode1 name for the upper mode (matrix rows), used when \code{net} is
#'   an igraph object that must be converted.
#' @param mode2 name for the lower mode (matrix columns), used when \code{net}
#'   is an igraph object that must be converted.
#'
#' @param size Specify size for nodes.
#' @param palette Define the color palette to use.
#' @param color Node color.
#' @param label.size Size for node text labels.
#' @param label Whether or not add node labels.
#' @param shape Geometric shape to be used for nodes.
#' @param edge.label Whether or not add edge labels.
#' @param layout.exp Layout information.
#'
#' @details Inputs are a net object and its corresponding adjacency matrix. It uses the adjacency matrix to compute scaled weighted edges with function edgewt.
#' Part of the code from Francois Briatte, using package ggnet. DATE: 15Jul2013. Updated to ggnet 11/11/2016.
#' ggnet2 automatically detects two-mode graphs from their bipartite network attribute. To simplify the plotting of each mode, it understands arguments of the form [alpha, color, shape, size] = "mode", which will mark the primary mode as "actor" and the secondary mode as "event".
#' #----------------------------------------------------------------------------
#' Detect and color the mode
#' To use the mode of the nodes as the basis for their colors, all the user has 
#' to do is to pass the color = "mode" argument, and then to style the "actor"
#' and "event" values.
#' #---------------------------------------------------------------------------
#'
#' @return A ggplot object.
#' @export
#'
#' @examples
#' mat <- as.matrix(read.csv(
#'     system.file("extdata", "sdw02_adj_fru.csv", package = "ggbipart"),
#'     comment.char = "#", row.names = 1, check.names = FALSE))
#' net <- bip_init_network(mat)
#' bip_ggnet(net, mat)
#' # igraph input works too, and the matrix can be omitted
#' g <- bip_init_igraph(mat)
#' bip_ggnet(g)
#------------------------------------------------------------------------------
bip_ggnet<- function(net, mat, mode= "fruchtermanreingold", size= 9,
                     palette= c("A"= "grey", "P"= "gold"), color= "mode",
                     label.size=3, label= T, shape= "mode",
                     edge.label = NULL,
                     layout.exp= 0, mode1= "P", mode2= "A")
{
#    source("./R/bip_edgewt.R")
    # Accept either a two-mode 'network' object or a bipartite 'igraph' object.
    if(inherits(net, "igraph")) {
        if(!igraph::is_bipartite(net))
            stop("The igraph object must be bipartite (a logical 'type' vertex attribute); use 'bip_init_igraph.R'.")
        wattr <- if("weight" %in% igraph::edge_attr_names(net)) "weight" else NULL
        imat <- igraph::as_biadjacency_matrix(net, attr = wattr, sparse = FALSE)
        if(missing(mat) || is.null(mat)) mat <- imat
        net <- bip_init_network(imat, mode1 = mode1, mode2 = mode2)
    } else if(network::is.network(net)) {
        if(missing(mat) || is.null(mat)) {
            wattr <- if("weights" %in% network::list.edge.attributes(net)) "weights" else NULL
            # For a two-mode network this returns the rectangular
            # rows-by-columns matrix, i.e. the original adjacency matrix.
            mat <- network::as.matrix.network(net, matrix.type = "adjacency",
                                              attrname = wattr)
        }
    } else {
        stop("'net' must be a two-mode 'network' object (use 'bip_init_network.R') or a bipartite 'igraph' object (use 'bip_init_igraph.R').")
    }
    if(!is.matrix(mat)) mat <- as.matrix(mat)
    #
    # 'palette' maps the two node modes to colours; see the default above.
    pp<- GGally::ggnet2(net,
        shape= shape,                        label= label,
        color= color,                        palette= palette,
        size = size,                         legend.size = 9,
        mode = mode,                         label.size= 4,
        layout.par = NULL,                   layout.exp = layout.exp,
        size.legend = NA,                    label.trim = FALSE,
        edge.lty = "solid",                  edge.label = edge.label,
        edge.size= bip_edgewt(mat, 5),       edge.alpha= 0.20)
    return(pp)
}
#------------------------------------------------------------------------------

