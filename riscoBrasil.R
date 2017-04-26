# select by date option 
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
