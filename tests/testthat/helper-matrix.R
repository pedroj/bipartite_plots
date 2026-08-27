# Shared fixture: a small weighted bipartite adjacency matrix.
# Rows = one mode (e.g. plants A, B), columns = the other mode (a, b, c, d).
# Read the same way the package expects: named rows and columns, with zeros
# marking absent interactions.
make_test_mat <- function() {
  matrix(
    c(3, 2, 0, 0,
      0, 0, 1, 1),
    nrow = 2, byrow = TRUE,
    dimnames = list(c("A", "B"), c("a", "b", "c", "d"))
  )
}
