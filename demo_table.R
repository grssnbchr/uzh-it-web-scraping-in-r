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


html <- "
<html>
  <body>
    <table> 
      <tr> 
        <th>Name</th>
        <th>Profession</th>
        <th>Age</th>
        <th>Country</th> 
      </tr> 
      <tr>    
        <td>Dillon Arroyo</td>
        <td>Carpenter</td>
        <td>54</td>
        <td>UK</td> 
      </tr> 
      <tr> <td>Rebecca Douglas</td><td>Developer</td><td>32</td><td>USA</td> </tr>
    </table>
  </body>
</html>
"

read_html(html) %>% 
  html_table()

# get all cells
read_html(html) %>% 
  html_nodes('tr') %>% 
  html_nodes('td')

# get all cells of the second row
read_html(html) %>% 
  html_nodes('tr') %>% 
  .[2] %>% 
  html_nodes('td')

# base r:
html_nodes(html_nodes(read_html(html), 'tr')[2], 'td')

# reading tables remotely
read_html('https://www.uzh.ch/cmsssl/en/studies/dates/dates.html') %>% 
  html_table()

# reading one specific table
read_html('https://www.uzh.ch/cmsssl/en/studies/dates/dates.html') %>% 
  html_table() %>% 
  .[[2]] # the tidyverse way of selecting an element of a list

