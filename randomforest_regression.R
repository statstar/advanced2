head(airquality)

air2 <- airquality %>% 
  filter(complete.cases(.))

lm.model <- lm(Ozone~Solar.R+Wind+Temp, 
               data=air2)

library(dplyr)
rf.model <- randomForest(Ozone~Solar.R+Wind+Temp, 
               data=air2)

pred.lm <- predict(lm.model, air2)
pred.rf <- predict(rf.model, air2)

plot(air2$Ozone, pred.lm)
plot(air2$Ozone, pred.rf)

par(mfrow=c(2,1))
