library(caret)

file.training = "pml-training.csv"
file.testing = "pml-testing.csv"

nastrings = c("NA","","#DIV/0!")
total.training <- read.csv(file.training, na.strings = nastrings)
testing <- read.csv(file.testing)

set.seed(1111)
inTrain <- createDataPartition(y=total.training$classe, p=.75, list=FALSE)

training <- total.training[inTrain,]
validation <- total.training[-inTrain,]


nullRate <- function (col) {
  nuls <- sum(is.na(training[,col]))
  total <- length(training[,col])
  nuls/total
}

#Cleaning

lotOfNulls <- sapply(names(training),nullRate) > .9
nz <- nearZeroVar(training, saveMetrics = TRUE)

# Quitamos tambien el numero de fila: es peligroso
descartadas <- nz$nzv | lotOfNulls | names(training) == "classe" | names(training) == "X"
validas <- names(training)[!descartadas]

form <- paste("classe", paste(validas, collapse=" + "), sep=" ~ ")

modelFitTree <- train(formula(form)  , method="rpart", data=training)
modelFitRandomForest <- train(formula(form)  , method="rf", data=training)


#Evaluation


table(validation$classe,predict(modelFitTree, validation))
confusionMatrix(validation$classe,predict(modelFitTree, validation))


table(training$classe,predict(modelFitRandomForest, training))

modelFitTree$finalModel





#Para el test: 

table(predict(modelFitTree, testing))
table(predict(modelFitRandomForest, testing))

?predict


