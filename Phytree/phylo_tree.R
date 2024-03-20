library(circlize)
library(ggtreeExtra) #Set up overlay packages
library(ggplot2) # 
library(ggtree) # Draw an phy tree
library(treeio)
library(ggnewscale)



rm(list = ls())

phylo = read.csv('./data/phylo_out.csv',header = T)
hc = read.tree('./data/phy_1928_midpoint.tre')

p <- ggtree(hc, layout = 'fan', size = 0.1) + scale_y_reverse()

p1 <- p + new_scale_fill() + 
  geom_fruit(
    data=phylo,
    geom=geom_bar,
    pwidth=0.08,
    mapping=aes(y=strains, x = 1, fill=species_color),
    orientation="y",
    stat = 'identity'
  ) + 
  scale_fill_manual(
    values=c("#174590", "#3E763E", "#70BCC9","#7E7E80" ,"#D7261C","#E27820"),
    guide="none"
  ) 

p2 <- p1 +  new_scale_fill() +
  geom_fruit(
    data=phylo,
    geom=geom_bar,
    mapping=aes(y=strains, x=lens, fill=species_color),
    orientation="y",
    stat = 'identity'
  ) +
  scale_fill_manual(
    values=c("#4876FF","#4876FF","#4876FF","#4876FF","#4876FF","#4876FF"),
    guide="none"
  )


p2
















