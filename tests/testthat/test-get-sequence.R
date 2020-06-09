test_that("Get sequence", {


  A <- "A000040"
  x <- get_sequence(A)


  a1 <- get_sequence("A306302")
  a2 <- get_sequence("A331766")



  library(rvest)

  url <- paste0("https://oeis.org/", A)

  h <- read_html(url) %>%
    html_table(fill = TRUE, trim = TRUE)

  info <- h[[7]]

  links <- info[[3]][info[[2]] == "LINKS"]
  cat(links)

})

test_that("more seqs",{

  # Seq with long numbers
  x <- get_sequence("A058254")

})



