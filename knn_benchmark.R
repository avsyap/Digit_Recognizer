# makes the KNN submission

library(FNN)

train <- read.csv("train.csv", header=TRUE)
test <- read.csv("test.csv", header=TRUE)

subset_size <- 1000
labels <- train[1:subset_size,1]
train_subset <- train[1:subset_size,-1]
test_subset <- test[1:subset_size,]

system.time(results <- knn(train_subset, test, labels, k = 10, algorithm = "cover_tree"))

write(results, file="knn_benchmark_test.csv", ncolumns = 1) 
#predicts 10 when inputs don't have 10s
#does not output zeros

#time for train:1000 and test:1000 = 5 secs
#time for train:4000 and test:4000 = 68 secs
#time for train:2000 and test:1000 = 10 secs
#total time estimate = 1.63 hrs
