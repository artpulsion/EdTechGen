
import re
import string

from nltk import sent_tokenize, word_tokenize
from nltk.corpus import stopwords	
from nltk.tokenize import RegexpTokenizer
from stop_words import get_stop_words


# Clean text
def word_to_work(text, language):

	if language == "fr" or language == "french":

		# Import stop words from proust literature
		fname = '/home/sofianembarki/Desktop/Projects/EdTechGen/Pyscripts/utilities/data/stop_words_proust.txt'

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
			# Setup pattern we might find
			pattern = r"[dnl]['´`]|\w+|\$[\d\.]+|\S+"
			# Split into words
			tokenizer = RegexpTokenizer(pattern)
			tokens = tokenizer.tokenize(text)
			# Prepare regex for char filtering
			re_punc = re.compile('[%s]' % re.escape(string.punctuation))
			# Remove punctuation from each word
			stripped = [re_punc.sub('', w) for w in tokens]
			# Remove remaining tokens that are not alphabetic
			words = [word for word in stripped if word.isalpha()]	
			# Filter out stop words
			words = [word for word in words if word not in stop_words]


	if language == "en" or language == "english":

		# split into words
		tokens = word_tokenize(text)
		# convert to lower case
		tokens = [w.lower() for w in tokens]
		# prepare regex for char filtering
		re_punc = re.compile('[%s]' % re.escape(string.punctuation))
		# remove punctuation from each word
		stripped = [re_punc.sub('', w) for w in tokens]
		# remove remaining tokens that are not alphabetic
		words = [word for word in stripped if word.isalpha()]
		# filter out stop words
		stop_words = set(stopwords.words('english'))
		words = [w for w in words if not w in stop_words]

	
	return words
