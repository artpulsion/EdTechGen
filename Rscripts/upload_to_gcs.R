
# ------------------------------------------ #
# ---------- UPLOAD AUDIO TO GCS ----------- #
# ------------------------------------------ #

upload_audio_to_gcs <- function(audio_folder, language) {
  
  bucket_elements <- try(gcs_list_objects()) # List bucket file
  names_folders <- list.files(audio_folder)  # List audios folders
  
  # For each folder ...
  for (folder in names_folders) {
    
    # Check if the video is already processed 
    if(folder %in% bucket_elements$name) next
    
    # List the audio and yaml files
    files <- list.files(file.path(audio_folder, folder, fsep = '')) # list file
    yaml_name <- files[which(grepl(".yaml", files))] # select yaml file
    

    # ---- Inferencial metadata ---- #

    # Extract audio duration in second
    audio_path <- paste0(audio_folder, folder, sep = '/', collapse = '/') %>% paste(. , folder, sep = '', '.flac')
    duration_command <- sprintf("ffmpeg -i %s 2>&1 | grep Duration | awk '{print $2}' | tr -d ,", audio_path)
    duration <- try(system(command = duration_command, intern = TRUE)) %>% lubridate::hms() %>% lubridate::period_to_seconds()
    
    # Load yaml file
    yaml_path <- paste0(audio_folder, folder, sep = '/', collapse = '/') %>% paste(. , "context.yaml", sep = "")
    context <- yaml.load_file(yaml_path)
    
    # Add metadata to the current object
    meta_list <- list(duration = duration, audio_name = folder, keywords = context$keywords, language = context$language)
    meta <- gcs_metadata_object(object_name = folder, contentLanguage = meta_list$language, metadata = meta_list )

    # Upload audio into gcs
    gcs_upload(file = audio_path, name = folder, object_metadata = meta)
    
  }

  return( cat('# Upload finished.') )

}
