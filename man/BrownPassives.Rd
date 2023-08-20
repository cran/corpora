\name{BrownPassives}
\docType{data}
\alias{BrownPassives}

\title{

  Frequency counts of passive verb phrases in the Brown corpus

}

\description{

  This data set contains frequency counts of passive verb phrases
  in the Brown corpus of written American English (Francis & Kucera 1964),
  aggregated by genre category.

}

\usage{

BrownPassives

}

\format{

  A data frame with 15 rows and the following columns:

  \describe{
    \item{\code{cat}:}{genre category code (\code{A} \ldots \code{R})}
    \item{\code{passive}:}{number of passive verb phrases}
    \item{\code{n_w}:}{total number of words in the genre category}
    \item{\code{n_s}:}{total number of sentences in the genre category}
    \item{\code{name}:}{descriptive label for the genre category}
  }

}

%% \details{
%% }

\seealso{

  \code{\link{LOBPassives}}, \code{\link{BrownLOBPassives}}
  
}
  
\references{

  Francis, W.~N. and Kucera, H. (1964).
  Manual of information to accompany a standard sample of present-day edited American English, for use with digital computers.
  Technical report, Department of Linguistics, Brown University, Providence, RI.
  
}

%%\examples{
%%}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{datasets}