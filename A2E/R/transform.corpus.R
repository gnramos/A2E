transform.corpus <- function(corpus, stop.word.languages) {
  corpus <- tm::tm_map(corpus, stripWhitespace)
  corpus <- tm::tm_map(corpus, removePunctuation) #, preserve_intra_word_dashes=TRUE)
  corpus <- tm::tm_map(corpus, content_transformer(tolower), lazy=TRUE)
  for(language in stop.word.languages) {
    corpus <- tm::tm_map(corpus, removeWords, stopwords(language))
    corpus <- tm::tm_map(corpus, stemDocument, language=language)
  }
  corpus

  ## @to-do filtrar documentos vazios
  # tm::tm_filter(corpus, FUN=function(doc) doc$content != "")
}
