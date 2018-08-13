meaning_words <- function(cleaned_word) {
  
  # -------------------------
  
  # Get words informations {df, plot}
  words_df <- data.frame(word = cleaned_word) %>%
    count(word, sort = TRUE) %>%
    dplyr::filter(n > 2) %>%
    mutate(word = reorder(word, n))
  
  words_plot <- words_df %>%
    ggplot(aes(word, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()
  
  # -------------------------
  
  # Get the ngrams informations {df, plot}
  ngrams <- get_ngrams(text = cleaned_word, n = 2)
  ngrams_df <- ngrams %>%
    data.frame(n_grams = ngrams) %>%
    count(n_grams, sort = TRUE) %>%
    dplyr::filter(n >= 2) %>%
    mutate(n_grams = reorder(n_grams, n))
  
  ngrams_plot <- ngrams_df %>%
    ggplot(aes(n_grams, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()  
  
  return (
          list(words_df = words_df, words_plot = words_plot,
               ngrams_df = ngrams_df, ngrams_plot = ngrams_plot)
          )
}