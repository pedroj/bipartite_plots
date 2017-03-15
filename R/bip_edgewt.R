#----------------------------------------------------------------------------
# Compute scaled edge weights for plotting.
# x is a constant helping to scale the edge thickness in the plots;
# just tune it (x parameter) to adequate values for the specific dataset.
#----------------------------------------------------------------------------

edgewt<- function(M, x = 30) {
    # Transpose.
    M <- t(M)
    # Edge list and weights.
    M <- cbind(expand.grid(dimnames(M))[2:1], as.vector(M))
    # Discard null weights.
    M <- subset(M, M[, 3] != 0)
    # Scaled weights.
    M.scaled <- x*log(M[, 3] + 1) / max(log(M[, 3] + 1))
    # Vector of edge weights.
    return(M.scaled)
}
#----------------------------------------------------------------------------
