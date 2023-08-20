\name{BrownLOBPassives}
\docType{data}
\alias{BrownLOBPassives}

\title{

  Frequency counts of passive verb phrases in the Brown and LOB corpora

}

\description{

  This data set contains frequency counts of passive verb phrases for selected texts
  from the Brown corpus of written American English (Francis & Kucera 1964)
  and the comparable LOB corpus of written British English (Johansson \emph{et al.} 1978).

}

\usage{

BrownLOBPassives

}

\format{

  A data frame with 622 rows and the following columns:

  \describe{
    \item{\code{id}:}{a unique ID for each text (character)}
    \item{\code{passive}:}{number of passive verb phrases}
    \item{\code{n_w}:}{total number of words in the genre category}
    \item{\code{n_s}:}{total number of sentences in the genre category}
    \item{\code{cat}:}{genre category code (\code{A} \ldots \code{R}; factor)}
    \item{\code{genre}:}{descriptive label for the genre category (factor)}
    \item{\code{lang}:}{descriptive label for the genre category}
  }

}

%% \details{
%% }
  
\seealso{

  \code{\link{BrownPassives}}, \code{\link{LOBPassives}}
  
}

\references{

  Francis, W.~N. and Kucera, H. (1964).
  Manual of information to accompany a standard sample of present-day edited American English, for use with digital computers.
  Technical report, Department of Linguistics, Brown University, Providence, RI.

  Johansson, Stig; Leech, Geoffrey; Goodluck, Helen (1978).
  Manual of information to accompany the Lancaster-Oslo/Bergen corpus of British English, for use with digital computers.
  Technical report, Department of English, University of Oslo, Oslo.

}

%%\examples{
%%}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{datasets}