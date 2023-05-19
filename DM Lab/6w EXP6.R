# AIM:- TO PERFORM THE CLASSIFICATION BY BAYESIAN CLASSIFICATION ALGORITHM USING R.

library(e1071) # Provides functions for statistic and probabilistic algorithms
library(caTools)
library(caret)  # ML Library in R enables to train different types of algorithms using a simple train function.

data("iris")
str(iris)
summary(iris)
# Splitting data into train and test data
split = sample.split(iris, SplitRatio = 0.7)
dataTrain = subset(iris, split==TRUE)
dataTest = subset(iris, split==FALSE)

dataTrain
dataTest

# Feature Scaling
train_scale <- scale(dataTrain[, 1:4])
test_scale <- scale(dataTest[, 1:4])

# Fitting Naive Bayes Model to training dataset
set.seed(120) # Setting Seed
classifier_cl <- naiveBayes(Species ~ .,dataTrain)
classifier_cl

# Predicting on test data'
dataTestPred <- predict(classifier_cl,dataTest)
dataTestPred

# Confusion Matrix
table_matrix <- table(dataTest$Species, dataTestPred)
print(table_matrix)


# Model Evaluation
confusionMatrix(table_matrix)
