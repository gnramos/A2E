load.required.NLPmodel <- function(language, version) {
  model <- paste0('openNLPmodels.', language)
  if (!require(model, character.only=TRUE)) {
    src.url <- 'http://datacube.wu.ac.at/src/contrib/'
    gz.file <- paste0('openNLPmodels.', language, '_', version, '.tar.gz')
    ignore <- install.packages(paste0(src.url, gz.file), repos=NULL)
  }
}
