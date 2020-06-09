test_that("more seqs",{

  x <- get_sequence("A058254")



#
#   fitModel # mosaic package
#   nls
#   lm(y~x)
#   lm(y~poly(x,3,raw=TRUE))


  # p <- plot(x,y,pch=19)
  # nlsFit <- nls(y ~b1*x^3-b2*x^2+b3*x+b4,start=list(b1 = 1,b2 = 3,b3 = 1,b4 = 1))
  # newdata <- data.frame(x = seq(min(x),max(x),len=100))
  # predictLine <- lines(newdata$x,predict(nlsFit,newdata=newdata),col="red")
  # print(predictLine)

  # sigmoid models
  # https://www.rdocumentation.org/packages/mixtox/versions/1.3/topics/curveFit


  # https://stackoverflow.com/questions/14190883/fitting-a-curve-to-specific-data
  models <- list(lm(y ~ x, data = dat),
                 lm(y ~ I(1 / x), data = dat),
                 lm(y ~ log(x), data = dat),
                 nls(y ~ I(1 / x * a) + b * x, data = dat, start = list(a = 1, b = 1)),
                 nls(y ~ (a + b * log(x)), data = dat, start = setNames(coef(lm(y ~ log(x), data = dat)), c("a", "b"))),
                 nls(y ~ I(exp(1) ^ (a + b * x)), data = dat, start = list(a = 0,b = 0)),
                 nls(y ~ I(1 / x * a) + b, data = dat, start = list(a = 1,b = 1))
  )

  # have a quick look at the visual fit of these models
  library(ggplot2)
  ggplot(dat, aes(x, y)) + geom_point(size = 5) +
    stat_smooth(method = lm, formula = as.formula(models[[1]]), size = 1, se = FALSE, color = "black") +
    stat_smooth(method = lm, formula = as.formula(models[[2]]), size = 1, se = FALSE, color = "blue") +
    stat_smooth(method = lm, formula = as.formula(models[[3]]), size = 1, se = FALSE, color = "yellow") +
    stat_smooth(method = nls, formula = as.formula(models[[4]]), data = dat, method.args = list(start = list(a = 0,b = 0)), size = 1, se = FALSE, color = "red", linetype = 2) +
    stat_smooth(method = nls, formula = as.formula(models[[5]]), data = dat, method.args = list(start = setNames(coef(lm(y ~ log(x), data = dat)), c("a", "b"))), size = 1, se = FALSE, color = "green", linetype = 2) +
    stat_smooth(method = nls, formula = as.formula(models[[6]]), data = dat, method.args = list(start = list(a = 0,b = 0)), size = 1, se = FALSE, color = "violet") +
    stat_smooth(method = nls, formula = as.formula(models[[7]]), data = dat, method.args = list(start = list(a = 0,b = 0)), size = 1, se = FALSE, color = "orange", linetype = 2)



  # symbolic regression using Genetic Programming
  # http://rsymbolic.org/projects/rgp/wiki/Symbolic_Regression
  library(rgp)
  # this will probably take some time and throw
  # a lot of warnings...
  result1 <- symbolicRegression(y ~ x,
                                data=dat, functionSet=mathFunctionSet,
                                stopCondition=makeStepsStopCondition(2000))
  # inspect results, they'll be different every time...
  (symbreg <- result1$population[[which.min(sapply(result1$population, result1$fitnessFunction))]])

  function (x)
    tan((x - x + tan(x)) * x)
  # quite bizarre...

  # inspect visual fit
  ggplot() + geom_point(data=dat, aes(x,y), size = 3) +
    geom_line(data=data.frame(symbx=dat$x, symby=sapply(dat$x, symbreg)), aes(symbx, symby), colour = "red")


})
