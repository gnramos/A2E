## Script execução do Analisador Automático de Editais
# por Rodrigo N. Peclat
#     Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#
# @to-do Lidar com comentários. O padrão é: '#' para comentários
#        permanentes e '##' para comentários que devem ser tratados
#        e removidos.





# Load package #################################################################
# library('A2E')

# The alternative for not installing the package is:
library(devtools)
load_all('A2E')





# Actual example code starts here. #############################################

A2E::load.required.NLPmodel(language='pt', version='1.5-2')

encoding <- 'UTF-8'
language <- 'por' # preferably ISO 639-2

# per directory #####
dir.source <- 'A2E/data/owasp'
concept.corpus <- A2E::get.txt.corpus.from.dir(dir.source, encoding, language)
## prompt(A2E::get.txt.corpus.from.dir)  # @to-do criar arquivo Rd de documentação

# per file #####
concept.file.name <- c('A2E/data/owasp/pt/A1injecao.txt') # UTF-8
concept.corpus <- get.txt.corpus(concept.file.name, encoding, language)
## prompt(A2E::get.txt.corpus)   # @to-do criar arquivo Rd de documentação

test.file.name <- c('A2E/data/mwe/injecao.pdf')  # UTF-8
test.corpus <- A2E::get.pdf.corpus(test.file.name, encoding, language)
## prompt(A2E::get.pdf.corpus) # @to-do criar arquivo Rd de documentação

stop.words.languages <- c('portuguese')
concept.corpus <- A2E::transform.corpus(concept.corpus, stop.words.languages)
test.corpus <- A2E::transform.corpus(test.corpus, stop.words.languages)
## prompt(A2E::transform.corpus) # @to-do criar arquivo Rd de documentação


weighting <- tm::weightTfIdf
# feature.mode <- 'relativo'
feature.mode <- 'absoluto'
concept.matrix <- A2E::normalize.features(concept.corpus, weighting, feature.mode)
test.matrix <- A2E::normalize.features(test.corpus, feature.mode)
## prompt(A2E::normalize.features) # @to-do criar arquivo Rd de documentação



