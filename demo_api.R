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
base_url <- 'https://asvz.ch/426-sportfahrplan?f[0]=sport:45662&f[1]=sport:45674&f[2]=sport:45685&f[3]=sport:45745&date=2021-06-12%2020:00'

page_html <- GET(base_url) %>% 
  read_html()

# does return nothing because data is loaded dynamically
page_html %>% 
  html_nodes('li.btn-hover-parent')

# we have to query API directly
base_url <- 'https://asvz.ch/asvz_api/event_search?f[0]=sport:45662&f[1]=sport:45674&f[2]=sport:45685&f[3]=sport:45745&date=2021-06-12%2020:00&_format=json'

# and then parse the JSON
json <- GET(base_url)
my_sport_activities <- json %>% 
  content(type = 'text') %>% 
  fromJSON() %>% 
  .$results

my_sport_activities %>% 
  filter(places_free > 0) %>%
  select(title, from_date_key)
