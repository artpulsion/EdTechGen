merge_transcription <- function(transcription) {
  
  index_name <- 1
  for (t in transcription) {
    transcription[[index_name]]$transcript <- paste(t$transcript$transcript, sep = "", collapse = "")
    index_name <- index_name + 1
  }
  return(transcription)
}