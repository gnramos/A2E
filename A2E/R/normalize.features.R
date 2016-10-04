extract.features <- function(concept.matrix, mode) {
  chosen.words = character();

  for(i in 1:ncol(concept.matrix)) {
    aux = concept.matrix[,i];

    if(is.null(rownames(aux))) {
      dim(aux) = c(nrow(concept.matrix), 1);
      rownames(aux) = rownames(concept.matrix);
    }

    aux2 = sort(aux[,1], decreasing=TRUE)

    if(mode == 'absoluto') {
      count <- 100
    } else if(mode=='relativo') {
      count <- floor(0.11*Matrix::nnzero(aux2))
    }
    chosen.words <- c(chosen.words, names(aux2)[1:count])

  }

  return(unique(chosen.words))
}

normalize.features <- function(corpus, feature.mode) {
  matrix <- tm::DocumentTermMatrix(corpus)
  df <- as.data.frame(t(as.matrix(matrix)))
  features <- A2E::extract.features(df, feature.mode)

  norm.matrix <- df[features,]
  norm.matrix <- apply(norm.matrix, 2, function(x) x*((sqrt(t(x)%*%x))^(-1)))
  rownames(norm.matrix) <- features

  return(norm.matrix)
}

