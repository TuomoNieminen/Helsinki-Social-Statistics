
# get small dataset
get_data <- function() {
  students2014 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-data.txt", sep="\t", header=TRUE)
  
  # keep a couple background variables
  students2014 <- students2014[,c("sukup","toita","ika","pituus","kenka","kone")]
  
  # recode kone -variable NA values as factor levels
  students2014$kone <- addNA(students2014$kone)
  
  # choose rows without missing values
  students2014 <- students2014[complete.cases(students2014),]
  
  students2014
}
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
  
  # degree (d) of the polynomial
  degree <- sample(1:3, 1)
  
  # x values
  x <- rnorm(n)
  
  # each x^d multiplied by it's coefficient
  # the coefficients are sampled from U(-1, 1)
  X <- sapply(1:degree, function(d) {
    b <- runif(1, min = -1, max = 1)
    b * x^d
  })
  
  # linear equation y = b_1 * x^1 + .. + b_d * x^d + e
  y <- rowSums(X) + rnorm(n)
  
  # scatterplot with regression line
  plot(x, y, col = "grey40", type = "p", pch= 20, xlab="", ylab="")
  
  return(list(x = x, y = y))
}

show_correlation <- function(df) {
  x <- df$x
  y <- df$y
  plot(x, y, type = "p", col = "grey40", pch= 20, xlab="", ylab="",
       sub = paste("correlation:", round(cor(x, y),2)))
  abline(lm(y~x), col ="red")
}