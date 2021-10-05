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
if(!require(stringr)) {
  install.packages("stringr", repos="http://cran.us.r-project.org")
  require(stringr)
}


# the httr way
base_url <- 'https://timogrossenbacher.ch'

response <- GET(base_url)

response

# extract content (response body)
content(response)

# the rvest way
timos_page <- read_html(base_url)

# get the first level of children
timos_page %>% 
  html_children() 

# get the second level of children
timos_page %>% 
  html_children() %>%
  html_children() 

# get all p nodes
timos_page %>% 
  html_elements('p')

# get all children of p nodes
timos_page %>% 
  html_elements('p') %>% 
  html_children()

# get all a nodes within p nodes
timos_page %>% 
  html_elements('p') %>% 
  html_elements('a')

# get their href attribute
timos_page %>% 
  html_elements('p') %>% 
  html_elements('a') %>% 
  html_attr('href')

# send a GET request to each of them and store result in txt files
timos_page %>% 
  html_elements('p') %>% 
  html_elements('a') %>% 
  html_attr('href') %>% 
  walk(function(x){
    print(glue::glue('{x}: {status_code(GET(x))}'))
  })

