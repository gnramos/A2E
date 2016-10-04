get.corpus <- function(dir.source, encoding, language, readerControl) {
  source.files <- tm::DirSource(dir.source, encoding=encoding)
  corpus <- tm::Corpus(source.files, readerControl)
}

get.txt.corpus <- function(dir.source, encoding, language) {
  readerControl <- list(reader=tm::readPlain, language=language)
  get.corpus(dir.source, encoding, languages, readerControl)
}

get.pdf.corpus <- function(dir.source, encoding, language) {
  readerControl <- list(reader=tm::readPDF, language=language)
  get.corpus(dir.source, encoding, languages, readerControl)
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