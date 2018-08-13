
# This function allow us to take multiple response from the users
readlines <- function(...) {
  return(lapply(list(...), readline)) %>% unlist() %>% strsplit(., ',') %>% unlist()
  }
