plot(2,6)
plot(c(1,8),c(3,10))
plot(c(1,2,3,4,5),c(6,7,8,9,10))

#aassign and plot
x<-c(1,2,3,4,5)
y<-c(6,7,8,9,10)
plot(x,y)
plot(1:10)


plot(1:10,type = "l")
plot(1:10,main="simple graph", xlab= "axis",ylab = "y axis")

#colour
plot(1:10,col="red")

#size
plot(1:10,col="red",cex=2)
#shape
plot(1:10,col="red",cex=2,pch=23)#changing the shape of the point

#line graph 
plot(1:10,type = "l")
#color
plot(1:10,type="l",col="red")
#line width 
plot(1:10,type="l",col="red",lwd=5)
#line type
plot(1:10,type="l",col="red",lwd=5,lty=2)

#line plot
line1<-c(1,2,3,4,5)
line2<-c(2,5,7,8,9,10)
plot(line1,type="l",col="blue")
lines(line2,type="l",col="red")

#scatter plot
x<-c(5,7,8,7,2,2,9,4,11,12,9,6)
y<-c(99,86,87,88,111,103,87,94,78,77,85,86)
plot(x,y)
plot(x,y, main="observatioon",xlab="car age",ylab="car speed")
plot(x,y, main="observatioon",xlab="car age",ylab="car speed",col="blue")

#pie chart
x<-c(10,20,40,30)
pie(x)

#segment start from 90 degree
pie(x,init.angle=90)
#label the segments
mylabelM<-c("A","B","C","D")
pie(x,label=mylabelM,main="alpha")
#color
colors<-c("blue","yellow","green","black")
pie(x,label=mylabelM,main="alpha",col=colors)
#legend
legend("bottomright",mylabelM,fill=colors)

#bar chart 
x<-c("A","B","C","D")
Y<-c(2,4,6,8)
barplot(Y,names.arg = x)
#color
barplot(Y,names.arg = x,col="blue")
#type
barplot(Y,names.arg = x,density = 10)
#width
barplot(Y,names.arg = x,width=c(1,2,3,4))

#horizontal plot
x<-c("A","B","C","D")
y<-c(2,4,6,8)
barplot(y,names.arg = x,horiz = TRUE)
data(airquality)
head(airquality)
tail(airquality,5)
summary(airquality)
dim(airquality)

r try using as.matrix(dataFrame) for the input
barplot(table(df$diagnosis)) maybe this can help for getting error as vector npositive
