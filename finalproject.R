library('ggplot2')
install.packages('ggtree')
library('phytools')

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.18")
library('ggtree')
browseVignettes("ggtree")


fig_tree = read.tree('~/Desktop/trialtree2')
fig_tree


#ggtree(fig_tree) + geom_tiplab(align = TRUE, linesize = 0.5, size = 2) + coord_cartesian(clip = 'off')
test_region <- read.csv("~/Desktop/test_region.csv")
test_year <- read.csv("~/Desktop/year.csv")
print(test_year)

base_tree <- ggtree(fig_tree) + xlim(0, 0.04) + geom_treescale()
HA_tree <- base_tree %<+% test_year + 
  geom_tiplab(aes(fill = factor(year)), color = "black", geom = "label", label.padding = unit(0.04, "lines"), label.size = 0, size = 2) +
  theme(legend.position = "top", legend.title = element_blank(), legend.key = element_blank()) +
  ggtitle('Influenza HA Tree') 

NAtree = read.tree('~/Desktop/natrialtree')
NA_region <- read.csv('~/Desktop/NAregion.csv')
NA_year <- read.csv('~/Desktop/NAyear.csv')

base_na_tree <- ggtree(NAtree) + xlim(0, 0.04) + geom_treescale()
NA_tree <- base_na_tree %<+% NA_year + 
  geom_tiplab(aes(fill = factor(year)), color = "black", geom = "label", label.padding = unit(0.04, "lines"), label.size = 0, size = 2) +
  theme(legend.position = "top", legend.title = element_blank(), legend.key = element_blank()) +
  ggtitle('Influenza NA Tree') 

#covid
cHA <- read.tree("~/Desktop/covid_HA_1")
cNA <- read.tree("~/Desktop/covid_NA_1")
c_region <- read.csv('~/Desktop/cregion.csv')
head(c_region)

c_HA_tree <- ggtree(cHA)+ xlim(0, 0.04) + geom_treescale()
c_HA_tree %<+% c_region + 
  geom_tiplab(aes(fill = factor(region)), color = "black", geom = "label", label.padding = unit(0.04, "lines"), label.size = 0, size = 3) +
  theme(legend.position = "top", legend.title = element_blank(), legend.key = element_blank()) +
  ggtitle('Influenza HA Tree (2020-2022)') 

install.packages('TreeDist')
library('TreeDist')

distance <- TreeDistance(fig_tree, NAtree)
print(distance)
VisualizeMatching(ClusteringInfoDistance, fig_tree, NAtree)
ClusteringInfoDistance(fig_tree, NAtree, reportMatching = TRUE)


