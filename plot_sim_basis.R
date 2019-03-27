plot_sim_basis <- function(fc, test, years , quant.lower = .1, quant.upper = .9, main, ...){
  
  sim <-  simulate(fc, nsim = 5000, adjust.modelvar = FALSE, bootstrap = TRUE)
  
  sim_mean <- apply(sim, c(1,2), mean) -  matrix(fc$model$basis[,"mean"], nrow = nrow(sim), ncol = ncol(sim), byrow = FALSE)
  sim_lo   <- apply(sim, c(1,2), quantile, p = quant.lower) -  matrix(fc$model$basis[,"mean"], nrow = nrow(sim), ncol = ncol(sim), byrow = FALSE)
  sim_hi   <- apply(sim, c(1,2), quantile, p = quant.upper) -  matrix(fc$model$basis[,"mean"], nrow = nrow(sim), ncol = ncol(sim), byrow = FALSE)
  
  test_rate <- test$rate$male -  matrix(fc$model$basis[,"mean"], nrow = nrow(sim), ncol = ncol(sim), byrow = FALSE)
  test_rate_in_Basis <- fc$model$basis[,c("phi1", "phi2")] %*% t(t(test_rate) %*% fc$model$basis[,c("phi1", "phi2")])
  
  x <-  as.integer(rownames(sim))
  
  oldpar <- par(no.readonly = TRUE)
  par(mfcol = c(1, length(years)), mar=c(5,4,4,2) + 0.1 - 1) #mar=c(5,4,4,2) + 0.1
  for(year in years){
    # the following line will be overdrawn by the polygon
    plot(x, sim_mean[,as.character(year)], type = "l", lwd = 2, xlab = "age", ylab = "", main = paste(main, year), ...)
    polygon(c(x, rev(x)),
            c(sim_lo[,as.character(year)], rev(sim_hi[,as.character(year)])), col="yellow", border = NA)
#    lines(x, sim_mean[,as.character(year)], type = "l", lwd = 2, col = "blue") # prediction on the mean, very similar to point prediction
    lines(x, test_rate[,as.character(year)], type = "l", lwd = 2, col = "black")
    lines(x, test_rate_in_Basis[,as.character(year)], type = "l", lwd = 2, col = "gray")    
    
    lines(x, fc$rate[[1]][,as.character(year)] -  fc$model$basis[,"mean"], lwd = 2, col = "red")  
    lines(x, fc$rate[[2]][,as.character(year)] -  fc$model$basis[,"mean"], lwd = 1, col = "red")
    lines(x, fc$rate[[3]][,as.character(year)] -  fc$model$basis[,"mean"] , lwd = 1, col = "red")
  }
  par(oldpar)
}
