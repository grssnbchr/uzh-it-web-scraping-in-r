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

# task: find an arbitrary element of a page
base_url <- 'https://app.connect.uzh.ch/apps/id/kurse.nsf/veranstaltungen.xsp'

# try to extract all course titles
read_html(base_url) %>% 
  html_elements('.uzh') %>% 
  html_text()

# another try with a pseudo class and the descendant combinator
read_html(base_url) %>% 
  html_elements('td:nth-child(1) .uzh') %>% 
  html_text()

# get the urls of all navigation elements
read_html(base_url) %>% 
  html_elements('#primarnav a, .secnav li a') %>% 
  html_attr('href')

# get all urls of the side navigation on the left side
read_html(base_url) %>% 
  html_elements('.secnav li a') %>% 
  html_attr('href')


