## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----import-libs, message = FALSE, warning = FALSE----------------------------
library(shar)
library(spatstat)
library(terra)

set.seed(42)

## ----classify_habitats--------------------------------------------------------
landscape_discrete <- classify_habitats(raster = terra::rast(landscape), n = 5, style = "fisher")

## ----randomize_raster, eval = FALSE-------------------------------------------
#  torus_trans <- translate_raster(raster = landscape_discrete)
#  
#  random_walk <- randomize_raster(raster = landscape_discrete, n_random = 39)

## ----randomize_pp, eval = FALSE-----------------------------------------------
#  gamma_test <- fit_point_process(pattern = species_b, process = "cluster", n_random = 39)
#  
#  # (this can takes some time)
#  reconstruction <- reconstruct_pattern(pattern = species_b, n_random = 39,
#                                        e_threshold = 0.05, method = "cluster")

## ----result_import, echo = FALSE, eval = TRUE---------------------------------
random_walk <- unpack_randomized(raster = random_walk)

## ----results------------------------------------------------------------------
results_habitat_association(pattern = species_a, raster = random_walk)

results_habitat_association(pattern = reconstruction, raster = landscape_discrete)

## ----plotting, fig.align = "center", out.height = "100%", out.width = "100%", message = FALSE----
plot(random_walk)

plot(reconstruction, ask = FALSE)

## ----energy, message = FALSE--------------------------------------------------
calculate_energy(pattern = gamma_test, return_mean = TRUE)

calculate_energy(pattern = reconstruction, return_mean = TRUE)

