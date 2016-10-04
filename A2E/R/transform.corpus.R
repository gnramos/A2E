transform.corpus <- function(corpus, stop.word.languages) {
  corpus <- tm::tm_map(corpus, removePunctuation)
  corpus <- tm::tm_map(corpus, stripWhitespace)
  corpus <- tm::tm_map(corpus, content_transformer(tolower))
  for(language in stop.word.languages) {
    corpus <- tm::tm_map(corpus, removeWords, stopwords(language))
    corpus <- tm::tm_map(corpus, stemDocument, language=language)
  }
  return(corpus)
}
