\name{BrownBigrams}
\docType{data}
\alias{BrownBigrams}

\title{

  Bigrams of adjacent words from the Brown corpus

}

\description{

  This data set contains bigrams of adjacent word forms from the Brown
  corpus of written American English (Francis \& Kucera 1964).
  Co-occurrence frequencies are specified in the form of an observed
  contingency table, using the notation suggested by Evert (2008).
  
  Only bigrams that occur at least 5 times in the corpus are included.
  
}

\usage{

BrownBigrams

}

\format{

  A data frame with 24167 rows and the following columns:

  \describe{
    \item{\code{id}:}{unique ID of the bigram entry}
    \item{\code{word1}:}{the first word form in the bigram (character)}
    \item{\code{pos1}:}{part-of-speech category of the first word (factor)}
    \item{\code{word2}:}{the second word form in the bigram (character)}
    \item{\code{pos2}:}{part-of-speech category of the second word (factor)}
    \item{\code{O11}:}{co-occurrence frequency of the bigram (numeric)}
    \item{\code{O12}:}{occurrences of the first word without the second (numeric)} 
    \item{\code{O21}:}{occurrences of the second word without the first (numeric)}
    \item{\code{O22}:}{number of bigram tokens containing neither the first nor the second word (numeric)}
  }

}

\details{

  Part-of-speech categories are identified by single-letter codes, corresponding
  of the first character of the Penn tagset.

  Some important POS codes are
  \code{N} (noun), \code{V} (verb), \code{J} (adjective), \code{R} (adverb or particle),
  \code{I} (preposition), \code{D} (determiner), \code{W} (wh-word) and \code{M} (modal).

}
  
\references{

  Evert, Stefan (2008).
  Corpora and collocations.
  In A. Lüdeling and M. Kytö (eds.), \emph{Corpus Linguistics. An International Handbook}, chapter 58, pages 1212--1248. Mouton de Gruyter, Berlin, New York.

  Francis, W.~N. and Kucera, H. (1964).
  Manual of information to accompany a standard sample of present-day edited American English, for use with digital computers.
  Technical report, Department of Linguistics, Brown University, Providence, RI.
  
}

%%\examples{
%%}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{datasets}