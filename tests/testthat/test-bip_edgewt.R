test_that("bip_edgewt() returns one scaled weight per non-zero interaction", {
  m <- make_test_mat()
  e <- bip_edgewt(m, x = 30)

  # Four non-zero cells in the fixture -> four edge weights.
  expect_type(e, "double")
  expect_length(e, sum(m != 0))

  # Zeros are dropped, so all weights are strictly positive.
  expect_true(all(e > 0))
})

test_that("bip_edgewt() scales the largest weight to x", {
  m <- make_test_mat()
  expect_equal(max(bip_edgewt(m, x = 30)), 30)
  expect_equal(max(bip_edgewt(m, x = 10)), 10)
})

test_that("bip_edgewt() accepts a data.frame input", {
  m <- make_test_mat()
  e_mat <- bip_edgewt(m, x = 30)
  e_df  <- bip_edgewt(as.data.frame(m), x = 30)
  expect_equal(e_df, e_mat)
})
