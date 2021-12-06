## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_libraries_hidden, eval = TRUE, echo = FALSE, message = FALSE, results = "hide"----
library(shar)
library(spatstat.core)
library(raster)

set.seed(42)

## ----classify_habitats--------------------------------------------------------
landscape_discrete <- classify_habitats(raster = landscape, classes = 5)

## ----randomize_raster, eval = FALSE-------------------------------------------
#  torus_trans <- translate_raster(raster = landscape_discrete)
#  
#  random_walk <- randomize_raster(raster = landscape_discrete, n_random = 99)

## ----randomize_pp, eval = FALSE-----------------------------------------------
#  gamma_test <- fit_point_process(pattern = species_b, process = "cluster", n_random = 99)
#  
#  # (this can takes some time)
#  reconstruction <- reconstruct_pattern(pattern = species_b, n_random = 99,
#                                        e_threshold = 0.05, method = "cluster")

## ----results------------------------------------------------------------------
results_habitat_association(pattern = species_a, raster = random_walk)

results_habitat_association(pattern = reconstruction, raster = landscape_discrete)

## ----plotting, eval = FALSE---------------------------------------------------
#  plot(random_walk)
#  
#  plot(reconstruction)

## ----energy, message = FALSE--------------------------------------------------
calculate_energy(pattern = gamma_test, return_mean = TRUE)

calculate_energy(pattern = reconstruction, return_mean = TRUE)

