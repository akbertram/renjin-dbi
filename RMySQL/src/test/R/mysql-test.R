library(hamcrest)
library(RMySQL)
library(DBI)


  con <- dbConnect(MySQL(), dbname = "test", username="root", password="root")

  expected <- data.frame(
    a = c(1:3, NA),
    b = c("x", "y", "z", "E"),
    stringsAsFactors = FALSE
  )

  dbWriteTable(con, "dat", "dat-n.bin", sep="|", eol="\n", overwrite = TRUE)
  dbReadTable(con, "dat")