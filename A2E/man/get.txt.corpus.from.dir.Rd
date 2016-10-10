\name{get.txt.corpus.from.dir}
\alias{get.txt.corpus.from.dir}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Função para ler o conjunto de arquivos texto (.txt) em um diretório e organizá-los em um tm::Corpus.
}
\description{
Esta função recebe um diretório e lê todos os arquivos texto contidos nele, extraindo seus conteúdos e os organizando em um Corpus.
}
\usage{
get.txt.corpus.from.dir(dir.source, encoding = "UTF-8", language = "por")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dir.source}{
O identificador do diretório de arquivos.
}
  \item{encoding}{
A codificação do texto contido nos arquivos.
}
  \item{language}{
O código do idioma desejado (preferencialmente no padrão ISO 639-2).
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Retorna um Corpus contendo o conteúdo textual de todos os arquivos no diretório dado.
}
\references{
https://CRAN.R-project.org/package=tm
}
\author{
Guilherme N. Ramos <gnramos@unb.br>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
corpus <- A2E::get.txt.corpus.from.dir('A2E/data/owasp', 'UTF-8', 'por')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{IO}%
\keyword{Statistics}%
