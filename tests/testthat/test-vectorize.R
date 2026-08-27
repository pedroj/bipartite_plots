test_that("vectorize() turns an adjacency matrix into a long edge table", {
  m <- make_test_mat()
  v <- vectorize(m)

  # Returns a data.frame with one row per matrix cell (2 rows x 4 cols = 8).
  expect_s3_class(v, "data.frame")
  expect_equal(nrow(v), length(m))
  expect_equal(ncol(v), 3L)

  # Third column holds the interaction weights, matching the matrix values
  # in row-major order after the internal transpose (A-a, A-b, ... B-c, B-d).
  expect_equal(v[[3]], c(3, 2, 0, 0, 0, 0, 1, 1))

  # First two columns carry the row/column names of the matrix.
  expect_setequal(as.character(unique(v[[1]])), rownames(m))
  expect_setequal(as.character(unique(v[[2]])), colnames(m))
})

test_that("vectorize() preserves total weight", {
  m <- make_test_mat()
  v <- vectorize(m)
  expect_equal(sum(v[[3]]), sum(m))
})
