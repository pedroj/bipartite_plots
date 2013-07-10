Plotting bipartite networks
========================================================

A detailed descripton of the code is in my [git pages](http://pedroj.github.io/bipartite_plots/).

This is a series of `R` script files aimed to plot bipartite networks. Bipartite networks are a special type of network where nodes are of two distinct types or sets, so that connections (links) only exist among nodes of the different sets.

As in other types of network, bipartite strucures can be binary (only the presence/absence of the links is mapped) or quantitative (weighted), where the links can have variable importance or weight.

To plot, we start with an adjacency or incidence matrix. I'm using matrices that illustrate ecological interactions among species, such as the mutualisttic interactions of animal pollinators and plant flowers. The two sets (modes) of these bipartite netwroks are animals (pollinators) and plants species.

From any adjacency matrix we can get a `network` object or an `igraph` object for plotting and analysis. 

<img src="images/ggplot_prototype2.png" alt="plot of chunk ggplot_prototype" />

