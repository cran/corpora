\name{BrownStats}
\docType{data}
\alias{BrownStats}

\title{

  Basic statistics of texts in the Brown corpus

}

\description{

  This data set provides some basic quantiative measures for all texts
  in the Brown corpus of written American English (Francis \& Kucera 1964),

}

\usage{

BrownStats

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

  \code{\link{LOBStats}}
  
}

\references{

  Francis, W.~N. and Kucera, H. (1964).
  Manual of information to accompany a standard sample of present-day edited American English, for use with digital computers.
  Technical report, Department of Linguistics, Brown University, Providence, RI.
  
}

%%\examples{
%%}

\author{Marco Baroni <\email{baroni@sslmit.unibo.it}>}
\keyword{datasets}