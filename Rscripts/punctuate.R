
punctuate <- function(transcription) {
  
  index_name <- 1
  
  reticulate::use_python("/home/sofianembarki/anaconda2/bin/python", required = T)
  reticulate:::initialize_python()
  
  for (t in transcription) {
    
    NAMES <- names(transcription)[index_name] 
    
    mkdir_cmd <- sprintf("mkdir output/texts/%s", NAMES)
    try(system(command = mkdir_cmd, intern = TRUE))
    cat(t$trancriptions_merged, file=sprintf("output/texts/%s/%s_raw.txt", NAMES, NAMES), sep="\n")
    
    rnn_punct_cmd <- sprintf("export MKL_THREADING_LAYER=GNU && python /home/sofianembarki/Desktop/Projects/EdTechGen/rnn_punctuator/punctuator.py /home/sofianembarki/Desktop/Projects/EdTechGen/output/texts/%s/%s_raw.txt /home/sofianembarki/Desktop/Projects/EdTechGen/output/texts/%s/%s_punct.txt", NAMES, NAMES, NAMES, NAMES)
    try(system(rnn_punct_cmd, intern = TRUE))
    
    rnn_readable_punct_cmd <- sprintf("python /home/sofianembarki/Desktop/Projects/EdTechGen/rnn_punctuator/convert_to_readable.py /home/sofianembarki/Desktop/Projects/EdTechGen/output/texts/%s/%s_punct.txt /home/sofianembarki/Desktop/Projects/EdTechGen/output/texts/%s/%s_readable_punct.txt", NAMES, NAMES, NAMES, NAMES)
    try(system(rnn_readable_punct_cmd, intern = TRUE))
    
    Sys.sleep(2)
    
    # Add a final point at the end of the text and put that inside the object at the tag "text".
    text <- paste0(readLines(sprintf("/home/sofianembarki/Desktop/Projects/EdTechGen/output/texts/%s/%s_readable_punct.txt", NAMES, NAMES), warn = FALSE), ".")
    transcription[[index_name]]$text <- text
    index_name <- index_name + 1
    
  }
  return(transcription)
}