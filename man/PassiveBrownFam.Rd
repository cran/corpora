\name{PassiveBrownFam}
\docType{data}
\alias{PassiveBrownFam}

\title{

  By-text frequencies of passive verb phrases in the Brown Family corpora.
  
}

\description{

  This data set specifies the number of passive and active verb phrases for each text in
  the extended Brown Family of corpora (Brown, LOB, Frown, FLOB, BLOB), covering
  edited written American and British English from 1930s, 1960s and 1990s (see Xiao 2008, 395--397).

  Verb phrase and passive/active aspect counts are based on a fully
  automatic analysis of the texts, using the Pro3Gres parser (Schneider et al. 2004).

}

\usage{

PassiveBrownFam

}

\format{

  A data frame with 2499 rows and the following 11 columns:

  \describe{
    \item{\code{id}:}{A unique ID for each text (also used as row name)}
    \item{\code{corpus}:}{Corpus, a factor with five levels \code{BLOB}, \code{Brown}, \code{LOB}, \code{Frown}, \code{FLOB}}
    \item{\code{section}:}{Genre, a factor with fifteen levels \code{A}, \ldots, \code{R} (Brown section codes)}
    \item{\code{genre}:}{Genre labels, a factor with fifteen levels (e.g. \code{press reportage})}
    \item{\code{period}:}{Date of publication, a factor with three levels (\code{1930}, \code{1960}, \code{1990})}
    \item{\code{lang}:}{Language variety / region, a factor with levels \code{AmE} (U.S.) and \code{BrE} (UK)}
    \item{\code{n.words}:}{Number of word tokens, an integer vector}
    \item{\code{act}:}{Number of active verb phrases, an integer vector}
    \item{\code{pass}:}{Number of passive verb phrases, an integer vector}
    \item{\code{verbs}:}{Total number of verb phrases, an integer vector}
    \item{\code{p.pass}:}{Percentage of passive verb phrases in the text, a numeric vector}
  }

}

\details{

  No frequency data could be obtained for text \code{N02} in the Frown corpus.  This entry has been omitted from the table.
  
}

\section{Acknowledgements}{

  Frequency information for this data set was kindly provided by Gerold Schneider, University of Zurich (\url{http://www.cl.uzh.ch/de/people/team/compling/gschneid.html}).
  
}

\references{

  Schneider, Gerold; Rinaldi, Fabio; Dowdall, James (2004). Fast, deep-linguistic statistical dependency parsing. In G.-J. M. Kruijff and D. Duchier (eds.), \emph{Proceedings of the COLING 2004 Workshop on Recent Advances in Dependency Grammar}, pages 33-40, Geneva, Switzerland. \url{https://files.ifi.uzh.ch/cl/gschneid/parser/}
  
  Xiao, Richard (2008). Well-known and influential corpora. In A. Lüdeling and M. Kytö (eds.), \emph{Corpus Linguistics. An International Handbook}, chapter 20, pages 383--457. Mouton de Gruyter, Berlin.
  
}

%%\examples{
%%}

\author{Stefan Evert <\email{stefan.evert@fau.de}>}
\keyword{datasets}