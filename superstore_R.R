rm(list = ls())

#Read in data
data <- read.csv("Superstore.csv")
head(data, 3)

#Load libraries
library(caret)
library(ggplot2)
library(car)


## EDA: 
str(data)
summary(data)

#Cleaning the Data

#Remove unecessary columns
data <- data[-c(1,2,3,4,6,7,9,10,14)]
head(data, 2)

#Check for missing values
any(is.na(data))
sum(is.na(data))

#Convert categorical data type    
data$Ship.Mode <-as.factor(data$Ship.Mode)
data$Segment <-as.factor(data$Segment)
data$State <-as.factor(data$State)
data$Region <-as.factor(data$Region)
data$Category <-as.factor(data$Category)
data$Sub.Category <-as.factor(data$Sub.Category)
data$Product.Name <-as.factor(data$Product.Name)


#distribution of the target variable
hist(data$Sales)

#boxplot of categorical data
par(mfrow=c(2,3))
boxplot(data$Sales ~ data$Ship.Mode)
boxplot(data$Sales ~ data$Segment)
boxplot(data$Sales ~ data$State)
boxplot(data$Sales ~ data$Region)
boxplot(data$Sales ~ data$Category)
boxplot(data$Sales ~ data$Sub.Category)
#boxplot(data$Sales ~ data$Product.Name)


#scatterplots of numerical data
par(mfrow=c(2,2))
plot(data$Postal.Code, data$Sales)
abline(lm(Sales ~ Postal.Code, data = data), col = "red")

plot(data$Quantity, data$Sales)
abline(lm(Sales ~ Quantity, data = data), col = "red")

plot(data$Discount, data$Sales)
abline(lm(Sales ~ Discount, data = data), col = "red")

plot(data$Profit, data$Sales)
abline(lm(Sales ~ Profit, data = data), col = "red")


#Correlation Matrix
cor(data[c(4,9,10,11,12)])

#Sales and Profit have a moderately strong correlation. 
#All other variables appear to show a weak correlation between dependent variables. 
#No strong correlations observed between the predicting variables. No evidence of multicolinearity


## Analysis:

#Split data
set.seed(123)
train_index <- createDataPartition(data$Sales, p=0.7, list = FALSE)
train_data <- data[train_index,]
test_data <- data[-train_index,]


#Build the models
full_model <- lm(Sales ~ ., data = train_data)
summary(full_model)


#Check for outliers
cooks <- cooks.distance(full_model)
plot(cooks)
abline(h=1, col= "red")
which.max(cooks)

cat("An outlier is detected. There is a point significantly above the threshold line of h=1.") 

#Residual Analysis
#Checking Homoscedascity Assumption:
par(mfrow=c(2,2))
plot(train_data$Sales, full_model$residuals)
abline(h=0, col="red")
cat("#The residuals should be randomly scattered across the zero line with no clear pattern, however
#The residuals appear to be more spread out at larger values of sales, indicating increased variance as sales increases. Potential heteroscedascity present.")

#Checking homoscedascity and Linearity Assumption:
plot(full_model$fitted.values, full_model$residuals)
abline(full_model, col = "red")
cat("#the residuals are not randomly distributed. There is a noticeable funnel shape, suggesting heteroscedasticity and non-linearity.")

#Checking Normality Assumption:
qqPlot(full_model$residuals)
hist(full_model$residuals)
cat("#there are significant deviations from the line, especially at the tails. This indicates that the residuals are not normally distributed
#The histogram shows a high concentration around zero with a sharp drop-off on both sides, indicating they are not normally distrubted. 
#This needs to be addressed") 



#Transformation
#Box-cox to find optimal lambda
bc <- boxCox(full_model)
plot(bc)

#Log transformation
transformed <- log(train_data$Sales)
tf_model <- lm(transformed ~ ., data = train_data)
summary(tf_model)
 
#Recheck Assumptions to verify
par(mfrow = c(2,2))
plot(train_data$Sales, tf_model$residuals)
abline(h=0, col="red")
plot(tf_model$fitted.values, tf_model$residuals)
abline(h=0, col = "red")
qqPlot(tf_model$residuals)
hist(tf_model$residuals)

cat("#The plot shows a more consistent spread of residuals around the horizontal line, indicating an improvement in homoscedasticity")

cat("#The residuals are now more randomly scattered around the horizontal line with less pronounced patterns, indicating an improvement in both linearity and homoscedasticity.")

cat("#Significant Improvement in the plots for normality after the transformation. 
#The residuals follow the line more closely, but there are still some deviations in the tails. Not perfect normality.
#Histogram shows a bell shaped distrubtion and is not skewed. Significant improvement.  
#The deviations are not significant enough to fail the normality assumption")


#Outliers
cd <- cooks.distance(tf_model)
plot(cd)
abline(h=1, col= "red")
cat("#There are no significant outliers at a cooks distance threshold of 1.
#The influential outlier is no longer present, indicating that the transformation has successfully reduced the influence of outliers on the model.")


#Multicolinearity
library(MASS)
vif(full_model)
alias(full_model)

vif(tf_model)
alias(tf_model)

#Compare Models
summary(full_model)$adj.r.squared
summary(tf_model)$adj.r.squared
cat("#The transformed model explains more variability than the other model. It explains 98% of the variability in sales.")



#Prediction ~  
train_data1 = train_data[-c(3,8)]
test_data1 = test_data[-c(3,8)]
reduced_model <- lm(Sales ~ ., data = train_data1)
summary(reduced_model)

prediction <- predict(reduced_model, newdata = test_data1)
actual_values <- test_data1$Sales
mse <-mean((actual_values - prediction)^2)
rmse = sqrt(mse)
cat("R^2 reduced model:",summary(reduced_model)$adj.r.squared)
cat("R^2 full model:",summary(full_model)$adj.r.squared)
cat("R^2 transformed model:",summary(tf_model)$adj.r.squared)



#Predict specific scenario
new_data <- data.frame(
  Ship.Mode = "Standard Class", 
  Segment = "Home Office", 
  State  = "Florida", 
  Postal.Code = 32216,
  Region = "South",
  Category = "Technology", 
  Sub.Category = "Machines",
  Product.Name = "	
HTC One Mini",
  Quantity = 6,
  Discount = 0.50,
  Profit = -1811.0784
)
new_data$Product.Name <- factor(new_data$Product.Name, levels = levels(train_data$Product.Name))
prediction <- predict(full_model, newdata = new_data)







