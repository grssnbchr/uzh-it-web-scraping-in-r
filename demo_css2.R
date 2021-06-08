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

base_url <- 'https://www.uzh.ch/cmsssl/en/studies/dates/dates.html'

# reading one specific table
read_html(base_url) %>% 
  # use the direct sibling combinator to extract a table contained within a div next to the element with id #Fall_Semester_2021
  html_node('#Fall_Semester_2021 + div table') %>% 
  html_table()

# the following doesn't work, because table is not a direct descendant of the div that is a sibling of #Fall_Semester_2021
read_html(base_url) %>% 
  # use the direct sibling combinator to extract a table contained within a div next to the element with id #Fall_Semester_2021
  html_node('#Fall_Semester_2021 + div > table') %>% 
  html_table()

