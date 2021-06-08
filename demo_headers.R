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

# add a custom header
GET(glue::glue('{base_url}/headers'), add_headers('X-README' = 'Hello, my name is Timo')) %>% 
  content()

# modify a header
GET(glue::glue('{base_url}/headers'), add_headers('X-Amzn-Trace-Id' = 'Foobar')) %>% 
  content()

# overwrite UA
GET(glue::glue('{base_url}/headers'), user_agent('TOR Browser')) %>% 
  content()

# set a cookie
GET(glue::glue('{base_url}/headers'), set_cookies('foo' = 'bar', 'x' = 'y')) %>% 
  content()

# store a cookie
cookie <- GET(glue::glue('{base_url}/cookies/set'), 
               query = list(foo = 'bar')) %>% 
  cookies()
cookie
# cookies are automatically persisted between requests to the same domain
GET(glue::glue('{base_url}')) %>% 
  cookies()

# globally setting headers
set_config(
  # set the user agent header
  user_agent(
    'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0'
  )
)

# user agent for some reason does not get applied to read_html...
read_html(glue::glue('{base_url}/headers')) %>% 
  html_nodes('p') %>% 
  html_text(trim = T)

# workaround: use GET() inside read_html()
read_html(GET(glue::glue('{base_url}/headers'))) %>% 
  html_nodes('p') %>% 
  html_text(trim = T)

