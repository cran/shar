## ----load-packages, message = FALSE--------------------------------------
# library(tidyverse)
library(shar)
library(spatstat)

## ----several-patterns----------------------------------------------------
# create list with patterns
list_pattern <- list(species_a, species_b)

# reconstruct all patterns in list
result <- lapply(list_pattern, function(x) reconstruct_pattern(pattern = x, 
                                                               n_random = 3, 
                                                               verbose = FALSE))


## ----result-spatial------------------------------------------------------
# get mean energy
lapply(result, function(x) calculate_energy(pattern = x,
                                            verbose = FALSE))

## ----reconstruct-pattern-------------------------------------------------
# reconstruct spatial strucutre
reconstructed_pattern <- reconstruct_pattern(species_a, 
                                             n_random = 3, 
                                             return_input = FALSE,
                                             verbose = FALSE)

## ----reconstruct-marks---------------------------------------------------
# get only selected marks of input (numeric marks)
species_a_marks <- spatstat::subset.ppp(species_a, select = dbh)

# reconstruct marks 3 times for each input pattern
result_marks <- lapply(reconstructed_pattern, 
                       function(x) reconstruct_marks(pattern = x, 
                                                     marked_pattern = species_a_marks, 
                                                     n_random = 3, verbose = FALSE))

## ----result-marks--------------------------------------------------------
# get energy
lapply(result_marks, function(x) calculate_energy(pattern = x, 
                                                  method = "marks", verbose = FALSE))

