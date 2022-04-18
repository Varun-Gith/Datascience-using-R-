#importing the data 1
data=read.csv("/Users/persie/Documents/r programming/dataset/LR1.csv")
#removing the unwanted columns
data=data[,-c(1,3)]

#viewing the data
head(data,2)
View(data)

#checking the null values
is.null(data)

#Boxplot
boxplot(data$MV.Of.Club,horizontal = TRUE)
#removal of outliers
boxplot(data$MV.Of.Club,horizontal = TRUE)
outliers=boxplot(data$MV.Of.Club,plot=FALSE)$out
data=data[-which(data$MV.Of.Club%in%outliers),]
boxplot(data$MV.Of.Club)

#visualising the dataset


#normalise the data1
process <- preProcess(as.data.frame(data), method=c("range"))
norm_scale <- predict(process, as.data.frame(data)) # Normalise
standard_scale <- as.data.frame(scale(data[,-1])) #Standardize
norm_scale 
standard_scale 

#split dataset
split1 <- sample(c(rep(0, 0.7 * nrow(data)), rep(1, 0.3 * nrow(data))))
table(split1) 
train_data <- data[split1 == 0, ]    
test_data <- data[split1== 1, ]   

#model building-ridge 
library(glmnet)
# Getting the input variable
x_var <- data.matrix(train_data[, c("Squad.Size","Average.Age.Of.Players","AMV.of.players","MV.of.top.players")])

# Getting the target variable
y_var <- train_data[,"MV.Of.Club"]

# Setting the range of lambda values
lambda_seq <- 10^seq(2, -2, by = -.1)

# Using cross validation glmnet
ridge_cv <- cv.glmnet(x_var, y_var, alpha = 0, lambda = lambda_seq)

# Best lambda value
best_lambda <- ridge_cv$lambda.min
best_lambda

# Using glmnet function to build the ridge regression in r
fit <- glmnet(x_var, y_var, alpha = 0, lambda  = best_lambda)
# Checking the model
summary(fit)
coef(fit)

#prediction
x_test<- data.matrix(test_data[, c("Squad.Size","Average.Age.Of.Players","AMV.of.players","MV.of.top.players")])
pred <- predict(fit, s = best_lambda, newx = x_test)

# R squared formula
actual <- test_data$MV.Of.Club
preds <- pred
rss <- sum((preds - actual) ^ 2)
tss <- sum((actual - mean(actual)) ^ 2)
rsq <- 1 - rss/tss
rsq

#importing the dataset 2
data=read.csv("/Users/persie/Documents/r programming/dataset/kidney_stone_data-41.csv")

#filling the missing values 
data$Age=ifelse(is.na(data$Age),ave(data$Age,FUN= function (x)mean(x,na=TRUE)),data$Age)

#rounding the values
data$Age=round(data$Age)
#printng the data
print(data)

#categorising the data 
data$stone_size=factor(data$stone_size,levels=c("large","small"),labels = c(1,2))
print(data)

#visulaising the dataset
barplot(data$Age,names.arg = data$Age,col="blue",horiz = TRUE,density=12)
barplot(table(data$stone_size))
## from the above graph it is clear that more no of patients has large stone.
barplot(table(data$treatment))
## fronm the above graph it is clear that no of patients undergoing treatment A is greater than B

#model building 
input <- data[,c("treatment","stone_size","success","Age")]
fitglm = glm(formula = success~treatment+Age+stone_size,
             data = input, family = binomial)
summary(fitglm)
