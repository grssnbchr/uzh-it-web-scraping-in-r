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

base_url <- 'https://zi-training.zi.uzh.ch/de/page/courseprogramme'

# extract the url of the title
read_html(base_url) %>% 
  html_element('.headernav_title a') %>% 
  html_attr('href')

# get all urls of the top navigation
read_html(base_url) %>% 
  html_elements('.headernav_elements') %>% 
  html_elements('a') %>% 
  html_attr('href')

# get the urls of both of them
read_html(base_url) %>% 
  html_elements('.headernav_title a, .headernav_elements a') %>% 
  html_attr('href')

# booked courses
read_html(base_url) %>% 
  html_elements('#kursList .warning a') %>% 
  html_text()

# second title
read_html(base_url) %>% 
  html_elements('#kursList tr:nth-child(2) a') %>% 
  html_text()

