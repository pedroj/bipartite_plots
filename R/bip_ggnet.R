#----------------------------------------------------------------------------
# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggnet. 
# It first initializes the bipartite network; then uses the adjacency matrix 
# to compute scaled weighted edges with function edgewt.
# Code from Francois Briatte, using package ggnet.
# DATE: 15Jul2013. Updated to ggnet 11/11/2016.
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
