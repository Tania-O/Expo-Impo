install.packages("htmlwidgets")
library("htmlwidgets")
library(dplyr)
library(babynames)
library(streamgraph)
dat <- read.csv("http://asbcllc.com/blog/2015/february/cre_stream_graph_test/data/cre_transaction-data.csv")

dat %>%
  streamgraph("asset_class", "volume_billions", "year", interpolate="cardinal") %>%
  sg_axis_x(1, "year", "%Y") %>%
  sg_fill_brewer("PuOr")
###############
Export2020 <- read.csv("VOL_EXPORT.csv")
Export2020
head(Export2020)
E <- Export2020 %>%
  streamgraph("Abreviatura", "Vol", "Año", interpolate="cardinal") %>%
  sg_axis_x(1, "Año", "%Y") %>%
  sg_fill_brewer("PuOr")
E
saveWidget(E, file=".html")
