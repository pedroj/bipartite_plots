# Plotting bipartite networks from adjacency matrix of two-mode network.
# Convert to network object
# Initializing bipartite webs for library network
#
# Read data matrices.
# Read a network
# Creating the objects
mymat <- read.delim("data.txt", row.names=1)
# Where data.txt has weighted adjacency matrix,e.g.,:
Aa    Ab	Ac	Ba	Bb	Bc	Bd	Ca	Cb	Cc	Da
P1	139	112	 9	73	4	14	20	14	5	2	1
P2	184	26	6	19	31	21	17	11	7	5	0
P3	281	74	33	36	18	29	5	9	5	3	0
P4	87	40	38	21	13	12	9	1	1	0	0
P5	100	93	27	12	8	11	32	0	0	0	0
P6	51	25	13	17	9	1	0	0	0	0	0
P7	42	26	16	0	2	0	0	0	0	0	0
P8	31	18	14	15	12	9	7	1	0	0	0
P9	46	12	6	0	3	0	0	0	0	0	0
P10	136	0	0	12	0	2	2	0	0	0	0
P11	130	8	0	5	0	0	0	0	0	0	0

# Use this to copy from the clipboard, after select/copy the above block.
mymat <- read.table(pipe("pbpaste"), header=T, sep= "\t",row.names=1)

# Adjacency matrix is read as tab-separated file with header names, 
# and the first column is taken as the row names.
# These are two of my datasets of well-sampled plant-frugivore interaction
# networks.
#
nch <- read.table("./data/NCH_quant_bmatrix.txt", 
                  header=T, sep="\t", row.names=1,
                  dec=",", na.strings="NA")
hr <- read.table("./data/HR_quant_bmatrix.txt", 
                  header=T, sep="\t", row.names=1,
                  dec=".", na.strings="NA")
#
# -------------------------------------------------------------------------
# This uses function bipinit to initialize the bipartite networks.
nch.net <- bip_netinit(nch) 
hr.net <- bip_netinit(hr)
# -------------------------------------------------------------------------
# Functions to plot netwrok graphs.
# bip_binplot
# bip_qtplot
# bip_gplot
# bip_ggplot
#

# Using ggplot2  ---------------------------------------------------------
#-------------------------------------------------------------------------
# Draft code for plotting a bipartite network in ggplot2
# See bip_pj.R for a function calling directly ggnet.
#.........................................................................
require(network)
require(ggplot2)
require(sna)
require(ergm)
#
# Assign the matrix and the network objects here.
# mymat is a matrix with column names and row names.
# net is a network object.
mymat <- nch
net <- nch.net
#
if(!require(ggplot2)) stop("must first install 'ggplot2' package.")
if(!require(network)) stop("must first install 'igraph' package.")
if(!require(sna)) stop("must first install 'reshape2' package.")
if(!require(ergm)) stop("must first install 'reshape2' package.")
#
# Compute scaled weights, to use later with graphing links.
ewt <- vectorize(mymat)
ewt <- subset(ewt,ewt[,3]!=0)
ewt.scaled <- 30*log(ewt[,3]+1.0) / max(log(ewt[,3]+1.0))
#
# Input the adjacency matrix (mymat) and the network object (net)
m <- as.matrix.network.adjacency(net) # get sociomatrix
# get coordinates from Fruchterman and Reingold's 
# force-directed placement algorithm.
plotcord <- data.frame(gplot.layout.fruchtermanreingold(m, 
                                                        layout.par=NULL)) 
# or get it them from Kamada-Kawai's algorithm: 
# plotcord <- data.frame(gplot.layout.kamadakawai(m, NULL)) 
colnames(plotcord) = c("X1","X2")
edglist <- as.matrix.network.edgelist(net)
edges <- data.frame(plotcord[edglist[,1],], plotcord[edglist[,2],])
colnames(edges) <-  c("X1","Y1","X2","Y2")
edges$midX  <- (edges$X1 + edges$X2) / 2
edges$midY  <- (edges$Y1 + edges$Y2) / 2
plotcord$vnames <- as.factor(network.vertex.names(net))
pnet <- ggplot()  + 
    geom_segment(aes(x=X1, y=Y1, xend = X2, yend = Y2,
                     size = ewt.scaled), 
                 data=edges, colour="grey", alpha=0.4) +
    geom_point(aes(plotcord$X1, plotcord$X2, 
                   color=c(rep("grey90",dim(m)[1]),
                           rep("grey60",dim(m)[2]))), 
               size=10, alpha=0.8) +
    geom_text(aes(plotcord$X1, plotcord$X2), 
              size = 4, #hjust = 0, #vjust=0.5, 
              label = plotcord$vnames) +
    scale_colour_brewer(palette="Set1") +
    scale_x_continuous(breaks = NULL) + 
    scale_y_continuous(breaks = NULL) +
    # discard default grid + titles in ggplot2 
    theme(panel.background = element_blank()) + 
    theme(legend.position="none") +
    theme(axis.title.x = element_blank(), 
          axis.title.y = element_blank()) +
    theme(legend.background = element_rect(colour = NA)) + 
    theme(panel.background = element_rect(fill = "white", 
                                          colour = NA)) + 
    theme(panel.grid.minor = element_blank(), 
          panel.grid.major = element_blank())
print(pnet)
#
# --------------------------------------------------------------------------