---
title: "Forecasting Health Expenses Using a Functional Data Model"
output: 
  html_document: 
    keep_md: yes
---




#Abstract

Traditionally, actuaries make their predictions based on simple, robust methods. Stochastic models become increasingly popular because they can enrich the point estimates with error estimates or even provide the whole probability distribution. Here, we construct such a model for German inpatient health expenses per age using the functional data approach. This allows us to see in which age groups the expenses change the most and where predictions are most uncertain. Jumps in the derived model parameters indicate that three years might be outliers. In fact, they can be explained by changes in the reimbursement system and must be dealt with. As an application we compute the probability distribution of the total health expenses in the upcoming years.



#Special versions of R packages

The treatment of the outliers required some changes in **R** packages *demography* and *ftsa*. At the moment development versions of these packages are needed. In addition, the newest version of the *rainbow* package is needed.

This following code will install the required versions: 



```r
install.packages("rainbow")
install.packages("devtools")
library(devtools)
install_github("robjhyndman/demography")
install_github("JensPiontkowski/ftsa")
```
