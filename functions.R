
get_data <- function() read.table("https://raw.githubusercontent.com/TuomoNieminen/Helsinki-Social-Statistics/master/data/JYTOPKYS-data.txt", sep="\t", header=TRUE)
meta <- function() browseURL("https://raw.githubusercontent.com/TuomoNieminen/Helsinki-Social-Statistics/master/data/JYTOPKYS-meta.txt")

