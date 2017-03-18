`ggbipart`: An `R` package for plotting bipartite networks
========================================================

A series of `R` functions aimed to plot bipartite networks. The functions extensively rely on the [`ggnet`](https://briatte.github.io/ggnet/) and [`ggplot2`](http://ggplot2.org/) packages. 

Bipartite networks are a special type of network where nodes are of two distinct types or sets, so that connections (links) only exist among nodes of the different sets.

As in other types of network, bipartite strucures can be binary (only the presence/absence of the links is mapped) or quantitative (weighted), where the links can have variable importance or weight.

To plot, we start with an adjacency or incidence matrix. I'm using matrices that illustrate ecological interactions among species, such as the mutualistic interactions of animal pollinators and plant flowers. The two sets (modes) of these bipartite networks are animals (pollinators) and plants species.

From any adjacency matrix we can get a `network` object or an `igraph` object for plotting and analysis. 

Code in the file `bip_ggnet.R` calls the functions which initialize a weighted bipartite network from its adjacency matrix and scale the edge weights. Then plots the network using function `ggnet2.R`. 

A detailed descripton of the code is in my [git pages](http://pedroj.github.io/bipartite_plots/).
