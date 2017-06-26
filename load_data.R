#Execute in ""

wd <- "/home/enrique/Dropbox/Coursera/DS/machine-learning-coursera/"
setwd(wd)

url.training = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
url.testing = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

file.training = "pml-training.csv"
file.testing = "pml-testing.csv"

download.file(url.training, destfile = file.training)
download.file(url.testing, destfile = file.testing)



