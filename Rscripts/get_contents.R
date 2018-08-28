
get_contents <- function(video_obj, source, language) {
  
  index_name <- 1 
  if (source == "wikipedia" || "wk" || "wiki" || "Wikipedia") {
    for (vd in video_obj) {
      # extract urls
      wiki_names <- vd[[index_name]]$wikipedia$name
      
      if(length(wiki_names >= 1 )) {
        for (wiki_name in wiki_names) {
          # Here we summarise the main concept
          video_obj[[index_name]]$wikipedia$wiki_summary <- content_agregator(wiki_name, source, nbr_sentences = 5, language)
          # Here is the structure of the concept in Wikipedia terms
          # video_obj[[index_name]]$wikipedia$knowledge_graph <- knowledge_graph_agregator(wiki_name, source, language)
        }
      } 
      index_name <- index_name + 1
    }
  }
  return(video_obj)
}