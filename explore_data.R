file.training = "pml-training.csv"
file.testing = "pml-testing.csv"



training <- read.csv(file.training)

head(training)

str(training)

summary(training)

training$kurtosis_yaw_forearm


# muchos nulos, blancos y "#DIV/0!"

nastrings = c("NA","","#DIV/0!")
training <- read.csv(file.training)
training <- read.csv(file.training, na.strings = nastrings)

testing <- read.csv(file.testing)

head(training)


plot(training$classe)
plot(training$user_name, training$classe)
plot(training$classe, training$roll_belt)


#primera aproximación

library(caret)
nearZeroVar(training, saveMetrics = TRUE)
summary(training$amplitude_yaw_forearm)


nullRate <- function (col) {
  nuls <- sum(is.na(training[,col]))
  total <- length(training[,col])
  nuls/total
}


nullRate("amplitude_roll_arm")

lotOfNulls <- sapply(names(training),nullRate) > .9

nz <- nearZeroVar(training, saveMetrics = TRUE)

descartadas <- nz$nzv | lotOfNulls | names(training) == "classe"
validas <- names(training)[!descartadas]

str(training[,validas])

form <- paste("classe", paste(validas, collapse=" + "), sep=" ~ ")

print(form)


modelFitTree <- train(formula(form)  , method="rpart", data=training)
modelFitRandomForest <- train(formula(form)  , method="rf", data=training)


table(training$classe,predict(modelFitTree, training))
table(training$classe,predict(modelFitRandomForest, training))

#Para el test: 

table(predict(modelFitRandomForest, training))

?predict







