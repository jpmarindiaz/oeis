
<!-- README.md is generated from README.Rmd. Please edit that file -->

# oeis

<!-- badges: start -->

<!-- badges: end -->

The goal of oeis is to provide access to integer sequences from
<http://oeis.org> and some to include some helper functions to ease
analysis on the sequences.

## Installation

You can install the development version with:

    install.packages("remotes")
    remotes::install_github("jpmarindiaz/oeis")

## List and get OEIS sequences

List all available sequences with `sequences`

``` r
library(oeis)

head(sequences)
#>   sequence
#> 1  A000001
#> 2  A000002
#> 3  A000003
#> 4  A000004
#> 5  A000005
#> 6  A000006
#>                                                                                                                                                                         description
#> 1                                                                                                                                                      Number of groups of order n.
#> 2                                                                                  Kolakoski sequence: a(n) is length of n-th run; a(1) = 1; sequence consists just of 1's and 2's.
#> 3 Number of classes of primitive positive definite binary quadratic forms of discriminant D = -4n; or equivalently the class number of the quadratic order of discriminant D = -4n.
#> 4                                                                                                                                                                The zero sequence.
#> 5                                                                                                             d(n) (also called tau(n) or sigma_0(n)), the number of divisors of n.
#> 6                                                                                                                                        Integer part of square root of n-th prime.
```

Search for a sequence by some term in the sequence description.

    search_sequence("prime numbers")
    # Returns 973 sequences with "prime numbers" in the description

Download a sequence

``` r
a1 <- get_sequence("A306302")
a2 <- get_sequence("A331766")
#a3 <- get_sequence("A999999") # Error. Sequence not in catalog.
```

## Fitting models to sequences

TODO Work in progress\!

``` r
# Fit polynomials
# Find best polynomial order
```
