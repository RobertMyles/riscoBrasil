## riscoBrasil 

riscoBrasil is a (tiny) R package to load the 'Brazil Risk' data that the Instituto Brasileiro de Geografia e Estatística 
[IBGE](http://www.ibge.gov.br/english/) maintain publicly from J.P. Morgan's Emerging Markets Bond Index. 

### Usage

The package has one function, `riscoBrasil()`, which takes two optional arguments, `start` and `end`. Without specifying
either of these two, `riscoBrasil()` returns a data frame with data going back to 1994. The data frame has two columns, 
'date' and 'risk', the first being POSIXct, the second being a numeric column. A specific period may be requested with `start` 
and/or `end`. If these parameters are used, they must be in a certain format, as a character string. For those familiar with 
the [lubridate]() package, the format is "Ymd", for those not familiar with this style, the 1st of March 2017 is specified as:
"2017-03-01". Both `start`and `end` must be in this format, otherwise the function will stop and return an error. 

```
riscoBrasil <- function(start = NULL, end = NULL)

```

### Examples

riscoBrasil is ideal for simple time series, particularly with ARIMA-style models that posit that the values of a time-series
are explained mostly by their past values. 


