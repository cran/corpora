\name{LOBPassives}
\docType{data}
\alias{LOBPassives}

\title{

  Frequency counts of passive verb phrases in the LOB corpus

}

\description{

  This data set contains frequency counts of passive verb phrases
  in the LOB corpus of written British English (Johansson \emph{et al.} 1978),
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

  \code{\link{BrownPassives}}, \code{\link{BrownLOBPassives}}
  
}

\references{

  Johansson, Stig; Leech, Geoffrey; Goodluck, Helen (1978).
  Manual of information to accompany the Lancaster-Oslo/Bergen corpus of British English, for use with digital computers.
  Technical report, Department of English, University of Oslo, Oslo.

}

%%\examples{
%%}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{datasets}