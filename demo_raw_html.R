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


# the httr way
base_url <- 'https://timogrossenbacher.ch'

response <- GET(base_url)

response

# extract content (response body)
content(response)

# the rvest way
read_html(base_url)

# extract all the text from the website
read_html(base_url) %>% 
  html_text()

# extract all the links on the page
read_html(base_url) %>% 
  html_elements('a') %>% 
  html_text(trim=TRUE)

# btw: base R
html_text(html_elements(read_html(base_url), 'a'), trim = TRUE)

# extract all the links in a h1 element
read_html(base_url) %>% 
  html_elements('h1') %>% 
  html_elements('a') %>% 
  html_text(trim=TRUE)

# direct html parsing
read_html('<html><body><p>Hello!</p></body></html>')

