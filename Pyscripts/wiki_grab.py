
import wikipediaapi

def print_sections(word, sections, level=0):
  
  wiki_wiki = wikipediaapi.Wikipedia('fr') # setup language
  
  # Check if page exists if yes, get url
  page_py = wiki_wiki.page(word) 
  print("Page - Exists: %s" % page_py.exists())
  print(page_py.fullurl) # get url
  
  for s in sections:
    print("%s: %s" % ("*" * (level + 1), s.title))
    print_sections(s.sections, level + 1)

  return 
