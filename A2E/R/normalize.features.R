extract.features <- function(tdm, mode) {
  # http://stackoverflow.com/questions/15506118/make-dataframe-of-top-n-frequent-terms-for-multiple-corpora-using-tm-package-in
  features <- character()

  feature.df <- as.data.frame(as.matrix(tdm))

  for(i in 1:ncol(tdm)) {
    feature.col <- feature.df[, i, drop=FALSE]
    sorted.features <- feature.col[order(-feature.col[,1]),,drop=FALSE] # sort data

    if(mode == 'absoluto') {
      max.features <- 100
      ## @to-do 100 seria 100%? neste caso a instrução correta é:
      ## max.features <- nrow(sorted.features)
    }
    else {
      # Uma vez que o uso de apenas 10% das palavras mais frequentes em cada
      # conceito não implica perda significativa de desempenho de um classifcador,
      # realizou-se a restrição de seu conjunto de termos a uma pequena fração
      # de si mesmo, mantendo nesse subconjunto apenas aquelas palavras que, ao
      # menos para uma categoria de risco, esteja entre os 10% de maior TF-IDF.
      #

      # R. Feldman and J. Sanger, The text mining handbook: advanced approaches
      # in analyzing unstructured data. Cambridge University Press, 2007

      max.features <- floor(0.11*Matrix::nnzero(sorted.features))

      ## @to-do confirmar isso! A página 202 da referência diz:
      ## A connection between two sets of concepts is related to a threshold for
      ## the cosine similarity (e.g., 10%). This means that the two concept sets
      ## are connected if the support of the document subset that holds all the
      ## concepts of both sets is larger than 10 percent of the geometrical mean
      ## of the support values of the two concept sets.
    }
    features <- unique(c(features, row.names(sorted.features)[1:max.features]))
  }

  features
}

normalize.features <- function(corpus, weighting, feature.mode) {
  # Weight by Term Frequency - Inverse Document Frequency
  tdm <- tm::TermDocumentMatrix(corpus, control=list(weighting=weighting))
  features <- A2E::extract.features(tdm, feature.mode)
  norm.matrix <- apply(as.matrix(tdm)[features,], 2, function(x) x*((sqrt(t(x)%*%x))^(-1)))
  ## @to-do verificar esta normalização, a forma correta de normalizar por coluna é:
  # norm.matrix <- apply(as.matrix(tdm)[features,], 2, function(x) x/sum(x))

  rownames(norm.matrix) <- features
  norm.matrix
}
