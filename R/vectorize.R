# ----------------------------------------------------------------------------
# [Title]: vectorize function.
# [Date]:  12 Mayo 2008    [Loc]: Sevilla
# Pedro Jordano.
# ----------------------------------------------------------------------------
## First version DATE. Revised DATE
# ----------------------------------------------------------------------------
# STACK: Turn table (C) into (D):
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
# The input matrix should be read with row.names=1 option 
# and a blank entry at the upper left corner.
#-------------------------------------------------------------
vectorize <- function(mat)
{
  mat <- t(mat)
  cbind(expand.grid(dimnames(mat))[2:1], as.vector(mat))
}
