test_that("more seqs",{

  library(tidyverse)

  s <- tibble(
    n = 1:20,
    a = (1:20)^2
  )
  seq_fit <- fit_poly(s, order = 1)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # -77 + 21*n
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 2)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # n^2
  fit_error(seq_fit$fit)



  seq <- get_sequence("A306302")
  s <- as_numbers(seq)

  seq_fit <- fit_poly(s, order = 2)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # 13024707102.1254 - 139292886.518236*n + 261517.896747814*n^2
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 3)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # -2158093792.35926 + 43357273.3206148*n - 195335.77740183*n^2 + 304.569116099763*n^3
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 4)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit)
  fit_error(seq_fit$fit) # -70445.1139161075 + 1782.88258899085*n - 8.49266875230215*n^2 + 0.625527509658961*n^3 + 0.151971794295052*n^4
  seq_fit <- fit_poly(s, order = 5)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # 28591.7977545793 - 1209.15496315625*n + 12.4934753140499*n^2 + 0.569522570681622*n^3 + 0.152034815559452*n^4 - 2.52085057598749e-08*n^5
  fit_error(seq_fit$fit)


  seq <- get_sequence("A331766")
  s <- as_numbers(seq)

  seq_fit <- fit_poly(s, order = 2)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # 1501146.96989487 - 156400.949968754*n + 2976.68614261186*n^2
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 3)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # -239252.818153511 + 45376.6883871568*n - 1993.04483411109*n^2 + 32.8035047968512*n^3
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 4)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # -686.038258128757 + 157.857283013931*n - 1.64876829875605*n^2 + 2.2354876332588*n^3 + 0.151326817641546*n^4
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 5)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # 886.983876332387 - 278.919184435467*n + 28.0229085006176*n^2 + 1.45800677020328*n^3 + 0.159964860377899*n^4 - 3.42100702429828e-05*n^5
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 6)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # -757.622809994296 + 342.863341573687*n - 31.7112670485136*n^2 + 3.79366400706562*n^3 + 0.116850011030541*n^4 + 0.000340667431843326*n^5 - 1.23721947883269e-06*n^6
  fit_error(seq_fit$fit)
  seq_fit <- fit_poly(s, order = 7)
  fit_plot(seq_fit$seq)
  fit_eqn(seq_fit$fit) # 298.709623649824 - 173.042263313864*n + 34.4062232921163*n^2 + 0.225118630249151*n^3 + 0.213103672496325*n^4 - 0.00102542497510938*n^5 + 8.51416455370411e-06*n^6 - 2.75852447879394e-08*n^7
  fit_error(seq_fit$fit)


})
