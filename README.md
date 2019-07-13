
**Forecasting Health Expenses Using a Functional Data Model**





**Abstract**

Traditionally, actuaries make their predictions based on simple, robust methods. Stochastic models become increasingly popular because they can enrich the point estimates with error estimates or even provide the whole probability distribution. Here, we construct such a model for German inpatient health expenses per age using the functional data approach. This allows us to see in which age groups the expenses change the most and where predictions are most uncertain. Jumps in the derived model parameters indicate that three years might be outliers. In fact, they can be explained by changes in the reimbursement system and must be dealt with. As an application we compute the probability distribution of the total health expenses in the upcoming years.

To appear in [Annals of Actuarial Science](https://www.cambridge.org/core/journals/annals-of-actuarial-science)

**Special versions of R packages**

The treatment of the outliers required some changes in **R** packages *demography* and *ftsa*. Special modified versions of these packages are needed.

This following code will install the required versions: 

```r
install.packages("devtools")
library(devtools)
install_github("robjhyndman/demography#37")
install_github("JensPiontkowski/ftsa")
```
For the remaining package versions see *sessionInfo.txt*
