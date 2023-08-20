\name{rowColVector}
\alias{rowVector}
\alias{colVector}
\title{
  Propagate vector to single-row or single-column matrix (corpora)
}
\description{

  This utility function converts a plain vector into a row or column vector,
  i.e. a single-row or single-column matrix.

}

\usage{
rowVector(x, label=NULL)
colVector(x, label=NULL)
}

\arguments{

  \item{x}{
    a (typically numeric) vector
  }

  \item{label}{
    an optional character string specifying a label for the single row or column returned
  }

}
\value{

  A single-row or single-column matrix of the same data type as \code{x}.
  Labels of \code{x} are preserved as column/row names of the matrix.
  
  See \code{\link{matrix}} for details on how non-atomic objects are handled.

}

\examples{
rowVector(1:5, "myvec")
colVector(c(A=1, B=2, C=3), label="myvec")
}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{utilities}
