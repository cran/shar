# context("test-plot_rd_pat")

pattern_random <- fit_point_process(species_a, n_random = 3, verbose = FALSE)

pattern_random_ni <- fit_point_process(species_b, n_random = 3, return_input = FALSE,
                                       verbose = FALSE)

pattern_random_marks <- pattern_random$randomized[[1]]

marks_sub <- spatstat.geom::subset.ppp(species_a, select = dbh)

marks_recon <- reconstruct_pattern_marks(pattern = pattern_random_marks,
                                         marked_pattern = marks_sub,
                                         n_random = 3, max_runs = 1,
                                         verbose = FALSE)

################################################################################

test_that("plot returns plot", {

  expect_null(plot(pattern_random, verbose = FALSE, ask = FALSE))

  expect_null(plot(pattern_random, what = "pp", verbose = FALSE))

})

test_that("plot returns error if observed is missing", {

  expect_error(plot(pattern_random_ni, verbose = FALSE),
               regexp = "Input must include 'observed' pattern.")

})

test_that("plot works for reconstructed marks", {

  expect_null(plot(marks_recon, verbose = FALSE))
  expect_null(plot(marks_recon, what = "pp", verbose = FALSE))

})

test_that("plot returns error if what is wrong", {

  expect_error(plot(pattern_random, what = "wrong", verbose = FALSE),
               regexp = "Please select either what = 'sf' or what = 'pp'.")

})
