# wiki_scrapers <- function(url){
#   
#   
# }

options(warn = -1)

library(RCurl)
library(rvest)
library(XML)

url <- "https://fr.wikipedia.org/wiki/%C3%89ducation"
wiki_content <- list(title = NA, table_contents = NA)

title <- 
  url %>% read_html %>%
  html_nodes("h1") %>% 
  html_text()

table_contents <- url %>% read_html %>% html_nodes("[class='toc']") %>% html_text() %>% strsplit(., split = "\n") %>% unlist() %>% .[. != ""]
all_sections <- stringi::stri_extract_all_regex(table_contents, "[0+.-9+.]+") %>% unlist() %>% .[!is.na(.)]
main_sections <- as.integer(unlist(strsplit(sections_number, split='*.', fixed=T))) %>% unique() %>% .[!is.na(.)]
