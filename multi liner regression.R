#importing the data
data=read.csv("/Users/persie/Documents/r programming/dataset/LR1.csv")
#removing the unwanted columns
data=data[,-c(1,3)]

#viewing the data
head(data,2)
View(data)

#Boxplot
boxplot(data$MV.Of.Club,horizontal = TRUE)

#corr plot
library(corrplot)
corrplot(cor(data[,-1]),method='number')

#checking the null values
is.null(data)

#multilinear reg
d=data$MV.Of.Club~data$MV.of.top.players+data$AMV.of.players+data$Average.Age.Of.Players+data$Squad.Size

#linear model
fit=lm(d,data = data)

#results
summary(fit)
anova(fit)
plot(fit)