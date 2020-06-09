## code to prepare `DATASET` dataset goes here

# sequences and their A-numbers
url <- "https://oeis.org/stripped.gz"
download.file(url, destfile = "data-raw/stripped.gz")

url <- "https://oeis.org/names.gz"
download.file(url, destfile = "data-raw/names.gz")

library(tidyverse)
# seqs <- read_delim("data-raw/names", delim = " ", col_names = FALSE,
#            comment = "#", col_types = "cc")

sequences <- read_fwf("data-raw/names", fwf_widths(c(7, 1000),c("sequence", "description")),
              comment = "#")

probs <- problems(sequences) # fix width, warnings expecting 1000. OK.

first_terms <- read_delim("data-raw/stripped.gz", delim = " ", col_names = FALSE,
                        comment = "#")
a <- strsplit(first_terms[[2]], ",")
first_terms$a <- a
first_terms <- first_terms %>%
  unnest(cols = "a") %>%
  filter(a != "") %>%
  group_by(X1) %>%
  mutate(n = 1:n()) %>%
  select(sequence = X1, n, a)

first_terms_n <- first_terms %>%
  group_by(sequence) %>%
  summarise(n = n(), max_ndigits = max(nchar(a)))

# saveRDS(first_terms, "data/first_terms.rds") # 70MB

usethis::use_data(sequences, overwrite = TRUE)


