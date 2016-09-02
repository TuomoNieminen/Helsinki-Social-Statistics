
  # get small dataset

# load data from web
students2014 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-data.txt", sep="\t", header=TRUE)
# keep a couple background variables
students2014 <- students2014[,c("sukup","toita","ika","pituus","kenka","kone")]
# recode kone variables missing values as factor levels
students2014$kone <- addNA(students2014$kone)
# keep only rows without missing values
students2014 <- students2014[complete.cases(students2014),]
# integers to numeric
students2014$ika <- as.numeric(students2014$ika)
students2014$pituus <- as.numeric(students2014$pituus)
students2014$kenka <- as.numeric(students2014$kenka)


# open metadata in a browser window
open_meta <- function() browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-meta.txt")

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