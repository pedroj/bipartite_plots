#' Function to plot layout coordinates for railway network plot.
#' @import network
#' @param mymat A matrix whose rows contain the x,y coordinates of the vertices of d.
#' @details Plotting a bipartite network from the weighted (quantitative) adjacency matrix of a two-mode network.
#'
#' # Code for separately nudging and rotating labels of modes.
#'   geom_text(aes(label= network.vertex.names(test.net)),
#  # Rotate and nudge the two modes.
#'    angle<- ifelse(network.vertex.names(test.net)[1:dim(mymat)[1]], 0, 45),
#'    nudge_x<- ifelse(network.vertex.names(test.net)[1:dim(mymat)[1]], 0.5, -0.5))
#'
#' @return A plot object.
#'
#' @examples
#' #------------------------------------------------------------------------
#' #### NOT RUN # Working on it.
#' #------------------------------------------------------------------------
#---------------------------------------------------------------------------
bip_railway <- function (mymat, nodesize=9, label=F) {
        # Coords for mode "A"
        coordP<- cbind(rep(2,dim(mymat)[1]), seq(1, dim(mymat)[1])+2)
        # Coords for mode "P"
        coordA<- cbind(rep(4,dim(mymat)[2]), seq(1, dim(mymat)[2])+2)
        mylayout<- as.matrix(rbind(coordP, coordA))
#
# Initialize and plot the network with a railway layout.
        test.net<- bip_init_network(mymat)
        p<- ggnet2(test.net, mode=mylayout, label=label,
                    size= nodesize, label.size=nodesize/3,
        #
        # Code for separately nudging and rotating labels of modes.
        #    geom_text(aes(label= network.vertex.names(test.net)),
        #        # Rotate and nudge the two modes.
        #    angle<- ifelse(network.vertex.names(test.net)[1:dim(mymat)[1]], 0, 45),
        #    nudge_x<- ifelse(network.vertex.names(test.net)[1:dim(mymat)[1]], 0.5, -0.5))
                layout.exp=1.5) +
            coord_flip()
        p
}

