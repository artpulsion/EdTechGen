
##############################################
# --------------------------------------------
# Author : Sofiane M'Barki
# Licence : To define
# --------------------------------------------
##############################################

# 1. Convert videos to Speech 
VideoToSpeech()

# 2. Upload those audio files into Google Cloud Storage ; bucket <=> audioedtech
upload_audio_to_gcs(audio_folder = 'resources/output/audios/') 

# 3. From the audio files in GCS extract transcriptions
cache_transcriptions <- audio_to_text()
# Wait until the models output the transcription, 45 seconds per content.
Sys.sleep(length(cache_transcriptions)*45) 
transcriptions <- lapply(cache_transcriptions, gl_speech_op)
transcriptions <- merge_transcription(transcriptions)

# 5. Keep english videos, punctuate transcriptions and save them
transcriptions_eng <- transcriptions[names(transcriptions)[c(1,8,9,10,11)]]
transcriptions_eng <- punctuate(transcription = transcriptions_eng)

# 6. Sentiment analysis, entities analysis, theme classification
video_objects <- nlp_processing(transcription = transcriptions_eng)

# 7. Descriptive analysis on words from speech and word cloud
reticulate:::use_virtualenv('edtech_env', required = T) ; reticulate:::initialize_python()
video_objects <- detect_tendacy(video_obj = video_objects)

# 8. Speech summarization
video_objects <- summarize_speech(video_obj = video_objects, n_sentences = 5)
  
# 9. Wikipedia analysis from entities, and then from ngrams and words.
video_objects <- get_contents(video_obj = video_objects, source = "wikipedia", language = "en")

# 10. Summarization for indexed contents
video_objects <- summarize_speech(video_obj = video_objects, n_sentences = 5)

