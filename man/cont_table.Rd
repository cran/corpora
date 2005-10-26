\name{cont.table}
\alias{cont.table}
\title{Build contingency table for frequency comparison (corpora)}

\description{

  This is a convenience function which constructs contingency tables
  needed for frequency comparisons with \code{\link{chisq.test}} and
  \code{\link{fisher.test}}.
  
}

\usage{

cont.table(k1, n1, k2, n2)

}

\arguments{

  \item{k1}{frequency of a type in the first corpus}
  \item{n1}{the size of the first corpus (sample size)}
  \item{k2}{frequency of the type in the second corpus}
  \item{n2}{the size of the second corpus (sample size)}

}

\value{

  A numeric matrix containing the two-by-two contingency table for the
  frequency comparison.
  
}

\details{

  Because matrices cannot easily be vectorized, this function does not
  accept vector arguments and will abort with an error message in this
  case.
  
}

\seealso{\code{\link{chisq.test}}, \code{\link{fisher.test}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{array}
\keyword{htest}