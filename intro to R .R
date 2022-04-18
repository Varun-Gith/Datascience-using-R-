#vector 
a <- c(3,5,6)
a
c(TRUE,FALSE)

#TYPES OF VECTORS 
#(i) Numeric vectors 
a
#(ii)integer vectors
b<- 1:20
b
#(iii)logical vectors
c<- c(TRUE,FALSE)
#(IV) character vector 
text<- c('varun','rohit')
text
#(v)factors
fac<-c("ahs","asd","rde")
fact=factor(fac)
fact
#concatenaate vector 
rep(c(0,3,2),times=4)
rep(c('varun','persie'),each=2)
a<-3
a+3
c<-1:3
c
#case-sensitive
Name<-1
name<-2
Name+1
name
Name

#overwrite
over<- 45
over
over<-"var"
over
ls() # presents lists of object in the working directory 
f<-1:5
f
f-1
f/2
f*f
f*c(7)
f<-1:8
f*c(1,3)
f%*%f
f%o%f
die<-1:6
dice<-sample(die,size=2,replace=FALSE)
dice

#functions
roll<-function(){
  die<-1:6
  dice<-sample(die,size=2,replace=TRUE)
  sum(dice)
}
roll()

#functions with arguments
roll2<-function(bones){
  dice<-sample(bones,size=3,replace=TRUE)
  sum(dice)
}
roll2(bones = 3:5)

mean(1:3)
factorial(6)
mean(die)
round(2.44)
round(3.67)

install.packages("ggplot2")
library("ggplot2")
t<-c(-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
v<-t^3
v
qplot(t,v)

d<-c(1,2,3,3,3,5)
qplot(d,binwidth=0.5)

replicate(3,1+1)
replicate(3,roll())
