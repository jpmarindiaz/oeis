
#' @export
fit_poly <- function(seq, order){
  fit <- lm(a~poly(n,order,raw=TRUE), data = seq)
  pred <- predict(fit) - fit$coefficients[1]
  s$a_hat <- pred
  list(fit = fit, seq = s)
}

#' @export
fit_polys_error <- function(seq, order_max = 8){
  fits <- lapply(1:order_max, function(order){
    lm(a~poly(n,order,raw=TRUE), data = seq)
  })
  #map(fits, fit_eqn)
  map(fits, fit_error)
}

#' @export
fit_eqn <- function(fit){
  gsub("x","n", polynom::polynomial(coef(fit)))
}

#' @export
fit_error <- function(fit){
  sum(fit$residuals^2)
}

#' @export
fit_plot <- function(s, n){
  ss <- tidyr::pivot_longer(s, cols = c("a", "a_hat"))
  ggplot(ss, aes(x = n, y = value, colour = name)) +
    geom_line(size = 1)

}




