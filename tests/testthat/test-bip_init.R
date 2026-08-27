test_that("bip_init_igraph() builds a weighted bipartite igraph object", {
  skip_if_not_installed("igraph")
  m <- make_test_mat()
  g <- bip_init_igraph(m)

  expect_true(igraph::is_igraph(g))
  # One vertex per row + column node.
  expect_equal(igraph::vcount(g), nrow(m) + ncol(m))
  # One edge per non-zero interaction.
  expect_equal(igraph::ecount(g), sum(m != 0))
  # Bipartite membership stored in the "type" vertex attribute.
  expect_true("type" %in% igraph::vertex_attr_names(g))
  # Weights carried on the edges.
  expect_true("weight" %in% igraph::edge_attr_names(g))
})

test_that("bip_init_network() builds a bipartite network object", {
  skip_if_not_installed("network")
  m <- make_test_mat()
  net <- bip_init_network(m, mode1 = "P", mode2 = "A")

  expect_true(network::is.network(net))
  # A vertex for every row and column node.
  expect_equal(network::network.size(net), nrow(m) + ncol(m))
})

test_that("bip_init_network() accepts a data.frame input", {
  skip_if_not_installed("network")
  m <- as.data.frame(make_test_mat())
  net <- bip_init_network(m)
  expect_true(network::is.network(net))
})
