fc_error <- function(fc, test, modelName){
  eps <- fc$rate$male - test$rate$male
  data.frame(model = modelName,
             year = test$year,
             error = colMeans(eps),
             MAE = colMeans(abs(eps)),
             RMSE  = sqrt(colMeans(eps^2)))
}

  