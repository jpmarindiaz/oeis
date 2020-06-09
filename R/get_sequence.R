

#' @export
get_sequence <- function(A){
  if(!is_sequence(A)){
    stop("Sequence not in catalogue. See available sequence using oeis::sequences")
  }
  seq_b_url <- paste0("https://oeis.org/", A,"/",
                      paste0(gsub("A","b",A), ".txt"))
  seq <- read_delim(seq_b_url, delim = " ", col_names = FALSE,
                    comment = "#", col_types = "cc")
  names(seq) <- c("n", "a")
  seq
}

#' @export
search_sequence <- function(keyword){
  idx <- grepl(keyword, oeis::sequences[[2]])
  oeis::sequences[idx,]
}

is_sequence <- function(A){
  A %in% oeis::sequences[[1]]
}
