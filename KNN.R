pro_can <- read.csv("C:/Users/rohan/Downloads/Prostate_Cancer.csv",stringsAsFactors = FALSE)
pro_can
pro_can<-pro_can[-1]
head(pro_can)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }
pro_can_n <- as.data.frame(lapply(prc[2:9], normalize))
summary(pro_can_n$radius)
pro_can_train <- pro_can_n[1:65,]
pro_can_test <- pro_can_n[66:100,]
pro_can_train_labels <- pro_can[1:65, 1]
pro_can_test_labels <- pro_can[66:100, 1]
install.packages('class')
library(class)
pro_can_test_pred <- knn(train = pro_can_train, test = pro_can_test,cl = pro_can_train_labels, k=10)
install.packages('gmodels')
library(gmodels)
CrossTable(x=pro_can_test_labels, y=pro_can_test_pred, prop.chisq = FALSE)
