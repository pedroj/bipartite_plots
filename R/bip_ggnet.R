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
test.net<- bip_init_network(mymat)
mynet<-nch.net
#

# Detect and color the mode
# To use the mode of the nodes as the basis for their colors, all 
# the user has to do is to pass the color = "mode" argument, and then to 
# style the  "actor" and "event" values.
#
# Set colors for each mode to setup a palette.
col= c("actor"= "grey", "event"= "gold")

p<- ggnet2(nch.net,
    shape= "mode", label= T,
    color= "mode", palette= col, 
    edge.size= bip_edgewt(nch, 5), edge.alpha= 0.25)

#----------------------------------------------------------------------------


