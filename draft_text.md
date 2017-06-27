# Introduction
The purpose of this study is to predict several excercises [fashion] as performed by several participants

The classification categories are:

 A , B, C...

 The variables used for the prediction are [varias] related to several sensors [ejemplos]

 "data origin"

# Data analisis


 After performing data analysis, several [cosas destacan]

- Some variables have a lot of nulls: [tabla]
- Some variables have nulls disguised as "" or "#DIV/0!
- Some variables have veri low variance
- The first variable in the data file is the row number, but it is Strongly correlated with the outcome:
[grafico]

  This is dangerous, because it is a correlation that only exists in this file and can "misguide" any training algorith, so we "decide" to remove this variable.

# Training

First of all, we split the data set into training and validation

Then, we "olvidamos" the variables with a highl level of noise: hight proportions of NA, near zero variance, and the line-number variables

The final set of variables are:

[lista]

For the prediction, the method selected is the random forests algorithm, that includes cross validation and variable bootstrap.

The trained model has the following parameters:


The estimated error from the cross validation in the training data set is.


We use the validation data set to estimate the out of sample error:



¿ROC curve?
