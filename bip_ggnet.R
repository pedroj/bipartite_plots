# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggplot2. Code from Francois Briatte, using his fucntion ggnet.
# DATE: 15Jul2013.
#----------------------------------------------------------------------------
# PJ example. Based on a gist by F Briatte to just feed the network data 
# from its adjacency matrix to ggnet
#
require(downloader)
#
link = "https://raw.github.com/pedroj/bipartite_plots/master/data/NCH_quant_bmatrix.txt"
file = "data/NCH_quant_bmatrix.txt"
if(!file.exists(file)) download(link, file, mode = "wb")
M <- read.table(file, sep = "\t", dec = ",", header = TRUE, row.names = 1) 
#
# Bipartite network initialization, starting from an adjacency matrix. Then,
# plot it with ggnet.
#
source("functions/bip_briatte.R")
source_url("https://raw.github.com/briatte/ggnet/master/ggnet.R", prompt = FALSE)
net = bipartite.network(M, modes = c("one", "two"))
ggnet(net,
      segment.size = edge.weights(M, 15), segment.alpha = .25,
      label = TRUE, color = "black",
      node.group = get.vertex.attribute(net, "mode"))
#............................................................................
