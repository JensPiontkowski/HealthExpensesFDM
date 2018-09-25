plot_sim_total <- function(fc, test, years, main, xlim = NULL, ...){
  n <- length(years)
  nsim <- 5000
  sim <-  simulate(fc, nsim = nsim, adjust.modelvar = FALSE, bootstrap = TRUE)
  dim(sim)
  dim(test$pop$male)
  dim(replicate(nsim, test$pop$male))
  total_claims <- colSums(replicate(nsim, test$pop$male) * sim)/10^6
  dim(total_claims)
  dim(test$rate$male)
  true_claims <-  colSums(test$pop$male * test$rate$male)/10^6
  
  if (is.null(xlim))
    xlim <- c(min(total_claims), max(total_claims))
  
  colors <- gray((n-1):0 / n)
  colors <- c("red", "green3" , "blue")
  
  oldpar <- par(no.readonly = TRUE)
  par(mar=c(5,4,4,2) + 0.1 - 1) #mar=c(5,4,4,2) + 0.1
  plot(0, type = "n", xlim = xlim, ylim = c(0, 0.2),
       main = main, ylab = "", xlab = "million euros", ...)
  for (i in 1:n){
    lines(density(total_claims[as.character(years[i]),]), lwd = 2, col = colors[i])
    abline(v = true_claims[as.character(years[i])], lwd = 2, col = colors[i])
  }
  legend("topright", legend=as.character(years), col = colors, lwd = 2)
  par(oldpar)
}
