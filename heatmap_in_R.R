library(foreign)

x<-read.dta("heatmapstates1.dta")
x<-x[complete.cases(x), ]

#x<-x[1:51,]

x$region <- tolower(x$state_name)

library(ggplot2)
library(maps)
states <- map_data("state")
map.df <- merge(states,x, by="region", all.x=T)
map.df <- map.df[order(map.df$order),]

no_axes <- theme(
    plot.background = element_blank(),
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.title = element_blank()
)


ggplot(map.df, aes(x=long,y=lat,group=group))+
    geom_polygon(aes(fill=AVGratio1), color = "white")+
    xlim(-128, -65)+ylim(25, 50)+
    geom_text(data=x, aes(x=Longitude,y=Latitude, group=NA, label=""), 
              size=2.5, vjust=0.5, hjust=0.5)+
    scale_fill_gradientn(colours = rev(rainbow(7)),
                         breaks = c(0.4, 0.6, 1, 2),
                         trans = "log10") +theme_bw()+ no_axes

#shows the actual difference



ggplot(map.df, aes(x=long,y=lat,group=group))+
    geom_polygon(aes(fill=AVGratio1), color = "black")+
    xlim(-128, -65)+ylim(25, 50)+
    geom_text(data=x, aes(x=Longitude,y=Latitude, group=NA, label=""), 
              size=2.5, vjust=0.5, hjust=0.5)+
    scale_fill_gradient2(breaks = c(0.5, 1, 2),
                         trans = "log10") +theme_bw()+ no_axes

