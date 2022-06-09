rm(list=setdiff(ls(), c("rD", "remDr")))
cat("\014")

easypackages::packages("dplyr", "rotl", "stringr", "rgbif")

all_species <- read.csv("data/species_table.csv")

random_species <- sample_n(all_species, sample(3:10, 1))

original_phylo <- tol_induced_subtree(random_species$ott_id, label_format = "id")

my_phylo <- original_phylo

my_phylo$tip.label <- tibble(ott_id = str_remove(my_phylo$tip.label, "ott") %>%
                               as.numeric(.)) %>%
  left_join(., random_species) %>%
  .$common.name

plot(my_phylo)

save.image("~/R Scripts/phylo_experimenting/saved_workspace.RData")

