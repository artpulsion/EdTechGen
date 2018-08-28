summarize_speech <- function(video_obj, n_sentences) {
  
  index_name <- 1
  for (v in video_obj) {
    
      text <- lexRankr::lexRank(v$text,
                      #only 1 article; repeat same docid for all of input vector
                      docId = rep(1, length(v$text)),
                      #return 3 sentences to mimick /u/autotldr's output
                      n = n_sentences,
                      continuous = TRUE)$sentence 
      
      text <- paste(text, collapse = " ")
      
      cat( sprintf( "Summarization done for : %s. \n\n", names( video_obj[index_name]) ) )
       
      video_obj[[index_name]]$summarization <- text 
        
      index_name <- index_name + 1
  }
  return(video_obj)
}