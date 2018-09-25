# modified version of a plot function in the ftsa package 

plot_coeff <- function(fc, test, basiscol = 1, coeffcol = 1,
                       shadecols = 7, fcol = "red", main, ylimList = list(), ...){
  
  xlab = "Year"
  ylab = "Coefficient"
  
  test_rate <- test$rate$male 
  test_rate <- test_rate - matrix(fc$model$basis[,"mean"], 
                                  nrow = nrow(test_rate), 
                                  ncol = ncol(test_rate), 
                                  byrow = FALSE)
  
  test_coeff <- t(test_rate) %*% fc$model$basis[,-1]
  
  n <- ncol(test_coeff)
  
  oldpar <- par(no.readonly = TRUE)
  par(mfcol = c(1, n), mar=c(5,4,4,2) + 0.1 - 1)
  
  for (i in 1:n) {
    yl <- ifelse(n > 1, paste(ylab, i), ylab)
    plot(fc$coeff[[i + 1]], type = "n", xlab = xlab, 
         ylab = paste(ylab, i), ylim =  ylimList[[i]],
         main = "", shadecols = shadecols,
         fcol = fcol, col = coeffcol)#, ...)
    lines(fc$coeff[[i + 1]]$x, col = "gray")
    junk <- fc$coeff[[i + 1]]$x
    junk[fc$model$weights < 1e-06] <- NA
    lines(junk, col = coeffcol)
#    lines(fc$coeff[[i + 1]]$model$fitted, col = fcol)
    points(as.integer(rownames(test_coeff)), test_coeff[, i], pch = 19, #pch = 3,
           col = coeffcol)
  }
  par(oldpar)
}
