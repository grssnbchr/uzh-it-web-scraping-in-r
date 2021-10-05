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
  html_elements('table') %>% 
  html_table()

# task: scrape without html_table()
# tidyverse approach
read_html(base_url) %>% 
  html_elements('table tr') %>% 
  map_dfr(function(row){
     # skip first row
    if(row %>% html_element('th') %>% html_text != 'Kategorie'){
        return(tibble(
          key = row %>% html_element('th') %>% html_text(),
          value = row %>% html_element('td') %>% html_text()
          ))
    }
  }
  )

# base approach
html <- read_html(base_url) 
trs <- html_elements(html, 'table tr')
list_of_dfs <- lapply(trs, function(row){
  if(html_text(html_element(row, 'th')) != 'Kategorie'){
      return(data.frame(
          key = html_text(html_element(row, 'th')),
          value = html_text(html_element(row, 'td'))
      ))
    }
  }
)
do.call(rbind, list_of_dfs)

