file.training = "pml-training.csv"
file.testing = "pml-testing.csv"



training <- read.csv(file.training)

head(training)

str(training)

summary(training)

training$kurtosis_yaw_forearm


# muchos nulos, blancos y "#DIV/0!"

nastrings = c("NA","","#DIV/0!")
training <- read.csv(file.training, na.strings = nastrings)

head(training)


plot(training$classe)
plot(training$user_name, training$classe)
plot(training$classe, training$roll_belt)


#primera aproximación

library(caret)
nearZeroVar(training, saveMetrics = TRUE)
summary(training$amplitude_yaw_forearm)

descartadas <- nearZeroVar(training)
descartadas <-c(descartadas, 160)
validas <- names(training)[-descartadas]

form <- paste("classe", paste(validas, collapse=" + "), sep=" ~ ")

print(form)

modelFitTree <- train(classe ~ skewness_pitch_arm  , method="rpart", data=training)


nearZeroVar(training$skewness_pitch_arm)

