View(iris)
library(ggplot2)
ggplot(data=iris)
#1
ggplot(data=iris,aes(x=Petal.Length,y=Sepal.Length,col=Species))+geom_point()
#2
ggplot(data=iris,aes(x=Petal.Length,y=Sepal.Length,col=Species,shape=Species))+geom_point()
#3
data=read.csv("/Users/persie/Documents/r programming/dataset/LR1.csv")
View(data)
ggplot(data = data,aes(x=MV.of.top.players))+geom_histogram()
#4
ggplot(data = data,aes(x=MV.of.top.players))+geom_histogram(bins=50,col="blue",fill="green")

#5
ggplot(data=data,aes(x=MV.of.top.players,fill=data$X))+geom_histogram(bins=50,col='blue',fill='green')
#6
kid=read.csv('/Users/persie/Documents/r programming/dataset/kidney_stone_data-4.csv')
ggplot(data=kid,aes(x=kid$stone_size))+geom_bar()
#7
ggplot(data=kid,aes(x=kid$stone_size,fill=treatment))+geom_bar(position = "fill")

#8
kid$Age=ifelse(is.na(kid$Age),ave(kid$Age,FUN = function(x) mean(x,na=TRUE)),kid$Age)
ggplot(data=kid,aes(x=Age,col=treatment))+geom_freqpoly(bins=10)

#9
ggplot(data=kid,aes(y=Age,x=stone_size,fill=treatment))+geom_boxplot(bins=10)

#10
ggplot(data=kid,aes(y=Age,x=treatment,fill=stone_size))+geom_boxplot()


library(dplyr)
library(hflights)
data(hflights)
head(hflights)

#local dataframe 
flights<-tbl_df(hflights)
# printing only shows 10 rows and as many columns as can fit on your screen
flights
#1
#filter using dplyr approach
filter(flights, Month==1, DayofMonth==1)
#2
# use pipe for OR condition
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")
#3
# select using dplyr approach
select(flights, DepTime, ArrTime, FlightNum)
#4
# use colon to select multiple contiguous columns, and use `contains` to match columns by name
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

#normal method
# nesting method to select UniqueCarrier and DepDelay columns and filter for delays over 60 minutes
filter(select(flights, UniqueCarrier, DepDelay), DepDelay > 60)
# chaining method
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  filter(DepDelay > 60)
View(flights)
#5
#arrange using dplyr 
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

#6
# use `desc` for descending
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))
#7
# dplyr (prints the new variable but does not store it)
flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)
# store the new variable
flights <- flights %>% mutate(Speed = Distance/AirTime*60)
#8
# creating a table grouped by Dest, and then summarise each group by taking the mean of ArrDelay
flights %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay, na.rm=TRUE))
#9
# for each carrier, calculate the percentage of flights cancelled or diverted
flights %>%
  group_by(UniqueCarrier) %>%
  summarise_each(funs(mean), Cancelled, Diverted)
#10
# for each day of the year, count the total number of flights and sort in descending order
flights %>%
  group_by(Month, DayofMonth) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))
