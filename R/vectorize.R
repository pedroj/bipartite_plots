# ----------------------------------------------------------------------------
# [Title]: vectorize function.
# [Date]:  May/12/2008    [Loc]: Sevilla
# Pedro Jordano.
# ----------------------------------------------------------------------------
## First version Mar/3/2006. Revised Sep/21/2016
# ----------------------------------------------------------------------------
# STACK: Turn table (C) into (D):
# The input matrix should be read with row.names=1 option 
# and a blank entry at the upper left corner.
#
# C
#    a  b  c  d
# A  3  2  .  .
# B  .  .  1  1

# D
# A  a  3
# A  b  2
# A  c  .
# A  d  .
# B  a  .
# B  b  .
# B  c  1
# B  d  1
#-------------------------------------------------------------
vectorize <- function(mat)
{
  mat <- t(mat)
  cbind(expand.grid(dimnames(mat))[2:1], as.vector(mat))
}
