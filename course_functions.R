

# Some utility functions
# ---------------------


# combination variables (6.2)
two_plots<-function(x, color, plot_title, x_text){
  layout(matrix(c(1,2), nrow=2, ncol=1), heights = c(2,1))
  par(mar=c(0, 4,3,1), bty="n")
  hist(x, main = plot_title, breaks = 25, col = color, xlim=c(0,5), xaxt="n", xlab = "")
  par(mar=c(5,4,0,1))
  boxplot(x, horizontal = T, ylim=c(0,5),  xlab=x_text, col=color)
}

# visualization of normal quantiles (7.6)
qnorm_plot <- function(alpha, twoway = F) {
  par(mar = c(7,4,5,4))
  a <- alpha
  x <- (-50:50)/10
  y <- dnorm(x)
  q1 <- qnorm(a); q2 <- qnorm(1-a)
  
  # draw the plot
  if(twoway) alph <- "alpha/2 =" else alph <- "alpha ="
  main <- paste("Critical values and regions of the N(0,1) distribution \n",
                alph, a)
  plot(x, y, type ="l", main = main, xlab = "", yaxt = "n", ylab = "", xaxt = "n")
  axis(1, at = c(-3, -1, 0, 1, 3))
  # mark the critical values with ticks
  if(twoway) at <- c(q1, q2) else at <- q1
  axis(1, at = round(at,2) , col.ticks = "red", las = 2)
  
  # show the critical value with the call to qnorm()
  mtext(paste0("- z = qnorm(",a,") = ",round(q1,2)),
        side=1, line = 4, cex = 1.5)
  
  # highlight critical regions, add matching percentages
  x1 <- x[x<=q1]; x2 <- x[x>=q2]
  if(twoway) {
    polygon(c(min(x1),x1, max(x1), min(x2), x2, max(x2)),
            c(0, dnorm(x1),0, 0, dnorm(x2), 0), col = "grey60")
    text(x = c(-3.5, 3.5), y = c(0.08,0.08), labels = paste0(a*100,"%"), cex = 1.5)
    text(x = 0, y = 0.08, labels=paste0(100*(1-alpha/2),"%"), cex = 1.5)
  } else {
    polygon(c(min(x1),x1, max(x1)),
            c(0, dnorm(x1), 0), col = "grey60")
    text(x = -3.5, y = 0.08, labels = paste0(a*100,"%"), cex = 1.5)
    text(x = 0, y = 0.08, labels=paste0(100*(1-alpha),"%"), cex = 1.5)
  }
}

# visualization of normal quantiles (9.2)
zplot <- function(critical) {
  critical <- round(critical, 2)
  z <- c(-critical, critical)
  par(mar = c(7,4,5,4))
  x <- (-40:40)/10
  y <- dnorm(x)
  main = paste("The N(0, 1) distribution \n z = ",critical)
  plot(x, y, type = "l", xaxt = "n", ylab = "n", main = main)
  axis(1, at = c(-3,  0,  3))
  axis(1, at = round(z, 2) , col.ticks = "red", las = 2)
  
  # highlight critical regions, add matching percentages
  x1 <- x[x<=min(z)]; x2 <- x[x>=max(z)]
  a <- round(pnorm(min(z)),2)
  
  polygon(c(min(x1),x1, max(x1), min(x2), x2, max(x2)),
          c(0, dnorm(x1),0, 0, dnorm(x2), 0), col = "grey60")
  text(x = c(-3.5, 3.5), y = c(0.08,0.08), labels = paste0(a*100,"%"), cex = 1.5)
  text(x = 0, y = 0.08, labels=paste0(100*(1-a*2),"%"), cex = 1.5)
}

# visualization of critical regions (9.4)
regions <- function(a, direction) {
  par(col = "grey60", cex=1.2)
  x <- (-50:50) / 10
  y <- dnorm(x)
  col1 <- "steelblue"
  lwe <- 2
  plot(x, y,type = "l", main = "", xlab = "", yaxt = "n", ylab = "",lwd = lwe, axes=F)
  ab<-abline(h=0, lwd=lwe)
  if (direction == 'l') {
    q1 <- qnorm(a)
    x1 <- x[x <= q1]
    polygon(c(min(x1), x1, max(x1)),c(0, dnorm(x1), 0),col = col1,border = col1,lwd = lwe)
    ab
    title("Plot 1", adj=0)
    text(-2.5, .1, paste(a*100, "%"), col="steelblue", cex=1.5)
  }
  if (direction == 'r') {
    q1 <- qnorm(1 - a)
    x1 <- x[x >= q1]
    polygon(c(min(x1), x1, max(x1)),c(0, dnorm(x1), 0),col = col1,border = col1,lwd = lwe)
    ab
    title("Plot 2", adj=0)
    text(2.5, .1, paste(a*100, "%"), col="steelblue", cex=1.5)
  }
  if (direction == 'm') {
    q1 <- qnorm(a / 2)
    q2 <- qnorm(1 - (a / 2))
    x1 <- x[x <= q1]
    x2 <- x[x >= q2]
    polygon(c(min(x1), x1, max(x1)),c(0, dnorm(x1), 0), col = col1, border = col1, lwd = lwe)
    polygon(c(min(x2), x2, max(x2)),c(0, dnorm(x2), 0), col = col1, border = col1, lwd = lwe)
    ab
    title("Plot 3", adj=0)
    text(c(-2.5,2.5), c(.1,.1), paste((a/2)*100, "%"), col="steelblue", cex=1.5)
  }
}


# draw SURVO style barplot
leafplot <- function(x, char = "*") {
  t <- table(x)
  for(i in seq_along(t)) {
    cat(
      paste0(names(t[i]), ": ", 
             paste(rep(char, times = t[i]), collapse = ""),
             "\n"))
  }
}

# simulate and plot correlated data
simulate <- function(n = 60) {
  
  # degree (d) of the polynomial relationship
  degree <- sample(1:3, 1)
  
  # x values
  x <- rnorm(n)
  
  # return each x^d multiplied by it's coefficient b_d
  # b_d are sampled from U(-1, 1)
  X <- sapply(1:degree, function(d) {
    b_d <- runif(1, min = -1, max = 1)
    b_d * x^d
  })
  
  # linear relationship y = b_1 * x^1 + .. + b_d * x^d + error
  y <- rowSums(X) + rnorm(n)
  
  # scatterplot with regression line
  plot(x, y, col = "grey40", type = "p", pch = 20, xlab = "", ylab="")
  
  return(list(x = x, y = y))
}

# Use data produced by simulate()
# draw a scatterplot with a regression line
# display the correlation
show_correlation <- function(df) {
  x <- df$x
  y <- df$y
  plot(x, y, type = "p", col = "grey40", pch= 20, xlab="", ylab="",
       sub = paste("correlation:", round(cor(x, y),2)))
  abline(lm(y~x), col ="red")
}