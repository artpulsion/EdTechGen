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
suppressMessages(require(RColorBrewer))

# API
suppressMessages(library(googleCloudStorageR))
gcs_auth()

suppressMessages(library(googleLanguageR))

# Load python environment
reticulate:::use_virtualenv('edtech_env', required = T)

cat("\n || Welcome to EdTech Pedagogical content Generator (EPCG) || \n\n")