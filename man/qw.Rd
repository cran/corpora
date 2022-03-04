\name{qw}
\alias{qw}
\title{
  Split string into words, similar to qw() in Perl (corpora)
}
\description{

  This function splits one or more character strings into words. By default, 
  the strings are split on whitespace in order to emulate Perl's \code{qw()} (quote words) functionality.

}

\usage{
qw(s, sep="\\\\s+", names=FALSE)
}

\arguments{

  \item{s}{
    one or more strings to be split (a character vector)
  }

  \item{sep}{
    PCRE regular expression on which to split (defaults to whitespace)
  }

  \item{names}{
    if TRUE, the resulting character vector is labelled with itself, which is convenient for \code{\link{lapply}} and similar functions
  }

}
\value{

  A character vector of the resulting words.  Multiple strings in \code{s} are flattened into a single vector.
  
  If \code{names=TRUE}, the words are used both as values and as labels of the character vectors, which is convenient when iterating over it with \code{\link{lapply}} or \code{\link{sapply}}.

}

\examples{
qw(c("alpha beta gamma", "42 111" ))
qw("alpha beta gamma", names=TRUE)
qw("words with blanks,  sep by commas", sep="\\\\s*,\\\\s*")
}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{utilities}
