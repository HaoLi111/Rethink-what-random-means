#Animated Brownian motion problem revisited with new visualization mappings
library(ggplot2)
library(RColorBrewer)
library(ggthemes)
setwd("E:/Rethink-what-random-means/Rethink-what-random-means/Brownian Vid")
set.seed(123)

#prepare data 2D
n=100
n_step = 128
tune_mean = 0
tune_sd = 1

xyDf = NULL

for(i in 1:n){
  xyDf=rbind(xyDf,data.frame(t = 1:n_step,x = cumsum(rnorm(n_step,mean = tune_mean,sd = tune_sd)),y = cumsum(rnorm(n_step,mean = tune_mean,sd = tune_sd)),n = rep(i,n_step)))
}
xyDf
system.time({
for(j in 1:n_step){
  xyDfcurrent = subset(xyDf,t<=j)
    g = ggplot(data = xyDfcurrent,aes(x = x,y = y,alpha = -t,color = n)) + geom_point() +geom_path(aes(color = n)) + scale_color_distiller(palette = "Spectral") + 
      coord_equal(xlim = c(-30,30),ylim = c(-30,30))

    ggsave(paste0(j,"B.png"),g,dpi=600,width = 8,height=8)

    g2=g +geom_density2d()
    ggsave(paste0(j,"Bdensity.png"),g2,dpi = 600,width=8,height = 8)
}

})

library(av)
av_encode_video(paste0(1:n_step,"B.png"),"B.mp4")
av_encode_video(paste0(1:n_step,"Bdensity.png"),"Bdensity.mp4")