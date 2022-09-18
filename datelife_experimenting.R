# Script for experimenting with the datelife package, which I didn't know about
# before but I guess could save me a heap of time.

rm(list=setdiff(ls(), c("rD", "remDr")))
cat("\014")

easypackages::packages("dplyr", "stringr", "datelife")

random_species <- read.csv("data/species_table.csv") %>%
  sample_n(sample(3:10, 1))

# bears <- c("ursus maritimus", "ursus arctos horribilis")
#
# bears_mrca <- datelife_search(
#   input = bears,
#   summary_format = "mrca"
# )

datelife_phylo <- datelife_search(
  input = random_species$scientific.name
)

# plot(datelife_phylo)
