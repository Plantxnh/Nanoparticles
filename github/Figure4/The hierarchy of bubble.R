

edges <- read.delim('edge0429.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
vertices <- read.delim('vertices0429.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)

# Libraries
library(ggraph)
library(igraph)
library(tidyverse)
library(ggplot2)
library(ggsci)

# Then we have to make a 'graph' object using the igraph library:
mygraph <- graph_from_data_frame(edges, vertices=vertices,directed = T)


# Left: color depends of depth
p <- ggraph(mygraph, layout = 'circlepack', weight=size) + 
  geom_node_circle(aes(fill = group)) + 
  geom_node_text( aes(label=shortName, filter=leaf,  size=size*0.001)) +
  theme_void() + 
  theme(legend.position="FALSE")
#p
#p + scale_fill_viridis()
# Adjust color palette: colorBrewer
p + scale_fill_distiller(palette = "RdPu") 

