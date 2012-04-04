\name{cont.table}
\alias{cont.table}
\title{Build contingency tables for frequency comparison (corpora)}

\description{

  This is a convenience function which constructs 2x2 contingency tables
  needed for frequency comparisons with \code{\link{chisq.test}}, \code{\link{fisher.test}}
  and similar functions.
  
}

\usage{

cont.table(k1, n1, k2, n2, as.list=NA)

}

\arguments{

  \item{k1}{frequency of a type in the first corpus, a numeric scalar or vector}
  \item{n1}{the size of the first corpus (sample size), a numeric scalar or vector}
  \item{k2}{frequency of the type in the second corpus, a numeric scalar or vector}
  \item{n2}{the size of the second corpus (sample size), a numeric scalar or vector}
  \item{as.list}{whether multiple contingency tables can be constructed and are returned as a list (see "Details" below)}

}

\value{

  A numeric matrix containing a two-by-two contingency table for the
  specified frequency comparison, or a list of such matrices (see "Details").
  
}

\details{

  If all four arguments \code{k1 n1 k2 n2} are scalars (vectors of length 1),
  \code{cont.table} constructs a single contingency table, i.e. a 2x2 matrix.
  If at least one argument has length > 1, shorter vectors are replicated as 
  necessary, and a list of 2x2 contingency tables is constructed.
  
  With \code{as.list=TRUE}, the return value is always a list, even if it contains
  just a single contingency table.  With \code{as.list=FALSE}, only scalar arguments
  are accepted and the return value is guaranteed to be a 2x2 matrix.

}

\seealso{\code{\link{chisq.test}}, \code{\link{fisher.test}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{array}
\keyword{htest}