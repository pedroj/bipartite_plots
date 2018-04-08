`ggbipart`: An `R` package for plotting bipartite networks
========================================================

The `ggbipart` package includes a series of `R` functions aimed to plot bipartite networks. Bipartite networks are a special type of network where nodes are of two distinct types or sets, so that connections (links) only exist among nodes of the different sets.

As in other types of network, bipartite structures can be binary (only the presence/absence of the links is mapped) or quantitative (weighted), where the links can have variable importance or weight.

To plot, we start with an adjacency or incidence matrix. I'm using matrices that illustrate ecological interactions among species, such as the mutualistic interactions of animal pollinators and plant flowers. The two sets (modes) of these bipartite networks are animals (pollinators) and plants species.

From any adjacency matrix we can get a `network` object or an `igraph` object for plotting and analysis. The main function in the package is `bip_ggnet`.

### An unweighted, binary network

This graph uses function `bip_railway`.

```r
# Plot layout coordinates for railway networkplot. Input is the
# adjacency matrix.
#
mymat <- read.delim("./data-raw/data.txt", row.names=1)   # Not run.
g<- bip_railway(mymat, label=T)
g+ coord_flip()

```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot00.png)

### A weighted network with edges labelled

This graph uses function `bip_ggnet`, with labelled edges.

```r
#-----------------------------------------------------------
# Simple graph prototype for a weighted network.
<<<<<<< HEAD

bip= data.frame(P1= c(1, 12, 6, 0),
                P2= c(1, 0, 4, 0),
                P3= c(1, 7, 3, 12),
     row.names= letters[1:4])
col= c("A"= "grey80", "P"= "gold2")
bip.net<- bip_init_network(as.matrix(bip))
=======

bip= data.frame(P1= c(1, 12, 6, 0),
                P2= c(1, 0, 4, 0),
                P3= c(1, 7, 3, 12),
     row.names= letters[1:4])
col= c("A"= "grey80", "P"= "gold2")
bip.net<- bip_init_network(as.matrix(bip))

bip_ggnet(bip.net, as.matrix(bip),
       #  color= "mode", palette = col,
          edge.label = "weights",
          label= TRUE)
#-----------------------------------------------------------
```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot1.png)


### A weighted network with nodes numbered

This graph uses function `bip_ggnet`, with labelling nodes modified with additional `geoms`.

```r
#-----------------------------------------------------------
# Numbered nodes
nums<- as.vector(c(1:sum(dim(nch))))
pp3<- bip_ggnet(nch.net, as.matrix(nch),
          size= 0,
          shape= "mode",
          palette= "Set1",
          color= "mode",
          layout.exp = 0.25) +
          geom_point(aes(color= color), size= 10,
                         color= "white") +
          geom_point(aes(color= color), size= 10,
                         alpha= 0.5) +
          geom_point(aes(color= color), size= 8) +
          geom_text(aes(label= nums),
                        color= "white", size= 3.5,
                        fontface="bold") +
          guides(color= FALSE) +
          theme(legend.position="none")        # Hide legend
pp3
#-----------------------------------------------------------
```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot2.png)


A detailed descripton of the code is in my [git pages](http://pedroj.github.io/bipartite_plots/).
>>>>>>> ggbipart

bip_ggnet(bip.net, as.matrix(bip),
       #  color= "mode", palette = col,
          edge.label = "weights",
          label= TRUE)
#-----------------------------------------------------------
```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot1.png)

<<<<<<< HEAD

### A weighted network with nodes numbered

This graph uses function `bip_ggnet`, with labelling nodes modified with additional `geoms`.

```r
#-----------------------------------------------------------
# Numbered nodes
nums<- as.vector(c(1:sum(dim(nch))))
pp3<- bip_ggnet(nch.net, as.matrix(nch),
          size= 0,
          shape= "mode",
          palette= "Set1",
          color= "mode",
          layout.exp = 0.25) +
          geom_point(aes(color= color), size= 10,
                         color= "white") +
          geom_point(aes(color= color), size= 10,
                         alpha= 0.5) +
          geom_point(aes(color= color), size= 8) +
          geom_text(aes(label= nums),
                        color= "white", size= 3.5,
                        fontface="bold") +
          guides(color= FALSE) +
          theme(legend.position="none")        # Hide legend
pp3
#-----------------------------------------------------------
```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot2.png)


A detailed descripton of the code is in my [git pages](http://pedroj.github.io/bipartite_plots/).

[<img src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png">](https://creativecommons.org/licenses/by-nc/4.0/)

