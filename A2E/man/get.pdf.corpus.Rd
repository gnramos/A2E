\name{get.pdf.corpus}
\alias{get.pdf.corpus}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Função para ler um arquivo PDF, extrair seu conteúdo e organizá-lo em um tm::Corpus.
}
\description{
Esta função recebe o caminho para um arquivo PDF, extraindo seu conteúdo e o organizando em um Corpus.
}
\usage{
get.pdf.corpus(file.name, encoding = "UTF-8", language = "por")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file.name}{
O identificador do arquivo texto, que deve conter o caminho completo, incluindo o nome do arquivo.
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
Retorna um Corpus contendo o conteúdo textual do arquivo dado.
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
corpus <- A2E::get.pdf.corpus('A2E/data/owasp/pt/A1injecao.pdf', 'UTF-8', 'por')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{IO}%
\keyword{Statistics}%
