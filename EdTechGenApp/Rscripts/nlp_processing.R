nlp_processing <- function (transcription) {

  index_name <- 1
  for (t in transcription) {
    
    NAMES <- names(transcription)[index_name]
    
    # Processing  
    nlp_results <- gl_nlp(string = t$text)
    
    # Assignation
    transcription[[NAMES]]$transcript <- NULL
    transcription[[NAMES]]$entities <- nlp_results$entities[[1]]
    transcription[[NAMES]]$sentiment <- nlp_results$sentences[[1]]
    transcription[[NAMES]]$classifyText <- nlp_results$classifyText
    transcription[[NAMES]]$documentSentiment <- nlp_results$documentSentiment
    
    # Get uniquely entities with wikipedia url, then check for duplicated from name attributs
    wikipedia_df <- nlp_results$entities[[1]][complete.cases(nlp_results$entities[[1]]), ]  
    wikipedia_df <- wikipedia_df[!duplicated(wikipedia_df$name), ]
    transcription[[NAMES]]$wikipedia <- wikipedia_df
    
    index_name <- index_name + 1
  }
  return(videos_object <- transcription)
}