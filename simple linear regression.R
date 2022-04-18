#importing the dataset
data=read.csv("/Users/persie/Documents/r programming/dataset/LR1.csv")

#removing the unwanted columns
data = data[,-c(1,3)]
View(data)
head(data,2)

#checking the null values
is.null(data)

#assigning x & y variables
x=data$MV.of.top.players
y=data$MV.Of.Club

#checking the linearity of the data
plot(y~x,data=data)

#performing linear regression 
fit=lm(y~x,data=data)

#plotting the solution line
plot(y~x,pch=20,col="purple") + abline(fit,col="black")

#result
summary(fit)
#residuals
plot(fit$residuals)
