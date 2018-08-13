detect_tendacy <- function(video_obj) {
  
  index_name <- 1
  for (v in video_obj) {
    words <- word_to_work(v$trancriptions_merged, "en")
    word_to_cloud(words = words) # words cloud
    context_description <- meaning_words(cleaned_word = words) # occurency tools
    video_obj[[index_name]]$context_description <- context_description
    index_name = index_name + 1
  }
  return(video_obj)
}