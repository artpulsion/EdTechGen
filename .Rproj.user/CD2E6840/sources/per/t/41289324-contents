
get_contents <- function(video_obj, source ) {
  
  index_name <-1 
  
  if (source == "wikipedia" || "wk") {
    
    for (v in video_obj) {
      urls <- v[[index_name]]$wikipedia_url
      
      if(length(urls >= 1 )) {
        for (u in url) {
          video_obj[[index_name]]$wikipedia_contents <- wiki_scrapers(url = u) 
        }
        index_name <- index_name + 1
      } 
    }
  }
  return(video_obj)
}