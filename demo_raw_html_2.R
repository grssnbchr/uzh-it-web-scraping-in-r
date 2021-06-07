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

raw_html <- '<html> 
<body> 
<div> 
<p>The first paragraph.</p> 
</div> 
<div> Not an actual paragraph, but with a <a href="#">link</a>.</div> 
<p>A paragraph without an enclosing div.</p> 
</body>
</html>'
# direct html parsing
read_html(raw_html) %>% 
  html_children() %>% 
  html_nodes('p')

