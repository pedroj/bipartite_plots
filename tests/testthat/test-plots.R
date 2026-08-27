# Smoke tests for the plotting functions.
#
# These assert only that each plotter runs without error on a valid input
# (and rejects invalid input where it is documented to). They do NOT check
# the visual appearance of the output -- that would need snapshot testing
# (e.g. the 'vdiffr' package). Base-graphics plotters are exercised on a
# throwaway PDF device so nothing is drawn to screen.

# --- base-graphics plotters: run on a null device -------------------------

test_that("bip_qtplot() draws without error", {
  skip_if_not_installed("network")
  m <- make_test_mat()
  pdf(tempfile(fileext = ".pdf"))
  on.exit(dev.off(), add = TRUE)
  expect_no_error(bip_qtplot(m))
})

test_that("bip_binplot() draws without error from a network object", {
  skip_if_not_installed("network")
  m <- make_test_mat()
  net <- bip_init_network(m)
  pdf(tempfile(fileext = ".pdf"))
  on.exit(dev.off(), add = TRUE)
  expect_no_error(bip_binplot(m, net))
})

test_that("bip_binplot() rejects a non-network object", {
  m <- make_test_mat()
  expect_error(bip_binplot(m, net = m), "network object")
})

test_that("bip_igplot() draws without error from an igraph object", {
  skip_if_not_installed("igraph")
  m <- make_test_mat()
  g <- bip_init_igraph(m)
  pdf(tempfile(fileext = ".pdf"))
  on.exit(dev.off(), add = TRUE)
  expect_no_error(bip_igplot(m, g))
})

test_that("bip_igplot() rejects a non-igraph object", {
  m <- make_test_mat()
  expect_error(bip_igplot(m, g = m), "graph object")
})

# --- GGally plotters: return a ggplot object ------------------------------

test_that("bip_railway() returns a ggplot object", {
  skip_if_not_installed("GGally")
  m <- make_test_mat()
  p <- bip_railway(m)
  expect_s3_class(p, "ggplot")
})

test_that("bip_ggnet() returns a ggplot object", {
  skip_if_not_installed("GGally")
  m <- make_test_mat()
  net <- bip_init_network(m)
  p <- bip_ggnet(net, m)
  expect_s3_class(p, "ggplot")
})

test_that("bip_ggnet() requires a network object", {
  m <- make_test_mat()
  expect_error(bip_ggnet(m, m), "initialize the network")
})
