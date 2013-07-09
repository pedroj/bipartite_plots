# Function to initialize a bipartite web for library network (type network),
# starting from an adjacency matrix.
bip_init_network <- function (mymat) {
    mat2 <- network.initialize(dim(mymat)[1]+dim(mymat)[2],
                               bipartite=c(dim(mymat)[1]), directed=F)
    network.bipartite(as.matrix(mymat),mat2, 
                      names.eval=list(row.names(mymat), colnames(mymat),
                      set.vertex.attribute(mat2,"mode",
                      c(rep("A",dim(mymat)[1]),
                      rep("P",dim(mymat)[2])))))
}
