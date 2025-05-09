% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bip_binplot.R
\name{bip_binplot}
\alias{bip_binplot}
\title{Function bip_binplot, to plot a network object corresponding
to a binary adjacency matrix.}
\usage{
bip_binplot(
  mymat,
  net,
  usearrows = FALSE,
  mode = "kamadakawai",
  displaylabels = T,
  label.cex = 0.6,
  vertex.cex = 1,
  edge.lty = 0.7
)
}
\arguments{
\item{mymat}{the adjacency matrix. Input can be a data.frame or a matrix, representing the adjacency matrix.}

\item{net}{a network object.}

\item{usearrows}{a ntework object.}

\item{mode}{mde of the network object.}

\item{displaylabels}{whether or not display the node labels.}

\item{label.cex}{size of label fonts.}

\item{vertex.cex}{size of nodes.}
}
\value{
A plot object.
}
\description{
mymat is the adjacency matrix, to get the dimensions from.
net is a network object corresponding to mymat. The object net can
be initialized with function bip_netinit.R
}
\details{
Plot of a network object corresponding to a binary adjacency matrix (qualitative, presence-absence, data.
}
\examples{
#------------------------------------------------------------------------
# Working on it.
#------------------------------------------------------------------------
}
