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

# screen scraping not possible here:
base_url <- 'https://httpbin.org'

# send a raw body without content-type spec
POST(glue::glue('{base_url}/post'), body = 'hello') %>% 
  content()

# send some json as a string
POST(glue::glue('{base_url}/post'), body = '{"foo": "bar"}',
     add_headers('Content-type' = 'application/json')) %>% 
  content()

# send some json from a list^
POST(glue::glue('{base_url}/post'), body = list('foo' = 'bar'), encode = 'json',
     add_headers('Content-type' = 'application/json')) %>% 
  content()

