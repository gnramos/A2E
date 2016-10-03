## Script execução do Analisador Automático de Editais
# por Rodrigo N. Peclat
#     Guilherme N. Ramos (gnramos@unb.br | http://github.com/gnramos)
#

# Load package #################################################################
# library('A2E')

# The alternative for not installing the package is: ###########################
library(devtools)
load_all('A2E')

# Actual example code starts here. #############################################

# Minimum Working Example ######################################################
language <- 'pt'
A2E::load.required.NLPmodel(language, version='1.5-2')
# prompt(load.required.NLPmodel)  # @to-do criar arquivo Rd de documentação

dev.furia <- A2E::get.text.content('A2E/data/mwe/DevFuria_A1.pdf')
stop.word.languages <- c('portuguese', 'english')
dictionary <- rownames(dev.furia) # @to-do Verificar se é isso mesmo
print(dictionary)
dev.furia.concepts <- A2E::get.corpus(dev.furia, language, stop.word.languages, dictionary)
print(dev.furia.concepts)
