# ------------------------
# ------------------------

# -------- Identity
# Project : NLP EdTech
# Author : Sofiane M'Barki
# Licence : to defined

# -------- Purpose 
# This function link via URI path audio file which are stored 
# into Google Cloud Storage and perform a speech-to-text analysis
# with the pretrained models.

# -------- Note
# There is two type of audio file { synchrone and asynchrone }.
# The first type is for the audio file where duration < 50 seconds
# the other for the others. ( > 50 seconds)

# ------------------------
# ------------------------

audio_to_text <- function() {
  
  # Prepare the path
  bucket <- 'audioedtech'
  list.speechs <- list()
  root_bucket <- paste('gs://', bucket, sep = '')
  
  # List element in the bucket
  bucket_elements <- gcs_list_objects()
  
  # Strcture for async and sync ID, assign index for each
  sync_ids <- list() ; index_sync <- 1
  async_ids <- list() ; index_async <- 1

  # For each audio in the bucket
  for (index_audio in 1L:nrow(bucket_elements)) {
  
    # Select the current audio file
    audio <- bucket_elements[index_audio,]
    
    # If synchrone file => { duration < 50 seconds }
    if (as.numeric(audio$metadata$duration) < 50) {
      
      # Construct the URI path
      uri_audio_path <- paste(root_bucket, audio$name, collapse = "", sep = "/")
      
      # Perform synchrone speech-to-text analysis
      sync <- gl_speech(audio_source = uri_audio_path, encoding = c('FLAC'),
                        sampleRateHertz = 44100L, languageCode = audio$metadata$language,
                        asynch = FALSE, maxAlternatives = 10, speechContexts = audio$metadata$keywords %>% strsplit(., ', ') %>% unlist()) 
      
      # Put the text into the associate list and at the right position
      sync_ids[[index_sync]] <- sync
      
      # Increment
      index_sync <- index_sync + 1
      
    # If asynchrone file => { duration > 50 seconds }  
    } else {
      
      # Construct the URI path
      uri_audio_path <- paste(root_bucket, audio$name, collapse = "", sep = "/")
      
      # Perform asynchrone speech-to-text analysis
      async <- gl_speech(audio_source = uri_audio_path, encoding = c('FLAC'), 
                         sampleRateHertz = 44100L, languageCode = audio$metadata$language,
                         asynch = TRUE, maxAlternatives = 10, speechContexts = audio$metadata$speech_context) 
      
      # Put the text into the associate list and at the right position
      async_ids[[index_async]] <- async
      async_ids[[index_async]]$language <- audio$metadata$language
      
      # Increment
      index_async <- index_async + 1
    }
    
  }
  
  # Name all processing according to the title of the audio file
  names(async_ids) <- bucket_elements$metadata$audio_name 
  
  # Return the results
  return (async_ids)
  
}
