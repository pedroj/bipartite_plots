Plotting bipartite networks
========================================================

This is a series of `R` script files aimed to plot bipartite networks. Bipartite networks are a special type of network where nodes are of two distinct types or sets, so that connections (links) only exist among nodes of the different sets.

As in other types of network, bipartite strucures can be binary (only the presence/absence of the links is mapped) or quantitative (weighted), where the links can have variable importance or weight.

To plot, we start with an adjacency or incidence matrix. I'm using matrices that illustrate ecological interactions among species, such as the mutualisttic interactions of animal pollinators and plant flowers. The two sets (modes) of these bipartite netwroks are animals (pollinators) ans plants species.

From any adjacency matrix we can get a `network` object or an `igraph` object for plotting and analysis. 

-----------------------------------------------------------------------------
### Required packages

```r
require(network)
require(igraph)
require(sna)
require(ggplot2)
require(sna)
require(ergm)

```


Here I plot bipartite networks from their adjacency matrices, i.e., the two-mode networks.

### Initializing bipartite webs for library network


```r
#-------------------------------------------------------------------------
# Read data matrices.
# Read a network
# Creating the objects. Example input from the clipboard. 
mymat <- read.delim("data.txt", row.names=1)
#
# Where data.txt has a weighted adjacency matrix, e.g.,:
    Aa	Ab	Ac	Ba	Bb	Bc	Bd	Ca	Cb	Cc	Da
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

```


The adjacency matrix is read as tab-separated file with header names, and the first column is taken as the row names. These are two of my datasets of well-sampled plant-frugivore interaction networks from S Spain, read in the usual way.


```r
#
# -------------------------------------------------------------------------
# The Nava de las Correhuelas dataset.
nch <- read.table("./data/NCH_quant_bmatrix.txt", header = T, sep = "\t", row.names = 1, 
    dec = ",", na.strings = "NA")
# The Hato Raton dataset.
hr <- read.table("./data/HR_quant_bmatrix.txt", header = T, sep = "\t", row.names = 1, 
    dec = ".", na.strings = "NA")
    
```


----------------------------------------------------------------------------
Here I use my function `bip_init` to initialize the bipartite networks.


```r
source("./functions/bip_init_network.R")
source("./functions/bip_init_igraph.R")
nch.net <- bip_init_network(nch)
hr.net <- bip_init_network(hr)

```

----------------------------------------------------------------------------
### Functions to plot network graphs

#### bip_binplot
Simple function to plot a binary bipartite network in `network`. Its inputs are the adjacency matrix, to get the dimensions from, and the network object corresponding to the matrix. The object net can be initialized with function `bip_init_network.R`.

#### bip_qtplot
Function to plot a weighted bipartite network in `network` object. The input is just the weighted (quantitative) adjacency matrix of a two-mode network. Uses objects of type network.

#### bip_gplot
Function to plot a weighted bipartite network in `igraph`. Its inputs are the adjacency matrix, to get the dimensions from, and the igraph object corresponding to the matrix.

#### bip_ggplot
This is just a prototype of function. I'm using it as raw code for now. You assign the matrix and network object at the start (see below). 
In addition, my function `vectorize` is needed in the section using `ggplot2`. I'm including it herewith just for illustration.

A better implementation is to use F. Briatte's `ggnet` function (see example below), which uses my initialization codes and the modifications to get the bipartite networks in `ggplot2`.


```r
# Sourcing required functions and initializing the net objects.
source("./functions/bip_binplot.R")
source("./functions/bip_gplot.R")
source("./functions/bip_qtplot.R")
source("./functions/vectorize.R")

```


----------------------------------------------------------------------------
### Using ggplot2
#### Draft code for plotting a bipartite network in ggplot2

The code for `ggplot2` is in the file `bip_ggplot2.R`. It is not a function
yet. I'm using the `gplot.layout.fruchtermanreingold` layout, but just tweak the code to get a Kamada-Kawai ordination, for example. We just source this file after assigning the input adjacency matrix and
the input graph:


```r
#
# -------------------------------------------------------------------------
require(network)
require(ggplot2)
require(sna)
require(ergm)
#
# -------------------------------------------------------------------------
# Assign the matrix and the network objects here.  mymat is a matrix with
# column names and row names.  net is a network object.  This is for the
# Nava de las Correhuelas network.
# -------------------------------------------------------------------------
mymat <- nch
net <- nch.net
# Now we source the bip_ggplot2.R file
source("bip_ggplot2.R")

```

![plot of chunk ggplot_prototype](figure/ggplot_prototype1.png) 

```r
# We repeat for the Hato Raton network.
mymat <- hr
net <- hr.net
source("bip_ggplot2.R")
```

![plot of chunk ggplot_prototype](figure/ggplot_prototype2.png) 


### Using François Briatte's `ggnet` function


```r
#
# -------------------------------------------------------------------------
# Plotting bipartite networks from adjacency matrix of two-mode network.
# Using ggplot2. Code from Francois Briatte, using his fucntion ggnet.
# DATE: 15Jul2013.
require(downloader)

```

```
## Loading required package: downloader
```

```r
# PJ example. Based on a gist by F Briatte to just feed the network data
# from its adjacency matrix to ggnet
# -------------------------------------------------------------------------
link = "https://raw.github.com/pedroj/bipartite_plots/master/data/sdw01_adj_fru.csv"
file = "data/NCH_quant_bmatrix.txt"
if (!file.exists(file)) download(link, file, mode = "wb")
M <- read.table(file, sep = "\t", dec = ",", header = TRUE, row.names = 1)
# ...  Bipartite network initialization, starting from a weighted
# adjacency matrix.  ...
source("functions/bip_briatte.R")
source_url("https://raw.github.com/briatte/ggnet/master/ggnet.R", prompt = FALSE)
# ...  Pass the network, edge weights and mode to ggnet.  ...
net = bipartite.network(M, modes = c("Animals", "Plants"))
ggnet(net, segment.size = edge.weights(M, 15), segment.alpha = 0.35, label = TRUE, 
    color = "black", node.group = get.vertex.attribute(net, "mode"))
    
```

```
## Loading required package: grid
```

```
## Loading required package: RColorBrewer
```

![plot of chunk ggnet_plot](figure/ggnet_plot.png) 



