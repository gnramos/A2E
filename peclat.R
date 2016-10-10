# Para não ficarmos parados, avancemos sobre o A2E. Inicialmente observo a
# existência de três scripts importantes para seu funcionamento básico:
#    scriptGeral.R
#    funcaoFormacaoCorpo.R
#    processaMatriz.R
#    scriptMatrizConceitos.R

# Possivelmente o professor Guilherme e a leitura da dissertação já devem ter
# indicado que o "grande passo" dessa ferramenta é a multiplicação entre duas
# matrizes: uma referente aos fragmentos de textos que serão classificados (ex:
# parágrafos de texto) e outra referente aos conceitos finais (ex: riscos de
# segurança). Operacionalizando, a primeira matriz é uma matriz parágrafo x
# termo (M1) e a segunda matriz é termo x conceito (M2).

# Para isso, primeiramente forma-se o sistema de conceitos por meio da execução
# do scriptMatrizConceitos.R. Forma-se uma matriz termos x conceitos a partir de
# arquivos previamente preparados associados a cada um dos conceitos. Essa matriz
# ficara sendo a M2. Na dissertação tentei explicitar as dificuldades de formação
# dessa lista em português. Acho que falta ela no GitHub, estou enviando em anexo.

# Contudo, para realizar o processamento é necessário formar a matriz M1 citada.
# Aí, no meu caso, começou a entrar a restrição de hardware para realizar isso
# no R, o que levou ao uso do bigmemory ao longo dos três scripts acima. A ideia
# básica é: dividir a porção de "editais" em partes processáveis por um computador
# com 8GB de RAM (fiz isso por meio de tentativa e erro) e realizar iterações
# formando submatrizes parágrafo x termo (M'1) que possam ser multiplicadas por
# M2 , resultando num menor consumo de memória.

# O papel do ScriptGeral é coordenar isso. O da funcaoFormacaoCorpo é fornecer
# uma função para formar essas submatrizes a partir de um conjunto de textos não
# estruturados. O de processaMatriz é realizar a multiplicação entre M'1 e M2 ao
# longo das iterações para ir formando o resultado final, matriz M3 que é formada
# a cada iteração a partir da concatenação das submatrizes obtidas pelo ScriptGeral.





# extraiFeatures.R #############################################################
require(Matrix)

extraiFeatures = function(matrizConceitos, modo){

  # vetor de caracteres
  palavrasEscolhidas = character();
  # matrizConceitos é um TermDocumentMatrix

  for(i in 1:ncol(matrizConceitos)){
  	# aux <- vetor com os valores da i-ésima coluna (documento)
    aux = matrizConceitos[,i];

    if(is.null(rownames(aux))){
      # transforma aux em uma matriz com nrow linhas e 1 coluna
      dim(aux) = c(nrow(matrizConceitos), 1);

      #da a linhas de aux os mesmos nomes que matrizConceitos
      rownames(aux) = rownames(matrizConceitos);
    }

    # ordena em ordem decrescente de frequencia
    aux2 = sort(aux[,1], decreasing=TRUE);

    if(modo=="absoluto"){
      count=100
    }

    if(modo=="relativo"){
      count = floor(0.11*nnzero(aux2))
    }

      # pega os 100 primeiros ou os 10%
      palavrasEscolhidas = c(palavrasEscolhidas, names(aux2)[1:count]);
  }

  palavrasEscolhidas = unique(palavrasEscolhidas);
  return(palavrasEscolhidas);
}
############################################################# extraiFeatures.R #





# scriptMatrizConceitos.R ######################################################
require(tm)
require(SnowballC)
require(slam)

#formando o corpo a partir dos editais
file.name <- c('A2E/data/owasp/pt/A1injecao.txt') # UTF-8
txt.data <- scan(file.name, what='character', sep='.', quote='', encoding='UTF-8')
conceitos <-tm::Corpus(tm::VectorSource(txt.data))
# conceitos<-Corpus(DirSource("/media/usb0/rodrigo/MPCA/mineracaoDados/cwe/cwes/Riscos/", encoding = "UTF-8"),readerControl = list(language = "en"))


conceitos = tm_map(conceitos, stripWhitespace)
conceitos = tm_map(conceitos, content_transformer(tolower))
conceitos = tm_map(conceitos, removePunctuation)
conceitos = tm_map(conceitos, removeWords, stopwords("portuguese"))
conceitos = tm_map(conceitos, stemDocument, language="portuguese")
matrizConceitos = DocumentTermMatrix(conceitos, control = list(weighting = weightTfIdf))

matrizConceitos= as.data.frame(t(as.matrix(matrizConceitos)))
# gnramos check result - OK

features = extraiFeatures(matrizConceitos, 'absoluto')#"relativo");
# gnramos check result - OK

matrizConceitos_Normalizada = matrizConceitos[features,];


matrizConceitos_Normalizada = apply(matrizConceitos_Normalizada, 2, function(x) x*((sqrt(t(x)%*%x))^(-1)))
rownames(matrizConceitos_Normalizada) = features;
# gnramos check result - OK

###################################################### scriptMatrizConceitos.R  #





