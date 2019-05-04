#----------------------------------------------------------------------------
#' Plotting bipartite networks from adjacency matrix of a two-mode network.
#'
#' @import ggplot2
#' @import ggnet2
#' @param net the net object
#' @param mat the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.
#' @param mode the type of energy-minimization algorithm to plot the network. By default it's mode= "fruchtermanreingold".
#' #' @param ... other usual parameters for plotting (e.g., size, label, palette, etc.).
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
#' To use the mode of the nodes as the basis for their colors, all the user has to do is to pass the color = "mode" argument, and then to style the  "actor" and "event" values.
#' #---------------------------------------------------------------------------
#'
#' @return A vector of scaled edge weights for plotting.
#' @export
#'
#' @examples
#' #------------------------------------------------------------------------
#' # Example:      ## NOT RUN
#' # pp +
#' #   geom_point(aes(color = color), size = 12, color = "white") +
#' #   geom_point(aes(color = color), size = 12, alpha = 0.5) +
#' #   geom_point(aes(color = color), size = 9) +
#' #   geom_text(aes(label= network.vertex.names(net)), color = "black") +
#' #   guides(color = FALSE)
#' #### NOT RUN
#' #------------------------------------------------------------------------
#------------------------------------------------------------------------------
bip_ggnet<- function(net, mat, mode= "fruchtermanreingold", size= 9,
                     palette= col, color= "mode",
                     label.size=3, label= F, shape= "mode",
                     edge.label = NULL,
                     layout.exp= 0)
{
#    source("./R/bip_edgewt.R")
    if(!is.network(net)) stop("Must first initialize the network; use 'bip_init_network.R'.")
    #
    # Set colors for each mode to setup a palette.
    col= c("A"= "grey", "P"= "gold")

    pp<- ggnet2(net,
        shape= shape,                       label= label,
        color= color,                        palette= palette,
        size = size,                         legend.size = 9,
        mode = mode,                         label.size= 4,
        layout.par = NULL,                   layout.exp = layout.exp,
        size.legend = NA,                    label.trim = FALSE,
        edge.lty = "solid",                  edge.label = edge.label,
        edge.size= bip_edgewt(mat, 5),       edge.alpha= 0.25)
    return(pp)
}
#------------------------------------------------------------------------------

