
# ------------------------------------------------- #
# --------------- CREATE WORD CLOUD --------------- #
# ------------------------------------------------- #

# --- Wordcloud function
word_to_cloud <- function (words) {
  
  # Create frequency matrix #1 , sort by occurences #2, then create a data.frame #3
  mat.term.freq <- termFreq(words) %>% as.matrix() # 1
  words.by.occurences <- sort(rowSums(mat.term.freq), decreasing=TRUE) # 2
  df <- data.frame(word = names(words.by.occurences), freq = words.by.occurences) # 3

  # Return a wordcloud based on the text  
  return( wordcloud::wordcloud( words = df$word, freq = df$freq, min.freq = 1,
                     max.words=50, random.order=FALSE, rot.per=0.35, 
                     colors=brewer.pal(8, "Dark2") ) )
  
}

