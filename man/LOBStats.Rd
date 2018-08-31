\name{LOBStats}
\docType{data}
\alias{LOBStats}

\title{

  Basic statistics of texts in the LOB corpus

}

\description{

  This data set provides some basic quantiative measures for all texts
  in the LOB corpus of written British English (Johansson \emph{et al.} 1978).

}

\usage{

LOBStats

}

\format{

  A data frame with 500 rows and the following columns:

  \describe{
    \item{\code{ty}:}{number of distinct types}
    \item{\code{to}:}{number of tokens (including punctuation)}
    \item{\code{se}:}{number of sentences}
    \item{\code{towl}:}{mean word length in characters, averaged over tokens}
    \item{\code{tywl}:}{mean word length in characters, averaged over types}
  }

}

%% \details{
%% }

\seealso{

  \code{\link{BrownStats}}
  
}

\references{

  Johansson, Stig; Leech, Geoffrey; Goodluck, Helen (1978).
  Manual of information to accompany the Lancaster-Oslo/Bergen corpus of British English, for use with digital computers.
  Technical report, Department of English, University of Oslo, Oslo.
  
}

%%\examples{
%%}

\author{Marco Baroni <\email{baroni@sslmit.unibo.it}>}
\keyword{datasets}