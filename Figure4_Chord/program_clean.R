library(circlize)


# --------------
rm(list = ls())

#---------------------------------
df = read.csv('./data/main_allstrains.csv',header = T)

barheight = read.csv('./data/barheight_out.csv',header = T)
barcolor = read.csv('./data/barcolor_out.csv',header = T)
bglwd = read.csv('./data/bglwd_out.csv',header = T)
bgcolor = read.csv('./data/bgcolor_out.csv',header = T)


# --------------------
circos.clear()

# ------------
circos.par(cell.padding = c(0,0,0,0), "gap.degree" = 0, track.margin = c(0,0.01))


fa = df$strains
fa = factor(fa,levels = fa)
# ---------
circos.initialize(factors = fa, xlim = c(0,1))



###########################################################
# --------------------

# ---------------------
circos.trackPlotRegion(
  ylim = c(0, 18.3), track.height = 0.5, bg.border = NA,
  panel.fun = function(x, y) {
    sector.index = get.cell.meta.data('sector.index')
    xlim = get.cell.meta.data('xlim')
    ylim = get.cell.meta.data('ylim')
  } )




i=1
for(sector.index in fa) {
  circos.barplot(matrix(as.numeric(barheight[i,]), nrow = 1), 0.5, col = as.character(barcolor[i,]), lwd = as.numeric(bglwd[i,]),
                 border = as.character(bgcolor[i,]),
                 sector.index = sector.index)
  i=i+1
}




###########################################################
#--------------
point = read.csv('./data/splist_knowpyo_struct.csv',header = TRUE)

#-----------------
circos.trackPlotRegion(
  ylim = c(0, 1), track.height = 0.01, bg.border = NA,
  panel.fun = function(x, y) {
    sector.index = get.cell.meta.data('sector.index')
    xlim = get.cell.meta.data('xlim')
    ylim = get.cell.meta.data('ylim')
  } )

# -------------
i=1
for(sector.index in point$sp) {
  circos.points(0.5, 0.5, sector.index, track.index = 2, pch = 16, col = '#FF0000', cex = 0.1)
  
  i=i+1
}




circos.par(cell.padding = c(0,0,0,0), "gap.degree" = 0, track.margin = c(0.01,0.01))


###########################################################
#----------------
circos.trackPlotRegion(
  ylim = c(0, 1), track.height = 0.035, bg.border = NA,
  panel.fun = function(x, y) {
    sector.index = get.cell.meta.data('sector.index')
    xlim = get.cell.meta.data('xlim')
    ylim = get.cell.meta.data('ylim')
  } )

# -------------
i=1
for(sector.index in fa) {
  highlight.sector(as.character(df$strains[i]), track.index = 3, col = df$color2[i])
  
  i=i+1
}



###########################################################
#----------------
circos.trackPlotRegion(
  ylim = c(0, 1), track.height = 0.035, bg.border = NA,
  panel.fun = function(x, y) {
    sector.index = get.cell.meta.data('sector.index')
    xlim = get.cell.meta.data('xlim')
    ylim = get.cell.meta.data('ylim')
  } )

# -------------
i=1
for(sector.index in fa) {
  highlight.sector(as.character(df$strains[i]), track.index = 4, col = df$species_color[i])
  
  i=i+1
}




# ###########################################################
#-----------
link = read.csv('./data/digit_link_out.csv',header = TRUE)


for(i in 1:nrow(link)){
  circos.link(sector.index1 = link[i,1], point1 = c(0,link[i,3]), sector.index2 = link[i,2], point2 = c(0,link[i,4]),
              h.ratio = 1-link[i,10], directional = 0, lwd=1, col=link[i,7], lty=1)
}












