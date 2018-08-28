#
#
# ## ----- ----- ----- ----- ----- ----- ----- -----

#### -- Packrat Autoloader (version 0.4.9-3) -- ####
source("packrat/init.R")
#### -- End Packrat Autoloader -- ####


# Load package and virtual environment we use
## ----- ----- ----- ----- ----- ----- ----- -----

# Processing
suppressMessages(require(reticulate))
suppressMessages(require(tm))
suppressMessages(require(purrr))
suppressMessages(require(tidyverse))

# Summarizer
suppressMessages(require(lexRankr))

# Setup and communication
suppressMessages(require(usethis))
suppressMessages(require(yaml))

# Viz
suppressMessages(require(wordcloud))
suppressMessages(require(r2d3))
suppressMessages(require(RColorBrewer))

# API
suppressMessages(library(googleCloudStorageR))
gcs_auth()

suppressMessages(library(googleLanguageR))

# Shiny app
suppressMessages(library(shiny))
suppressMessages(library(shiny.semantic))
suppressMessages(library(shinycssloaders))


# Load python environment
reticulate:::use_virtualenv('edtech_env', required = T)


# Load python module
reticulate:::source_python(file = "Pyscripts/video_to_speech.py")
reticulate:::source_python(file = "Pyscripts/word_to_work.py")
reticulate:::source_python(file = "Pyscripts/word_grams.py")
reticulate:::source_python(file = "Pyscripts/wiki_grab.py")

# Load python scrapers
reticulate:::source_python(file = "Pyscripts/scrapers/content_agregator.py")

# Load R functions
source("Rscripts/upload_to_gcs.R")
source("Rscripts/audio_to_text.R")
source("Rscripts/punctuate.R")
source("Rscripts/nlp_processing.R")
source("Rscripts/detect_tendancy.R")
source("Rscripts/meaning_words.R")
source("Rscripts/word_to_cloud.R")
source("Rscripts/summarizer.R")
source("Rscripts/utilities/functions/merged_transcription.R")
