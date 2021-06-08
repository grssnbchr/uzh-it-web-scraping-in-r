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


base_url <- 'https://www.tagesanzeiger.ch/'

# return only the headings of articles 
read_html(base_url) %>% 
  html_nodes('h3 > span > span:last-child') %>% # span:nth-child(2) doesn't work 
  html_text()

# return only the headings of paid articles 
read_html(base_url) %>% 
  html_nodes('h3 > span > span + span') %>%  
  html_text()

# return only the headings of paid articles that are accompanied with a teaser image
read_html(base_url) %>% 
  html_nodes('figure + div h3 > span > span + span') %>% 
  html_text()

