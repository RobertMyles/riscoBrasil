
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/riscoBrasil)](https://cran.r-project.org/package=riscoBrasil)

riscoBrasil
-----------

riscoBrasil is a (tiny) R package to load the 'Brazil Risk' data that the Instituto Brasileiro de Geografia e Estatística [IBGE](http://www.ibge.gov.br/english/) maintain publicly from J.P. Morgan's Emerging Markets Bond Index.

### Usage

The package has one function, `riscoBrasil()`, which takes two optional arguments, `start` and `end`. Without specifying either of these two, `riscoBrasil()` returns a data frame with data going back to 1994. The data frame has two columns, 'date' and 'risk', the first being POSIXct, the second being a numeric column. A specific period may be requested with `start` and/or `end`. If these parameters are used, they must be in a certain format, as a character string. For those familiar with the [lubridate](https://cran.r-project.org/web/packages/lubridate/lubridate.pdf) package, the format is "Ymd", for those not familiar with this style, the 1st of March 2017 is specified as: "2017-03-01". Both `start`and `end` must be in this format, otherwise the function will stop and return an error.

    riscoBrasil <- function(start = NULL, end = NULL)

These data are then ideal for time series analysis, particularly with ARIMA-style models that posit that the values of a time-series are explained mostly by their past values.

### Example

Here is how we can download and plot the series starting from May 2007:

``` r
library(riscoBrasil)
series <- riscoBrasil(start = "2007-05-01")

library(ggplot2)
ggplot(series, aes(x = date, y = risk)) + 
  geom_line(colour = "#1874CD") +
  theme_classic()
```

![](http://i.imgur.com/zDL8cZx.png)

For further examples, run `vignette("Analysing times series with riscoBrasil")`.
