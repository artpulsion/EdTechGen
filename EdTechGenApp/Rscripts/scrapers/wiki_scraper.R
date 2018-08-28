# wiki_scrapers <- function(url){
#   
#   
# }

library(WikipediR)
library(RCurl)
library(rvest)
library(XML)

url <- "https://fr.wikipedia.org/wiki/%C3%89ducation"
wiki_content <- list(title = NA, table_contents = NA)

title <-
  url %>% 
  read_html %>%
  html_nodes("h1") %>%
  html_text()

table_contents <- url %>% read_html %>% html_nodes("[class='toc']") %>% html_text() %>% strsplit(table_contents, split = "\n") %>% unlist()
x <- url %>% read_html %>% html_nodes("h2") %>% html_text

wiki_content$title <- title
wiki_content$table_contents <- table_contents

h2 <- url %>% read_html %>% html_nodes("h2")
h3 <- url %>% read_html %>% html_nodes("h3")
