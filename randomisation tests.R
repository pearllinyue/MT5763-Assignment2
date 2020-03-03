set.seed(180025784)

#remove the parameter "RestPulse" that is useless for the model
alteredFitness <- fitness %>% select (-RestPulse)

#compute the slope of alteredModel
estimatedSlope <- coef(alteredModel)[2]

#to store simulations
simResults <- numeric(999)

simData <- alteredFitness

for (i in 1: 999){
  #shuffle the variables WRT Oxygen
  simData$Oxygen <- sample(alteredFitness$Oxygen, 31, replace = T)
  #fit a model under H0
  simLM <- lm (Oxygen~., data = simData)
  #store the slope
  simResults[i] <- coef(simLM)[2]
}

#draw the histogram and line of estimatedSlope to compare
hist(simResults, col = "slateblue4")
abline(v = estimatedSlope, lwd = 3)
#reject H0 maybe

addEst <- c(estimatedSlope, simResults)

locEst <- c(1, rep(0,999))

locEst <- locEst[order(addEst)]

k <- which(locEst == 1)

min(k/1000, 1-k/1000)*2


###partial relationships
termplot(alteredModel, data = alteredFitness,partial.resid = TRUE)
