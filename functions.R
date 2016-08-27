
# load JYT data from github repo
get_data <- function() read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-data.txt", sep="\t", header=TRUE)

# open metadata in a browser window
meta <- function() browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS-meta.txt")

