#Brownian motion problem revisited with new visualization mappings
library(ggplot2)
library(RColorBrewer)
library(ggthemes)

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

g = ggplot(data = xyDf,aes(x = x,y = y,alpha = -t,color = n)) + geom_point() +geom_path(aes(color = n)) + scale_color_distiller(palette = "Spectral")
g
ggsave("Brownian Motion Revisualized.png")

g +geom_density2d()
ggsave("Brownian Motion Revisualized with density.png")
