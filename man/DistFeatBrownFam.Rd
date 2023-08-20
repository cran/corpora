\name{DistFeatBrownFam}
\docType{data}
\alias{DistFeatBrownFam}

\title{

  Latent dimension scores from a distributional analysis of the Brown Family corpora
  
}

\description{

  This data frame provides unsupervised distributional features for each text in
  the extended Brown Family of corpora (Brown, LOB, Frown, FLOB, BLOB), covering
  edited written American and British English from 1930s, 1960s and 1990s (see Xiao 2008, 395--397).

  Latent topic dimensions were obtained by a method similar to Latent Semantic Indexing (Deerwester et al. 1990),
  applying singular value decomposition to bag-of-words vectors for the 2500 texts in the extended Brown Family.
  Register dimensions were obtained with the same methodology, using vectors of part-of-speech frequencies
  (separately for all verb-related tags and all other tags).

}

\usage{

DistFeatBrownFam

}

\format{

  A data frame with 2500 rows and the following 23 columns:

  \describe{
    \item{\code{id}:}{A unique ID for each text (also used as row name)}
    \item{\code{top1}, \code{top2}, \code{top3}, \code{top4}, \code{top5}, \code{top6}, \code{top7}, \code{top8}, \code{top9}:}{latent dimension scores for the first 9 topic dimensions}
    \item{\code{reg1}, \code{reg2}, \code{reg3}, \code{reg4}, \code{reg5}, \code{reg6}, \code{reg7}, \code{reg8}, \code{reg9}:}{latent dimension scores for the first 9 register dimensions (excluding verb-related tags)}
    \item{\code{vreg1}, \code{vreg2}, \code{vreg3}, \code{vreg4}:}{latent dimension scores for the first 4 register dimensions based only on verb-related tags}
  }

}

\details{

  \bold{TODO}
  
}

\references{

  Deerwester, Scott; Dumais, Susan T.; Furnas, George W.; Landauer, Thomas K.; Harshman, Richard (1990). Indexing by latent semantic analysis. \emph{Journal of the American Society For Information Science}, \bold{41}(6), 391--407.
  
  Xiao, Richard (2008). Well-known and influential corpora. In A. Lüdeling and M. Kytö (eds.), \emph{Corpus Linguistics. An International Handbook}, chapter 20, pages 383--457. Mouton de Gruyter, Berlin.
  
}

%%\examples{
%%}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{datasets}