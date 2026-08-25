# load packages
library(tidyverse)
library(CytoExploreR)
library(flowCore)
library(flowWorkspace)
library(DataExplorer)

# set the path and load files
fcs_dir  = "./fcs"

gs <- cyto_setup(fcs_dir,
                 gatingTemplate = "vag_unstain_gating.csv")

# build the data transformer
trans <- cyto_transformer_logicle(gs)
# transform the data
gs <- cyto_transform(gs, trans = trans)


# gating

cyto_gate_edit(gs,
               parent = "root",
               alias = "Cells",
               channels = c("FSC-A","SSC-B-A"),
               type = "polygon",
               gatingTemplate = "vag_unstain_gating.csv")

cyto_gate_draw(gs,
               parent = "root",,
               alias = "lymphocytes",
               channels = c("FSC-A","SSC-B-A"),
               type = "polygon",
               gatingTemplate = "vag_unstain_gating.csv")


cyto_gate_draw(gs,
               parent = "root",,
               alias = "myeloids",
               channels = c("FSC-A","SSC-B-A"),
               type = "polygon",
               gatingTemplate = "vag_unstain_gating.csv")


# plots
cyto_plot(gs, 
          parent = "root",
          alias = c("lymphocytes","myeloids"),
          channels = c("FSC-A","SSC-B-A"),
          border_line_width = 0.7,
          axes_text_font = 1,
          label = FALSE,
          gate_line_col = "black",
          gate_line_width = 2.5)


# Gating tree
cyto_plot_gating_tree(gs,stat = "freq")

cyto_plot_gating_scheme(gs)

# Save and load
cyto_save(gs, save_as = "Vag105UM_AF_explore")
gs <- cyto_load("Vag105UM_AF_explore")

sessionInfo()
