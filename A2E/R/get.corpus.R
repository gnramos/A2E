# Corpora are collections of documents containing (natural language) text. #


get.corpus.from.dir <- function(dir.source, encoding, readerControl) {
  source.files <- tm::DirSource(dir.source, encoding=encoding)
  corpus <- tm::Corpus(source.files, readerControl)
}

get.txt.corpus.from.dir <- function(dir.source, encoding='UTF-8', language='por') {
  readerControl <- list(reader=tm::readPlain, language=language)
  get.corpus.from.dir(dir.source, encoding, readerControl)
}

get.txt.corpus <- function(file.name, encoding='UTF-8', language='por') {
  txt.data <- scan(file.name, what='character', sep='.', quote='', encoding=encoding)
  tm::Corpus(tm::VectorSource(txt.data))
}
get.pdf.corpus <- function(file.name, encoding='UTF-8', language='por') {
  pdf.data <- tm::readPDF(control=list(text='-layout'))(elem=list(uri=file.name), language=language)
  tm::Corpus(tm::VectorSource(pdf.data$content))
}

# get.corpus <- function(concepts.text, content.language, stop.word.languages, dictionary) {
#     # Annotation ###############################################################
#     concepts.string <- as.String(paste(concepts.text, collapse=""))
#     openNLP.annotator <- openNLP::Maxent_Sent_Token_Annotator(language=content.language, probs=FALSE, model=NULL)

#     annotated.sentences <- NLP::annotate(concepts.string, openNLP.annotator)

#     # Preprocessing ############################################################
#     corpus.row.names <- concepts.string[annotated.sentences]
#     corpus <- tm::Corpus(VectorSource(corpus.row.names))
#     corpus <- A2E::transform.corpus(corpus, stop.words.languages)

#     # Matrix

#     # #geracao da matrix
#     control.list <- list(dictionary=dictionary)
#     # matrizParagrafos <- tm::DocumentTermMatrix(corpus, control=control.list) # terms as columns

#     # #busca apenas as sentencas que passaram na filtragem anterior com o dicionario
#     # auxNames <- rownames(matrizParagrafos)
#     # auxNames <- as.numeric(auxNames)

#     # matrizParagrafos <- as.matrix(matrizParagrafos)

#     # rownames(matrizParagrafos) <- corpus.row.names[auxNames]

#     # return(matrizParagrafos)

#     print(concepts.string)
# }