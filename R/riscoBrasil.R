#' @importFrom rvest html_nodes
#' @importFrom rvest html_table
#' @importFrom xml2 read_html
#' @importFrom dplyr slice
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr filter
#' @importFrom lubridate parse_date_time
#' @title Download and parse 'Brazil Risk' data
#' @description Download and parse financial data of J.P. Morgan's 'Brazil Risk',
#' maintained by The Brazilian Institute of Geography and Statistics (IBGE).
#' @param start \code{character}. Optional parameter, must be in "Ymd" format.
#' @param end \code{character}. Optional parameter, must be in "Ymd" format.
#' @author Robert Myles McDonnell
#' @examples
#' risk2011 <- riscoBrasil(start = "2011-01-01", end = "2011-12-31")
#' @export
riscoBrasil <- function(start = NULL, end = NULL){

  url <- "http://www.ipeadata.gov.br/ExibeSerie.aspx?serid=40940&module=M"

  selector <- "#grd_DXMainTable"

  risk <- xml2::read_html(url) %>%
    rvest::html_nodes(selector) %>%
    rvest::html_table(fill = T) %>%
    .[[1]]

  risk <- risk %>%
    slice(-1:-3) %>%
    select(date = 1, risk = 2) %>%
    mutate(date = lubridate::parse_date_time(date, "dmY"),
           risk = gsub("\\.", "", risk),
           risk = as.numeric(risk))

  if(!is.null(start)){

    start <- lubridate::parse_date_time(start, "Ymd")

    risk <- risk %>%
      filter(date >= start)
  }
  if(!is.null(end)){
    end <- lubridate::parse_date_time(end, "Ymd")

    risk <- risk %>%
      filter(date <= end)
  }

  return(risk)
}
