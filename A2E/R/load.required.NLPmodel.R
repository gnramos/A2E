load.required.NLPmodel <- function(language, version) {
  model <- paste('openNLPmodels.', language, sep='')
  if (!require(model, character.only=TRUE)) {
    gz.file <- paste('openNLPmodels.', language, '_', version, '.tar.gz', sep='')
    src.url <- 'http://datacube.wu.ac.at/src/contrib/'
    pkg.src <- paste(src.url, gz.file, sep='')
    ignore <- install.packages(pkg.src, repos=NULL)
  }
}
