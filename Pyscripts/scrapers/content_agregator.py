


import wikipedia

def content_agregator(name, source, language, nbr_sentences = 5):
  
  if (source == "wikipédia" or "wiki" or "Wikipédia"):
    wikipedia.set_lang(language)
    summary = wikipedia.summary(name, sentences=nbr_sentences)
    # get the sections
    return summary
