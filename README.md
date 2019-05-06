`ggbipart`: An `R` package for plotting bipartite networks
========================================================

The `ggbipart` package includes a series of `R` functions aimed to plot bipartite networks. Bipartite networks are a special type of network where nodes are of two distinct types or sets, so that connections (links) only exist among nodes of the different sets.

As in other types of network, bipartite structures can be binary (only the presence/absence of the links is mapped) or quantitative (weighted), where the links can have variable importance or weight.

To plot, we start with an adjacency or incidence matrix. I'm using matrices that illustrate ecological interactions among species, such as the mutualistic interactions of animal pollinators and plant flowers. The two sets (modes) of these bipartite networks are animals (pollinators) and plants species.

From any adjacency matrix we can get a `network` object or an `igraph` object for plotting and analysis. The main function in the package is `bip_ggnet`.

### Installation.

```r
devtools::install_github("pedroj/bipartite_plots")
library(ggbipart)

```

### An unweighted, binary network

This graph uses function `bip_railway`.

```r
# Plot layout coordinates for railway networkplot. Input is the
# adjacency matrix.
#
mymat <- read.delim("./data/data.txt", row.names=1)   # Not run.
g<- bip_railway(mymat, label=T)
g+ coord_flip()

```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot00.png)

### A weighted network with edges labelled

This graph uses function `bip_ggnet`, with labelled edges.

```r
#-----------------------------------------------------------
# Simple graph prototype for a weighted network.

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
#
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
#
```
![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot2.png)


A detailed descripton of the code is in my [git pages](http://pedroj.github.io/bipartite_plots/).

![bip_ggnet1](http://pedroj.github.io/bipartite_plots/images/Rplot1.png)


### Plant-animal interactions network datasets

### _WORKING ON IT!!!!_

My network datasets, with metadata. A repository of my own data on plant-animal interaction networks, to keep them centralized and readily updated.

Most of these data are available in other public repositories or as Supplementary Data in papers already published. As a live and continuously improving project, some of these network datasets, are updated with new records and field observations. Thus, relatively minor changes have been made to the datasets since the early publications. This repository includes the most updated datasets.

In addition, I'm also collecting here other published data on plant-animal interaction networks. These are readily available in other public repositories (e.g., [NCEAS](http://www.nceas.org/)).

The datasets include  filenames with different codes:
- `sd`: seed dispersal.
- `po`: pollination.
- `b##`: binary network.
- `w##`: weighted network.
- `_adj`: adjacency matrix).
- `_fru`: weights based on number of fruits eaten (usually for adjacency matrices derived from faecal samples).
- `_vis`: weights based on visitation data; visit data can be also re-weighted by no. fruits per visit, resulting in total feeding records (one feedig record= one fruit "touched").
- `frqapp`: weights based on frequency of appearance (usually for adjacency matrices derived from faecal samples).
For some networks, both the binary and weighted matrices are provided.

#### Seed dispersal networks
```
- sdw01 PJordano_Spain_NCH.     Nava de las Correhuelas, Sierra de
                                Cazorla, Segura y Las Villas, Jaén,
                                Spain. Binary and weighted.
- sdw02 PJordano_Spain_HR.      Hato Ratón, Sevilla, Spain. Binary and weighted.
- sdw03 PJordano_Spain_NNOG.    Nava Noguera, Sierra de Cazorla,
                                Segura y Las Villas, Jaén, Spain.
- sdw04 PJordano_Spain_SNev.    Campos de Otero, Sierra Nevada,
                                Granada, Spain.
- sdw05 PJordano_Spain_Donana.  Sabinar del Marqués, Reserva
                                Biológica de Doñana, Huelva, Spain.
- sdw06 PJordano_Spain_SBaz.    Santa Bárbara, Baza, Granada,
                                Spain.
- sdw07 PJordano_Spain_TRA.     Cañada del Travino, Sierra de
                                Cazorla, Segura y Las Villas,
                                Jaén, Spain.
                                
```

#### Pollination networks

### _WORKING ON IT!!!!_

```
pow01

```

#### Others

### _WORKING ON IT!!!!_

```
- data.txt                      A simple adjacency matrix example. Not empirical data.

```



A detailed descripton of all the above code is in my [git pages](http://pedroj.github.io/bipartite_plots/).

[<img src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png">](https://creativecommons.org/licenses/by-nc/4.0/)

