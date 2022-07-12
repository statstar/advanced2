set.seed(123)
sel<- sample(1:150,120)

train.data <- iris[sel,];test.data <- iris[-sel,]

library(caret)
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats=3,
                           search = "random")

rf_fit <- train(Species ~ ., data = train.data, 
                 method = "rf", trControl = fitControl)

gbm_fit <- train(Species ~ ., data = train.data, 
                 method = "gbm", trControl = fitControl)

varImp(rf_fit); varImp(gbm_fit)

pred.rf <- predict(rf_fit, test.data) ;pred.gbm <- predict(gbm_fit, test.data)

table(test.data$Species, pred.rf); table(test.data$Species, pred.gbm)
