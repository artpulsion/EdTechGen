
# ------------------------------------------ #
# ---------- UPLOAD AUDIO TO GCS ----------- #
# ------------------------------------------ #

to.gcs.async <- function(file, keywords, language) {
  
  future({
    
    # List elements in bucket
    bucket_elements <- try(gcs_list_objects())
    
    # List the audio and yaml files
    duration_command <- sprintf("ffmpeg -i %s 2>&1 | grep Duration | awk '{print $2}' | tr -d ,", file$datapath)
    duration <- try(system(command = duration_command, intern = TRUE)) %>% lubridate::hms() %>% lubridate::period_to_seconds()
    
    # Add metadata to the current object
    meta_list <- list(duration = duration, audio_name = file$name, keywords = keywords, language = language)
    meta <- gcs_metadata_object(object_name = file$name, contentLanguage = meta_list$language, metadata = meta_list )
    
    # Upload audio into gcs
    gcs_upload(file = file$datapath, name = file$name, object_metadata = meta)

  })
}
