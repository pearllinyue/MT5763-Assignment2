#input data
fitness <- read.csv("Desktop/MT5763/Assignment 2/fitness.csv", header = T)
head(fitness)

#fit an initial model "Oxygen_Model" to predict "Oxygen"
Oxygen_Model <- lm(Oxygen~., data = fitness)
summary(Oxygen_Model)

#anova of the initial model
#~install.packages("car")
library(car)
Anova(Oxygen_Model)

#choose a model by AIC and do anova for the new model
Oxygen_Model <- step(Oxygen_Model)
Anova(Oxygen_Model)

#model diagnostics & remedial actions

##model diagnostics - error shape
qqnorm(resid(Oxygen_Model))
qqline(resid(Oxygen_Model))
shapiro.test(resid(Oxygen_Model))
hist(resid(Oxygen_Model))
###track down the extreme residuals
bigResid <- which(abs(resid(Oxygen_Model))>5)
fitness[bigResid,]

##model diagnostics - error spread
Oxygen_Resid <- resid(Oxygen_Model)
plot(fitted(Oxygen_Model), Oxygen_Resid, ylab = 'residuals', xlab = 'Fitted values')
###testing using the ncvTest
ncvTest(Oxygen_Model, ~.)

##model diagnostics - error independence (durbinWatsonTest)
durbinWatsonTest(Oxygen_Model)

##model diagnostics - default plots
plot(Oxygen_Model, which = 1:2)

##model diagnostics - collinearity
library(GGally)
library(tidyverse)
numericOnly <- fitness %>% select_if(is.numeric)
ggpairs(numericOnly)

##make a better altered model
alteredModel <- update(Oxygen_Model,.~.-comp.ratio)
vif(alteredModel)

##again: model diagnostics - error shape
qqnorm(resid(alteredModel))
shapiro.test((resid(alteredModel)))
ncvTest(alteredModel)

##summary of altered model
summary(alteredModel)

##anova and confidence intervals of altered model
Anova(alteredModel)
confint(alteredModel)