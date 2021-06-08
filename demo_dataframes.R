if(!require(dplyr)) {
  install.packages("dplyr", repos="http://cran.us.r-project.org")
  require(dplyr)
}
if(!require(rvest)) {
  install.packages("rvest", repos="http://cran.us.r-project.org")
  require(rvest)
}
if(!require(httr)) {
  install.packages("httr", repos="http://cran.us.r-project.org")
  require(httr)
}
if(!require(purrr)) {
  install.packages("purrr", repos="http://cran.us.r-project.org")
  require(purrr)
}
if(!require(jsonlite)) {
  install.packages("jsonlite", repos="http://cran.us.r-project.org")
  require(jsonlite)
}

# task: extract covid numbers
base_url <- 'https://www.zh.ch/de/gesundheit/coronavirus.html'

# zh is easy
read_html(base_url) %>% 
  html_nodes('table') %>% 
  html_table()

# task: scrape without html_table()
read_html(base_url) %>% 
  html_nodes('table tr') %>% 
  map_dfr(function(row){
      return(tibble(key = row %>% html_node('th') %>% html_text(),
                    value = row %>% html_node('td') %>% html_text()))
  })


