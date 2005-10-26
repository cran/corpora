\name{BNCdomains}
\docType{data}
\alias{BNCdomains}

\title{

  Distribution of domains in the British National Corpus (BNC)

}

\description{

  This data set gives the number of documents and tokens in each of the
  18 domains represented in the British National Corpus, World Edition
  (BNC).  See Aston & Burnard (1998) for more information about the BNC
  and the domain classification, or go to
  \url{http://www.natcorp.ox.ac.uk/}.

}

\usage{
data(BNCdomains)
}

\format{

  A data set with 19 rows and the following columns:

  \describe{
    \item{\code{domain}:}{name of the respective domain in the BNC}
    \item{\code{documents}:}{number of documents from this domain}
    \item{\code{tokens}:}{total number of tokens in all documents from
      this domain}
  }

}

\details{

  For one document in the BNC, the domain classification is missing.
  This document is represented by the code \code{Unlabeled} in the data
  set.
  
}
  
\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.

}

%%\examples{
%%}

\author{Marco Baroni (\email{baroni@sslmit.unibo.it})}
\keyword{datasets}