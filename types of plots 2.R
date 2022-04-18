#importing Dataset
data= read.csv("/Users/persie/Downloads/kidney_stone_data-4.csv")
print(data)

dat=read.table("/Users/persie/Downloads/kidney_stone_data-4.csv",header=TRUE,sep=",")
print(dat)

#filling the missing values 
data$Age=ifelse(is.na(data$Age),ave(data$Age,FUN= function (x)mean(x,na=TRUE)),data$Age)

#rounding the values
data$Age=round(data$Age)
#printng the data
print(data)

#categorising the data 
data$stone_size=factor(data$stone_size,levels=c("large","small"),labels = c(1,2))
print(data)

#plotting the data 
la=c(data$Age)
data(airquality)
head(airquality,5)
label=c("may","jun","jul","aug","sep")
colors=c("blue","red","orange","pink","white")
pie(table(airquality$Month),labels = label,col = colors)
legend("bottomright",label,fill = colors)
## the pie chart clearly depicts that there are almost equal instance with respect to month.

#barplot
barplot(data$Age,names.arg = data$Age,col="blue",density=12)

barplot(airquality$Ozone,names.arg = airquality$Month,col = "blue",density = 20)
## the above graph can observe that at the end of each month there is a spike in ozone
barplot(airquality$Temp,names.arg=airquality$Ozone,xlab = "Ozone",ylab = "Temp",col = "green")
barplot(table(data$stone_size))
## from the above graph it is clear that more no of patients has large stone.
barplot(table(data$treatment))
## fronm the above graph it is clear that no of patients undergoing treatment A is greater than B

#scatter plot
plot(airquality$Ozone,airquality$Temp,col="blue")
plot(airquality$Month,airquality$Wind,type="l",col="blue",lwd=2,lty=2)
## from the above graphs we can note that temperature and ozone are directly proportional.
##may and jun has the more winds recorded

a=mean(airquality$Temp[airquality$Month==5])
b=mean(airquality$Temp[airquality$Month==6])
c=mean(airquality$Temp[airquality$Month==7])
d=mean(airquality$Temp[airquality$Month==8])
e=mean(airquality$Temp[airquality$Month==9])

as=c(a,b,c,d,e)
barplot(as, names.arg = table(airquality$Month))
##above graph shows us that average temperature per month. July and august has the highest temperature.
