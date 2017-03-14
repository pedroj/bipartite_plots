# Plot layout coordinates for railway networkplot
# A matrix whose rows contain the x,y coordinates of the vertices of d.
#
bip_railway <- function (mymat, nodesize=9, label=F) {
        # Coords for mode "A"
        coordA<- cbind(rep(2,dim(mymat)[1]), seq(1, dim(mymat)[1])+2)
        # Coords for mode "P"
        coordP<- cbind(rep(4,dim(mymat)[2]), seq(1, dim(mymat)[2])+2)
        mylayout<- as.matrix(rbind(coordA, coordP))
#
# Initialize and plot the network with a railway layout.
        test.net<- bip_init_network(mymat)
        p<- ggnet2(test.net, mode=mylayout, label=label,
                   size= nodesize, label.size=nodesize/3,
                   layout.exp=1.5) + coord_flip()
        p
        }
