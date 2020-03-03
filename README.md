# MT5763-Assignment2

# Introduction

This project encompasses focusses on reproducible research, collaboration, version control, computer-intenstive inference and profiling. There is a group component where you can collaborate on producing some demonstrably improved code. Parts of this will transfer to your individual component which is fitting linear models and associated computer-intensive inference.


----------------------


# What to do - Group component

* Create a Github repository for your team to work through for this project - the owner is up to you.
* Obtain relevant files here - [Project 2 repo](https://github.com/statsgeeknz/MT5763_project_2) 
* Add these to your repository


__________

__Tasks__

As a group:

1. Modify the SAS bootstrapping macro to be more efficient. Once you have a better version - determine how much faster you have made it.

1. The final function should output results to an RTF file using the Output Delivery System. This should have 95% confidence intervals for the mean, the mean estimate for each parameter and plots of the distributions of the bootstrap parameters. It need only work for one covariate.

1. Modifications to the macro should be version controlled via your project GitHub repository.

1. Modify the the R bootstrapping code to be more efficient. It should also be parallelised at some level. You should profile both the original and final versions as well as determining the overall speed increase. Include the profile file in your repository.

1. Your new bootstrap function in R should be altered to accept an arbitrary number of covariates.


1. Modifications to the bootstrap function should be version controlled via your project GitHub repository.


1. Micro-benchmark (package `microbenchmark`) your R bootstrap against bootstraps via the package `boot`.


__NB__ Your improved function will be used for your individual submissions


__________


__The group submission__

You should all make contributions to the project repository. Perhaps allocate problems for each team member to solve in the coding and reporting. The group "submission" will consist of this repository. This will all ultimately be reflected in your version control. The repository should contain:

  * Functioning code obviously

  * A markdown file (and whatever compiled variant) that explains what the two functions do and how to use them. This should also contain a short example analysis, including plots and interpretation. The data underpinning the example should also be available in the repository.

  * You should include a figure indicating the increases in speed attributable to each of your major changes to the code as well as the `microbenchmark` results against package `boot`.

  * A profile file for the R bootstrap
  
Your group submission therefore will simply be a repository for me to view/download. This group component constitutes 40% of your overall grade. You'll be assessed on:

* Your code - readable, logical, tidy, works and version controlled.
* Clear documentation.
* Evidently improved code displayed through timing, profiling, parallelisation and documentation.
* Expansion of R code for general numbers (and types!) of covariates.


---------------


# What to do - Individual component

Your individual project will be a mark-down document. You are seeking to build a model that predicts Oxygen intake rates (a measure of aerobic fitness) on the basis of a series of easily obtained measurements. The data is from Rawlings (1998) _Applied Regression Analysis: A Research Tool_ 2nd Edition, and contains the following: 

* `Age` - Age in years
* `Weight` - Weight in kg 
* `Oxygen` - Oxygen intake rate, _ml_ per kg body weight per minute 
* `RunTime` - time to run 1.5 miles in minutes
* `RestPulse` - heart rate while resting
* `RunPulse` - heart rate at end of run
* `MaxPulse` - maximum heart rate recorded while running

-----------------------

__Tasks__

* Use the dataset _fitness.csv_ to fit a linear model predicting the variable `Oxygen`. Perform model diagnostics and take whatever remedial action is required to give a good model.

* Use your R bootstrapping function from your group to provide confidence intervals for all terms in your model.

* Perform randomisation tests for all of the same model terms (__tip__ you can do them for all the covariates "at the same time" by randomising `y`). You'll have to write your own function for this.

* Write up your findings. You should indicate what covariates are statistically significant and interpret all tests and confidence intervals. Your report should also include plots showing the (partial) relationships between each covariate and the response (see the function `termplot` or `effect` in the effects package).


----------------------


# Assessment - individual report

The report should be roughly limited to 3000 words and should contain relevant plots - however you can put extra output in an appendix at the end. Include an introductory section describing the purpose of your investigation and a discussion at the end summarising your findings. Include an executive summary at the start of the report. The target audience is statistically literate, but is not familiar with computer intensive inference, so these parts should be described in the methods section.

Do not include raw output or code in the body of the report - make sure any results you include are tidy (e.g. in a table) and are relevant. Include an appendix in your report with the code that you used. 


The report should:
 
* answer all the questions given above

* include references in an established academic style, for example your software, the article above, other articles

* be uploaded to Moodle

* include your ID number in the document name

* don't use your name in the document, only your ID number for anonymity.

* Include a code file that performs the randomisation test. It should include the function and the call to the function that provided your results. Use your ID number as a random seed (`set.seed()`) for reproducibility.

-----------------


This individual component constitutes 40% of your overall grade. You'll be assessed on:

* Your code - is it readable, logical, tidy, does it do what it should?
* Your report - is it professional, presentable, referenced, logical, readable.
* Your understanding of the problem and interpretation of results.

