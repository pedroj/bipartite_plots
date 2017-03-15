#----------------------------------------------------------------------------
# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggnet. 
# It first initializes the bipartite network; then uses the adjacency matrix 
# to compute scaled weighted edges with function edgewt.
# Code from Francois Briatte, using package ggnet.
# DATE: 15Jul2013. Updated to ggnet 11/11/2016.
# ggnet2 automatically detects two-mode graphs from their bipartite network
# attribute. To simplify the plotting of each mode, it understands 
# arguments of the form [alpha, color, shape, size] = "mode", which will 
# mark the primary mode as "actor" and the secondary mode as "event".
# 
#----------------------------------------------------------------------------
#
require(ggnet)
source("./R/bip_edgewt.R")
if(!is.network(M)) stop("Must first initialize the network; use 'bip_init_network.R'.")
#
p<- ggnet(mynet,
          segment.size = bip_edgewt(mymat, 15), segment.alpha = .25,
          label= T, color = "black")
#----------------------------------------------------------------------------
