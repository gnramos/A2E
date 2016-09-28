Analisador Automático de Editais
================================

Introdução
----------

Este repositório contém a ferramenta _A2E_, criada para auxiliar a análise de requisitos de segurança de software em editais da Administração Pública Federal.

Instalação
----------

O código é feito na [linguagem de programação R](https://www.r-project.org/) versão **3.3.1 ou superior** ([detalhes de instalação](https://cran.r-project.org)), e utiliza os pacotes:
* [Big Memory](https://cran.r-project.org/web/packages/bigmemory/)
* [Natural Language Processing Interface](https://cran.r-project.org/web/packages/NLP/)
* [OpenNLP Tools Interface](https://cran.r-project.org/web/packages/openNLP/)
* [Text Mining](https://cran.r-project.org/web/packages/tm/)

A A2E/forma mais simples de preparar seu sistema para utilização do A2E é instalar as dependências básicas no seu sistema e executar o script [install.dependencies.R](A2E/R/install.dependencies.R). Supondo que você use uma versão do [Ubuntu](http://www.ubuntu.com), basta:

```bash
sudo apt-get install r-base-core r-cran-rjava
sudo Rscript install.dependencies.R
```

Publicações
-----------

* Dissertação de Mestrado ([UnB](http://www.unb.br)): [Avaliação semântica da integração da gestão de riscos de segurança em documentos de software da administração pública](http://repositorio.unb.br/handle/10482/18827)
* Artigo em Conferência ([BRACIS 2016](http://www.cin.ufpe.br/~bracis2016/)): [Automatic Identification of Security Risks in Edicts for Software Procurement]()
