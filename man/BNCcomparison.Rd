\name{BNCcomparison}
\docType{data}
\alias{BNCcomparison}

\title{

Comparison of written and spoken noun frequencies in the British National Corpus

}

\description{

  This data set compares the frequencies of 60 selected nouns in the
  written and spoken parts of the British National Corpus, World Edition
  (BNC).  Nouns were chosen from three frequency bands, namely the 20
  most frequent nouns in the corpus, 20 nouns with approximately 1000
  occurrences, and 20 nouns with approximately 100 occurrences.

  See Aston & Burnard (1998) for more information about the BNC, or go
  to \url{http://www.natcorp.ox.ac.uk/}.

}

\usage{

BNCcomparison

}

\format{

  A data frame with 61 rows and the following columns:

  \describe{
    \item{\code{noun}:}{lemmatised noun (aka stem form)}
    \item{\code{written}:}{frequency in the written part of the BNC}
    \item{\code{spoken}:}{frequency in the spoken part of the BNC}
  }

}

\details{

  In addition to the 60 nouns, the data set contains a column labelled
  \code{OTHER}, which represents the total frequency of all other nouns
  in the BNC.  This value is needed in order to calculate the sample
  sizes of the written and spoken part for frequency comparison tests.
  
}
  
\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.

}

%%\examples{
%%}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{datasets}