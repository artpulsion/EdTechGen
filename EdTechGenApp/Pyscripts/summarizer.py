# -*- coding: utf-8 -*-

from __future__ import absolute_import
from __future__ import division, print_function, unicode_literals

import re
import string

from sumy.parsers.html import HtmlParser
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lsa import LsaSummarizer as Summarizer
from sumy.nlp.stemmers import Stemmer

from nltk import sent_tokenize
from nltk.corpus import stopwords	
from nltk.tokenize import RegexpTokenizer
from stop_words import get_stop_words

# Import stop words from proust literature
fname = '/home/sofianembarki/Desktop/Projects/EdTechGen/Pyscripts/utilities/data/stop_words_proust.txt'

# Create stop words baseline
with open(fname) as f:
	# Read proust stop words file
	content_proust = f.readlines()
	# Save words as list
	sw_proust = [x.strip() for x in content_proust]
	# Load stop words as list from nltk package
	sw_nltk = list(stopwords.words('french'))
	# Load stop words as list from stop_words package
	sw_stop_words = list(get_stop_words('french'))
	# Merge all stop words
	stop_words = sw_proust + sw_nltk + sw_stop_words


def summarizer(LANGUAGE = "french", SENTENCES_COUNT = 10):
    parser = PlaintextParser.from_file("/home/sofianembarki/Desktop/PyEdTech/output/wikipedia_text/trou_noir", Tokenizer(LANGUAGE))
    stemmer = Stemmer(LANGUAGE)

    summarizer = Summarizer(stemmer)
    summarizer.stop_words = stop_words

    for sentence in summarizer(parser.document, SENTENCES_COUNT):
        print(sentence)

    return sentence
