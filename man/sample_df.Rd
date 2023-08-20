\name{sample.df}
\alias{sample.df}
\title{Random samples from data frames (corpora)}

\description{

  This function takes a random sample of rows from a data frame,
  in analogy to the built-in function \code{sample} (which sadly
  does not accept a data frame).
  
}

\usage{

sample.df(df, size, replace=FALSE, sort=FALSE, prob=NULL)

}

\arguments{

  \item{df}{a data frame to be sampled from}
  
  \item{size}{positive integer giving the number of rows to choose}

  \item{replace}{Should sampling be with replacement?}
  
  \item{sort}{Should rows in sample be sorted in original order?}
  
  \item{prob}{a vector of probability weights for obtaining the elements of the vector being sampled}

}

\value{

  A data frame containing the sampled rows of \code{df}, either their original order (\code{sort=TRUE})
  or shuffled randomly (\code{sort=FALSE}).
  
}

\details{

  Internally, rows are selected with the function \code{\link{sample.int}}.  See its manual page
  for details on the arguments (except for \code{sort}) and implementation.

}

\examples{
sample.df(BrownLOBPassives, 20, sort=TRUE)
}
  
\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{manip}