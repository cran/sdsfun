
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sdsfun <img src="man/figures/logo.png" align="right" height="120"/>

<!-- badges: start -->

[![CRAN](https://www.r-pkg.org/badges/version/sdsfun)](https://CRAN.R-project.org/package=sdsfun)
[![r-universe](https://spatlyu.r-universe.dev/badges/sdsfun)](https://spatlyu.r-universe.dev/sdsfun)
<!-- badges: end -->

The goal of **sdsfun** is to provide miscellaneous functions that
summarize common operations of R packages (such as sf and terra
packages) related to spatial data science.

## Installation

- Install from [CRAN](https://CRAN.R-project.org/package=sdsfun) with:

``` r
install.packages("sdsfun")
```

- Install development binary version from
  [r-universe](https://spatlyu.r-universe.dev/sdsfun) with:

``` r
install.packages('sdsfun',
                 repos = c("https://spatlyu.r-universe.dev",
                           "https://cran.rstudio.com/"),
                 dep = TRUE)
```

- Install development source version from
  [GitHub](https://github.com/SpatLyu/sdsfun) with:

``` r
# install.packages("devtools")
devtools::install_github("SpatLyu/sdsfun",
                         build_vignettes = TRUE,
                         dep = TRUE)
```
