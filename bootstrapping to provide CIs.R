#the bootstrapping function from groupwork
#install.packages("boot")
library(boot)

lmBoot_par <- function(inputData, nBoot){
  #Purpose: Generate a large number of linear regression beta coefficients using
  #         bootstrap methods.
  #Inputs: inputData: a dataframe containing the response variable, which must be 
  #        in the first column of the dataframe, and the covariates of interest
  #        nBoot: the number of bootstrap samples to generate.
  #Outputs: BootResults: An arraycontaing the parameter estimates of each 
  #         each bootstrap sample.
  #         ConfidenceIntervals: A matrix containing 95% confidence intervals 
  #         for each parameter.
  
  #Calculate the number of observations in the dataset 
  nObs <- nrow(inputData)
  
  #Create the sample data with 1s for the intercept
  sampleData <- as.matrix(cbind(inputData[, 1], 1, inputData[, -1]))
  
  #Set up parallisation
  nCores <- detectCores()
  myClust <- makeCluster(nCores - 1, type = "PSOCK")
  registerDoParallel(myClust)
  
  # Create the samples
  bootSamples <- matrix(sample(1:nrow(inputData), nObs * nBoot, replace = T), 
                        nrow = nObs, ncol = nBoot)
  
  #Use parallised sapply to apply bootLM to bootResults matrix
  bootResults <- matrix(NA, nBoot, ncol(sampleData[, -1]))
  bootResults <- parSapply(myClust, 1:nBoot, bootLM, inputData = sampleData, 
                           samples = bootSamples)
  
  #Close parallisation
  stopCluster(myClust)
  
  return(t(bootResults))
}

#results of the bootstrapping results
#install.packages("parallel")
#install.packages("doParallel")
#install.packages("IPSUR")
library(parallel)
library(doParallel)
library(IPSUR)
results <- boot(data = fitness, statistic = lmBoot_par, R = 1000, formula = alteredModel)

#provide confidence intervals
boot.ci(results, type = "basic", index=1) #intercept
boot.ci(results, type = "basic", index=2) #Age
boot.ci(results, type = "basic", index=3) #Weight
boot.ci(results, type = "basic", index=4) #RunTime
boot.ci(results, type = "basic", index=5) #RunPulse
boot.ci(results, type = "basic", index=6) #MaxPulse