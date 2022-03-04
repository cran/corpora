\name{BNCqueries}
\docType{data}
\alias{BNCqueries}

\title{

  Per-text frequency counts for a selection of BNCweb corpus queries

}

\description{

  This data set contains a table of frequency counts obtained with a selection of BNCweb (Hoffmann et al. 2008)
  queries for each text document in the British National Corpus (Aston & Burnard 1998).

}

\usage{

BNCqueries

}

\format{

  A data frame with 4048 rows and 12 columns.  The first column (\code{id}) contains a character vector of
  text IDs, the remaining columns contain integer vector of the corresponding per-text frequency counts for
  various BNCweb queries.  Column names ending in \code{.S} indicate sentence counts rather than token counts.

  The list below shows the BNCweb query used for each feature in CEQL syntax (Hoffmann et al. 2008, Ch. 6).
  \describe{
    \item{\code{id}:}{text ID}
    \item{\code{split.inf.S}:}{number of sentences containing a split infinitive with \emph{-ly} adverb; query: \code{_TO0 +ly_AV0 _V?I}}
    \item{\code{adv.inf.S}:}{number of sentences containing a non-split infinitive with \emph{-ly} adverb; query: \code{+ly_AV0 _TO0 _V?I}}
    \item{\code{superlative.S}:}{number of sentences containing a superlative adjective; query: \code{the (_AJS | most _AJ0)}}
    \item{\code{past.S}:}{number of sentences containing a paste tense verb; query: \code{_V?D}}
    \item{\code{wh.question.S}:}{number of wh-questions; query: \code{<s> _[PNQ,AVQ] _{V}}}
    \item{\code{stop.to}:}{frequency of the expression \emph{stop to} + verb; query: \code{{stop/V} to _{V}}}
    \item{\code{time}:}{frequency of the noun \emph{time}; query: \code{{time/N}}}
    \item{\code{click}:}{frequency of the verb \emph{to click}; query: \code{{click/V}}}
    \item{\code{noun}:}{frequency of common nouns; query: \code{_NN?}}
    \item{\code{nominalization}:}{frequency of nominalizations; query: \code{+[tion,tions,ment,ments,ity,ities]_NN?}}
    \item{\code{downtoner}:}{frequency of downtoners; query: \code{[almost,barely,hardly,merely,mildly,nearly,only,partially,partly,practically,scarcely,slightly,somewhat]}}
  }
  
}

\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.

  Hoffmann, Sebastian; Evert, Stefan; Smith, Nicholas; Lee, David; Berglund Prytz, Ylva (2008).
  \emph{Corpus Linguistics with BNCweb -- a Practical Guide}, volume 6 of English Corpus Linguistics. Peter Lang, Frankfurt am Main.
  See also \url{http://corpora.lancs.ac.uk/BNCweb/}.

}

\seealso{\code{\link{BNCmeta}}}

%%\examples{
%%}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{datasets}
