
from nltk import ngrams

def get_ngrams(text, n):
    n_grams = ngrams(text, n)
    return [ ' '.join(grams) for grams in n_grams]

