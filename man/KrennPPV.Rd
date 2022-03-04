\name{KrennPPV}
\docType{data}
\alias{KrennPPV}

\title{

  German PP-Verb collocation candidates annotated by Brigitte Krenn (2000)

}

\description{

  This data set lists 5102 frequent combinations of verbs and prepositional phrases (PP)
  extracted from a German newspaper corpus.  The collocational status of each
  PP-verb combination was manually annotated by Brigitte Krenn (2000).  In addition,
  pre-computed scores of several standard association measures are provided.
   
  The \code{KrennPPV} candidate set forms part of the data used in the evaluation study
  of Evert \& Krenn (2005). 
  
}

\usage{

KrennPPV

}

\format{

  A data frame with 5102 rows and the following columns:

  \describe{
    \item{\code{PP}:}{the prepositional phrase, represented by preposition and lemma of the nominal head (character).
      Preposition-article fusion is indicated by a \code{+} sign. For example, the prepositional phrase
      \emph{im letzten Jahr} would appear as \code{in:Jahr} in the data set.
    }
    \item{\code{verb}:}{the verb lemma (character).
      Separated particle verbs have been recombined.
    }
    \item{\code{is.colloc}:}{whether the PP-verb combination is a lexical collocation (logical)}
    \item{\code{is.SVC}:}{whether a PP-verb collocation is a support verb construction (logical)}
    \item{\code{is.figur}:}{whether a PP-verb-collocation is a figurative expression (logical)}
    \item{\code{freq}:}{co-occurrence frequency of the PP-verb combination within clauses (integer)}
    \item{\code{MI}:}{Mutual Information association measure}
    \item{\code{Dice}:}{Dice coefficient association measure}
    \item{\code{z.score}:}{z-score association measure}
    \item{\code{t.score}:}{t-score association measure} 
    \item{\code{chisq}:}{chi-squared association measure (without Yates' continuity correction)}
    \item{\code{chisq.corr}:}{chi-squared association measure (with Yates' continuity correction)}
    \item{\code{log.like}:}{log-likelihood association measure}
    \item{\code{Fisher}:}{Fisher's exact test as an association measure (negative logarithm of one-sided p-value)}
  }

  See Evert (2008) and \url{http://www.collocations.de/AM/} for details on these association measures.
}

%% \details{
%% }
  
\references{

  Evert, Stefan (2008).
  Corpora and collocations.
  In A. Lüdeling and M. Kytö (eds.), \emph{Corpus Linguistics. An International Handbook}, chapter 58, pages 1212--1248. Mouton de Gruyter, Berlin, New York.

  Evert, Stefan and Krenn, Brigitte (2005).
  Using small random samples for the manual evaluation of statistical association measures.
  \emph{Computer Speech and Language}, \bold{19}(4), 450--466.

  Krenn, Brigitte (2000).
  \emph{The Usual Suspects: Data-Oriented Models for the Identification and Representation of Lexical Collocations},
  volume~7 of \emph{Saarbrücken Dissertations in Computational Linguistics and Language Technology}.
  DFKI \& Universität des Saarlandes, Saarbrücken, Germany.

}

%%\examples{
%%}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{datasets}