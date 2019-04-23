## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_libraries_hidden, eval = TRUE, echo = FALSE, message = FALSE, results = "hide"----
library(dplyr)
library(shar)
library(spatstat)
library(raster)

## ----classify_habitats---------------------------------------------------

landscape_discrete <- classify_habitats(raster = landscape, classes = 5)


## ----randomize_raster, message = FALSE-----------------------------------

landscape_torus <- translate_raster(raster = landscape_discrete)

landscape_random <- randomize_raster(raster = landscape_discrete, n_random = 19)


## ----randomize_pp, message = FALSE, warning = FALSE----------------------

fitted <- fit_point_process(pattern = species_a, n_random = 19, process = "cluster")

reconstructed <- reconstruct_pattern(pattern = species_a, max_runs = 500, n_random = 19) # takes some time


## ----results-------------------------------------------------------------

results_habitat_association(pattern = species_a, raster = landscape_random)

results_habitat_association(pattern = reconstructed, raster = landscape_discrete)


## ----plotting, eval = FALSE----------------------------------------------
#  
#  plot_randomized_raster(landscape_random)
#  
#  plot_randomized_pattern(reconstructed)
#  

## ----energy, message = FALSE---------------------------------------------

calculate_energy(pattern = fitted, return_mean = TRUE)

calculate_energy(pattern = reconstructed, return_mean = TRUE)


