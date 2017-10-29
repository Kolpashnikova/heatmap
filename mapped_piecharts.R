###

#women and men

par(mfrow=c(1,3), mar=c(4,4,2,1))
data<-read.dta("piecharts_sportsF.dta")
data<-data[complete.cases(data), ]

map('state', region = c('california', 'oregon', 'washington'), ylim=c(30,50), xlim=c(-130,-70), col="grey80", fill=TRUE, projection="gilbert", orientation= c(90,0,225))

for (i in 1:length(data$Latitude)){
    coord2 <- mapproject(data$Longitude[i],data$Latitude[i], proj="gilbert", orientation=c(90, 0, 225))
    add.pie(z=c(data$propF[i],data$propM[i]), x=coord2$x, y=coord2$y, radius=data$totaltime[i]/3000, col=c(alpha("red", 0.6), alpha("blue", 0.6)), labels="")
}

mtext('California, Oregon, Washington', side = 2, line=0.3, cex = 1)
mtext('Relative Sports', side = 1, line=2, cex = 1)
mtext('Women', side = 1, line=1, cex = 1, adj=0, col="red")
mtext('vs', side = 1, line=1, cex = 1)
mtext('Men', side = 1, line=1, cex = 1, adj=1, col="blue")


data<-read.dta("piecharts_sportsM.dta")
data<-data[complete.cases(data), ]

map('state', region = c('california', 'oregon', 'washington'), ylim=c(30,50), xlim=c(-130,-70), col="grey80", fill=TRUE, projection="gilbert", orientation= c(90,0,225))

for (i in 1:length(data$Latitude)){
    coord2 <- mapproject(data$Longitude[i],data$Latitude[i], proj="gilbert", orientation=c(90, 0, 225))
    add.pie(z=c(data$propF[i],data$propM[i]), x=coord2$x, y=coord2$y, radius=data$totaltime[i]/3000, col=c(alpha("red", 0.6), alpha("blue", 0.6)), labels="")
}

mtext('California, Oregon, Washington', side = 2, line=0.3, cex = 1)
mtext('Relative Sports', side = 1, line=2, cex = 1)
mtext('Women', side = 1, line=1, cex = 1, adj=1, col="red")
mtext('vs', side = 1, line=1, cex = 1)
mtext('Men', side = 1, line=1, cex = 1, adj=0, col="blue")

#add running

data<-read.dta("piecharts.dta")
data<-data[complete.cases(data), ]

map('state', region = c('california', 'oregon', 'washington'), ylim=c(30,50), xlim=c(-130,-70), col="grey80", fill=TRUE, projection="gilbert", orientation= c(90,0,225))

for (i in 1:length(data$Latitude)){
    coord2 <- mapproject(data$Longitude[i],data$Latitude[i], proj="gilbert", orientation=c(90, 0, 225))
    add.pie(z=c(data$propF[i],data$propM[i]), x=coord2$x, y=coord2$y, radius=data$totaltime[i]/250, col=c(alpha("red", 0.6), alpha("blue", 0.6)), labels="")
}

mtext('California, Oregon, Washington', side = 2, line=0.3, cex = 1)
mtext('Women', side = 1, line=1, cex = 1, adj=0, col="red")
mtext('vs', side = 1, line=1, cex = 1)
mtext('Men', side = 1, line=1, cex = 1, adj=1, col="blue")
mtext('Relative Jogging', side = 1, line=2, cex = 1)
