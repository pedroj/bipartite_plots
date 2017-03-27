#----------------------------------------------------------------------------
# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggnet. 
# Inputs are a net object and it corresponding adjacencya matrix.
# It uses the adjacency matrix to compute scaled weighted edges with function
# edgewt.
# Part of the code from Francois Briatte, using package ggnet.
# DATE: 15Jul2013. Updated to ggnet 11/11/2016.
# ggnet2 automatically detects two-mode graphs from their bipartite network
# attribute. To simplify the plotting of each mode, it understands 
# arguments of the form [alpha, color, shape, size] = "mode", which will 
# mark the primary mode as "actor" and the secondary mode as "event".
#----------------------------------------------------------------------------
# Detect and color the mode
# To use the mode of the nodes as the basis for their colors, all 
# the user has to do is to pass the color = "mode" argument, and then to 
# style the  "actor" and "event" values.
#
bip_ggnet<- function(net, mat, mymode= "fruchtermanreingold", 
                     expansion= 0)
{
    source("./R/bip_edgewt.R")
    if(!is.network(M)) stop("Must first initialize the network; use 'bip_init_network.R'.")
    #
    # Set colors for each mode to setup a palette.
    col= c("A"= "grey", "P"= "gold")

    pp<- ggnet2(net,
        shape= "mode",                       label= T,
        color= "mode",                       palette= col, 
        size = 9,                            legend.size = 9,
        mode = mymode,                       label.size= 4,
        layout.par = NULL,                   layout.exp = expansion,
        size.legend = NA,                    label.trim = FALSE, 
        edge.lty = "solid",                  edge.label = NULL,
        edge.size= bip_edgewt(mat, 5),       edge.alpha= 0.25)
    return(pp)
}
#----------------------------------------------------------------------------
