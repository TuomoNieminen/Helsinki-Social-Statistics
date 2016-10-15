
# Data for part 1
# ---------------

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


# Metafile
# ----------

# open metadata in a browser window
open_meta <- function() browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-meta.txt")


# Data for part 2
# ---------------

# create data for part 2

# read data
df <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS2-data.txt", sep="\t", header=TRUE)

# variables to keep
learning2014 <- df[,c("Age", "Gender", "Attitude","Points", "Deep_adj", "Surf_adj", "Stra_adj")]
# scale Attitude to 1 - 5
learning2014$Attitude <- learning2014$Attitude / 10
# new colnames
colnames(learning2014) <- c("age", "gender","attitude", "points", "deep", "surf", "stra")
# suffle the data (first six students were really old!)
learning2014 <- learning2014[sample(nrow(learning2014)),]
rownames(learning2014) <- NULL
# round
learning2014 <- round(learning2014, 1)
# recode gender to factor
learning2014$gender <- factor(learning2014$gender, levels = c(1,2), labels = c("M","N"))
# peek at first 6 rows
head(learning2014)

write.table(file = "learning2014.txt", learning2014, sep = "\t")

learning2014 <-  read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/learning2014.txt", sep = "\t", header = TRUE)

open_meta2 <- function() browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS2-meta.txt")

# Kimmon analyyseja
browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/Abstract-Vehkalahti.pdf")
browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/Kimmo_Vehkalahti_ISI60.pdf")


# Some utility functions
# ---------------------

get_z <- function(alpha) {
  par(mar = c(7,4,5,4))
  a <- alpha/2
  x <- (-50:50)/10
  y <- dnorm(x)
  q1 <- qnorm(a); q2 <- qnorm(1-a)
  
  # draw the plot
  main <- paste("Critical values and regions of the N(0,1) distribution \n",
                " alpha/2 =", a)
  plot(x, y, type ="l", main = main, xlab = "", yaxt = "n", ylab = "")
  mtext(paste0("-z = qnorm(",1 - a,") = ",round(q1,2),"\n",
               "z = qnorm(",a,") = ",round(q2,2)),side=1, line = 5, cex = 1.5)
  
  # highlight critical regions
  x1 <- x[x<=q1]; x2 <- x[x>=q2]
  polygon(c(min(x1),x1, max(x1), min(x2), x2, max(x2)),
          c(0, dnorm(x1),0, 0, dnorm(x2), 0), col = "grey60")
  text(x = c(-3.5, 3.5), y = c(0.08,0.08), labels = paste0(a*100,"%"), cex = 1.5)
  text(x = 0, y = 0.08, labels=paste0(100*(1-alpha),"%"), cex = 1.5)
  return(q2)
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