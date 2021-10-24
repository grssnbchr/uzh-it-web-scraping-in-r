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

response <- httr::GET(base_url)

response

# extract content (response body)
httr::content(response)

# the rvest way
rvest::read_html('https://asvz.ch')

# extract all the text from the website
read_html(base_url) %>% 
  html_text()
# base R
html_text(read_html(base_url))

# extract all the links on the page
read_html(base_url) %>% 
  html_elements('h3') %>% 
  html_elements('a') %>% 
  html_attr('href')

# btw: base R
html_text(html_elements(read_html(base_url), 'a'), trim = TRUE)

read_html(base_url) %>% 
  html_elements('a') %>% 
  html_text(trim=TRUE)

# extract all the links in a h1 element
read_html(base_url) %>% 
  # applies the html_elements function to the HTML document (root node)
  html_elements('h1') %>% 
  # applies the html_elements function to every h1 node 
  html_elements('a') %>% 
  # applies the html_text function to every "a" node within a h1 node
  html_text(trim=TRUE)

# direct html parsing
read_html('<html><body><p>Hello!</p></body></html>')

