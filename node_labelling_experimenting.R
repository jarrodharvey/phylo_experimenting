rm(list=setdiff(ls(), c("rD", "remDr")))
cat("\014")

easypackages::packages("dplyr", "rotl", "stringr", "rgbif")

load("~/R Scripts/phylo_experimenting/saved_workspace.RData")

node_labels <- my_phylo$node.label
# Once you have your new label set you can use https://rdrr.io/cran/ape/man/nodelabels.html to label them

stop("Code goes below to transform each node label into something that makes sense to you")

# You will need to iterate through each node label.
# I think the ones that start with "MRCA" might just need to be
# called "Ancestor" for simplicity's sake
my_phylo$node.label

ott_to_query <- 189832

ott_info <- taxonomy_taxon_info(ott_to_query)[[1]]

ott_sci_name <- ott_info$name

ott_rank <- ott_info$rank

if (ott_rank == "no rank") {
  ancestor_label = "Ancestor"
} else {
  ott_common_name <- get_uid_(ott_sci_name)[[1]] %>%
    dplyr::filter(commonname != "") %>%
    .$commonname
  if (identical(ott_common_name, character(0))) {
    sci_name_parent_data <- name_lookup(ott_sci_name)$data[1,]
    sci_name_parent <- sci_name_parent_data$parent
    new_common_name <- get_uid_(sci_name_parent)[[1]] %>%
      dplyr::filter(commonname != "") %>%
      .$commonname
    # Just call it "ancestor" if you can't get a common name at this stage
  }
}
