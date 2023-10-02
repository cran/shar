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

## ----randomize_raster_import, echo = FALSE, eval = TRUE-----------------------
torus_trans <- unpack_randomized(raster = shar:::data_internal$torus_trans)
random_walk <- unpack_randomized(raster = shar:::data_internal$random_walk)

## ----randomize_pp, eval = FALSE-----------------------------------------------
#  gamma_test <- fit_point_process(pattern = species_b, process = "cluster", n_random = 39)
#  
#  # (this can takes some time)
#  reconstruction <- reconstruct_pattern(pattern = species_b, n_random = 39,
#                                        e_threshold = 0.05, method = "cluster")

## ----randomize_import, echo = FALSE, eval = TRUE------------------------------
gamma_test <- shar:::data_internal$gamma_test
reconstruction <- shar:::data_internal$reconstruction

## ----results------------------------------------------------------------------
results_habitat_association(pattern = species_a, raster = random_walk)

results_habitat_association(pattern = reconstruction, raster = landscape_discrete)

## ----plot_recon, eval = FALSE-------------------------------------------------
#  plot(reconstruction, ask = FALSE)

## ----plot_tors, fig.align = "center", out.height = "65%", out.width = "65%", message = FALSE----
col_palette <- c("#440154FF", "#3B528BFF", "#21908CFF", "#5DC863FF", "#FDE725FF")

plot(torus_trans, col = col_palette)

