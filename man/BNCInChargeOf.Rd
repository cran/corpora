\name{BNCInChargeOf}
\docType{data}
\alias{BNCInChargeOf}

\title{

  Collocations of the phrase "in charge of" (BNC)

}

\description{

  This data set lists collocations (in the sense of Sinclair 1991) of
  the phrase \emph{in charge of} found in the British National Corpus,
  World Edition (BNC).  A span size of 3 and a frequency threshold of 5
  were used, i.e. all words that occur at least five times within a
  distance of three tokens from the key phrase \emph{in charge of} are
  listed as collocates.  Note that collocations were not allowed to
  cross sentence boundaries.

  See Aston & Burnard (1998) for more information about the BNC, or go
  to \url{http://www.natcorp.ox.ac.uk/}.

}

\usage{

BNCInChargeOf

}

\format{

  A data frame with 250 rows and the following columns:

  \describe{
    \item{\code{collocate}:}{a collocate of the key phrase \emph{in charge of} (word form)}
    \item{\code{f.in}:}{occurrences of the collocate within a distance of
      3 tokens from the key phrase, i.e. \emph{inside} the span}
    \item{\code{N.in}:}{total number of tokens inside the span}
    \item{\code{f.out}:}{occurrences of the collocate \emph{outside} the span}
    \item{\code{N.out}:}{total number of tokens outside the span}
  }

}

\details{

  Punctuation, numbers and any words containing non-alphabetic
  characters (except for \code{-}) were not considered as potential
  collocates.  Likewise, the number of tokens inside / outside the span
  given in the columns \code{N.in} and \code{N.out} only includes simple
  alphabetic word forms.
  
}
  
\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.

  Sinclair, John (1991). \emph{Corpus, Concordance, Collocation.} Oxford
  University Press, Oxford.
  
}

%%\examples{
%%}

\author{Stefan Evert <\email{stefan.evert@fau.de}>}
\keyword{datasets}