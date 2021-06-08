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

base_url <- 'https://www.srf.ch/'

# extract article titles
read_html(base_url) %>% 
  html_nodes('.teaser__title') %>% 
  html_text()

# extract lead texts
read_html(base_url) %>% 
  html_nodes('.teaser__lead') %>% 
  html_text()

# extract both (with a so-called selector list)
read_html(base_url) %>% 
  html_nodes('.teaser__title, .teaser__lead') %>% 
  html_text()

# extract the urls of the top navigation (descendant combinator)
read_html(base_url) %>% 
  html_nodes('nav.masthead__portals a') %>% 
  html_attr('href')

# extract the text of the last element of the footer navigation (descendant combinator with pseudo-class)
read_html(base_url) %>% 
  html_nodes('ul.footer__navigation li:last-child') %>% 
  html_text()


