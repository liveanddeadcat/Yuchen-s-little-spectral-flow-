
## Citation: cytoExploreR package from DrHammill

setwd("PATH/TO/Raw/Reference Group")
library(flowCore)
library(CytoExploreR)

# load ref controls
gs <- cyto_setup(getwd(), 
                 gatingTemplate = "ref_control.csv")

# logicle transformation
gs <- cyto_transform(gs)
ts <- cyto_transformer_logicle(gs)

# gating
# cd3
cyto_gate_draw(gs[1],
               parent = "root",
               alias = "cells",
               channels = c("FSC-A", "SSC-A"))

cyto_gate_draw(gs[1],
               parent = "cells",
               alias = "cd3_pos",
               channels = c("B6-A"),
               type = "interval")
cyto_gate_draw(gs[1],
               parent = "cells",
               alias = "cd3_neg",
               channels = c("B6-A"),
               type = "interval")

# cd4
cyto_gate_draw(gs[2],
               parent = "root",
               alias = "cells_cd4",
               channels = c("FSC-A", "SSC-A"))

cyto_gate_draw(gs[2],
               parent = "cells_cd4",
               alias = "cd4_pos",
               channels = c("UV16-A"),
               type = "interval")
cyto_gate_draw(gs[2],
               parent = "cells_cd4",
               alias = "cd4_neg",
               channels = c("UV16-A"),
               type = "interval")


# LD FVS440UV
cyto_gate_draw(gs[3],
               parent = "root",
               alias = "cells_ld",
               channels = c("FSC-A", "SSC-A"))

cyto_gate_draw(gs[3],
               parent =  "cells_ld",
               alias = "ld_pos",
               channels = c("UV7-A"),
               display = 500000,
               type = "interval")
cyto_gate_draw(gs[3],
               parent = "cells_ld",
               alias = "ld_neg",
               channels = c("UV7-A"),
               display = 500000,
               type = "interval")

# unstained stimmed lympho AF
cyto_gate_edit(gs[4],
               parent = "root",
               alias = "cells_af",
               channels = c("FSC-A", "SSC-A"))


## export files
# Pos and neg populations
list_raw_pos <- list()
for (i in (1:3)){
  pos <- cyto_extract(gs[i], cyto_nodes(gs[i])[grepl("_pos", cyto_nodes(gs[i]))])
  ff <- cyto_convert(pos, return = "flowFrame",
                     inverse.transform = TRUE)
  list_raw_pos[i] <- ff
  names(list_raw_pos)[i]<-cyto_nodes(gs[i])[grepl("_pos", cyto_nodes(gs[i]))]
}

list_raw_neg <- list()
for (i in (1:3)){
  neg <- cyto_extract(gs[i], cyto_nodes(gs[i])[grepl("_neg", cyto_nodes(gs[i]))])
  ff <- cyto_convert(neg, return = "flowFrame",
                     inverse.transform = TRUE)
  list_raw_neg[i] <- ff
  names(list_raw_neg)[i]<-cyto_nodes(gs[i])[grepl("_neg", cyto_nodes(gs[i]))]
}

#AF profile
af <- cyto_extract(gs[4], "cells_af")
af_ff <- cyto_convert(af, return = "flowFrame",
                      inverse.transform = TRUE)

# Output fcs files
names(list_raw_pos)<- gsub("^[^/]*/[^/]*/","",names(list_raw_pos))
names(list_raw_neg)<- gsub("^[^/]*/[^/]*/","",names(list_raw_neg))

for (i in 1:length(list_raw_pos)){
  write.FCS(x = list_raw_pos[[i]], filename = paste0(names(list_raw_pos)[i],".fcs"))}

for (i in 1:length(list_raw_neg)){
  write.FCS(x = list_raw_neg[[i]], filename = paste0(names(list_raw_neg)[i],".fcs"))}

write.FCS(x = af_ff, filename = "lymph_af.fcs")


