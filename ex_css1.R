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

read_html(base_url) %>% 
  html_elements('div#primarnav') %>% 
  html_elements('a') %>% 
  html_attr('href') %>% 
  .[-1]

# get all urls of the top navigation
read_html(base_url) %>% 
  html_elements('#primarnav a') %>% 
  html_attr('href')

# remove first with a special pseudo class
read_html(base_url) %>% 
  html_elements('#primarnav a:not(.namedanchor)') %>% 
  html_attr('href')

read_html(base_url) %>% 
  html_elements('#primarnav a:nth-child(n+2)') %>% 
  html_attr('href')

# get all urls of the side navigation on the left side
read_html(base_url) %>% 
  html_elements('.secnav li a') %>% 
  html_attr('href')

# get the urls of all navigation elements
read_html(base_url) %>% 
  html_elements('#primarnav a, .secnav li a') %>% 
  html_attr('href')

# without the first anchor resulting in a NA
read_html(base_url) %>% 
  html_elements('#primarnav a:not(.namedanchor), .secnav li a') %>% 
  html_attr('href')


read_html(base_url) %>% 
  html_elements(".contentarea1col") %>% 
  html_table() %>% 
  .[[1]] %>% 
  select(Kurstitel)




# try to extract all course titles
read_html(base_url) %>% 
  html_elements('.uzh') %>% 
  html_text()

# another try with a pseudo class and the descendant combinator
read_html(base_url) %>% 
  html_elements('tr') %>% 
  html_elements('*:not(:last-child) .uzh') %>% 
  html_text()

# or
read_html(base_url) %>% 
  html_elements('td:nth-child(1) .uzh') %>% 
  html_text()
