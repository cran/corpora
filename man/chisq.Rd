\name{chisq}
\alias{chisq}
\encoding{latin1}
\title{Pearson's chi-squared statistic for frequency comparisons (corpora)}

\description{

  This function computes Pearson's chi-squared statistic (often written
  as \eqn{X^2}) for frequency comparison data, with or without Yates'
  continuity correction.  The implementation is based on the formula
  given by Evert (2004, 82).
  
}

\usage{

chisq(k1, n1, k2, n2, correct = TRUE, one.sided=FALSE)

}

\arguments{

  \item{k1}{frequency of a type in the first corpus (or an integer
    vector of type frequencies)}

  \item{n1}{the sample size of the first corpus (or an integer vector
    specifying the sizes of different samples)}

  \item{k2}{frequency of the type in the second corpus (or an integer
    vector of type frequencies, in parallel to \code{k1})}

  \item{n2}{the sample size of the second corpus (or an integer vector
    specifying the sizes of different samples, in parallel to
    \code{n1})}

  \item{correct}{if \code{TRUE}, apply Yates' continuity correction
    (default)}

  \item{one.sided}{if \code{TRUE}, compute the \emph{signed square root}
    of \eqn{X^2} as a statistic for a one-sided test (see details below;
    the default value is \code{FALSE})}
    
}

\value{

  The chi-squared statistic \eqn{X^2} corresponding to the specified
  data (or a vector of \eqn{X^2} values).  This statistic has a
  \emph{chi-squared distribution} with \eqn{df=1} under the null
  hypothesis of equal proportions.
  
}

\details{

  The \eqn{X^2} values returned by this function are identical to those
  computed by \code{\link{chisq.test}}.  Unlike the latter, \code{chisq}
  accepts vector arguments so that a large number of frequency
  comparisons can be carried out with a single function call.

  The one-sided test statistic (for \code{one.sided=TRUE}) is the signed
  square root of \eqn{X^2}.  It is positive for \eqn{k_1/n_1 > k_2/n_2}
  and negative for \eqn{k_1/n_1 < k_2/n_2}.  Note that this statistic
  has a \emph{standard normal distribution} rather than a chi-squared
  distribution under the null hypothesis of equal proportions.
  
}

\seealso{\code{\link{chisq.pval}}, \code{\link{chisq.test}},
  \code{\link{cont.table}}}
  
\examples{
chisq.test(cont.table(99, 1000, 36, 1000))
chisq(99, 1000, 36, 1000)
}

\references{

  Evert, Stefan (2004). \emph{The Statistics of Word Cooccurrences: Word
  Pairs and Collocations.}  Ph.D. thesis, Institut f?r maschinelle
  Sprachverarbeitung, University of Stuttgart.  Published in 2005, URN
  urn:nbn:de:bsz:93-opus-23714. Available from
  \url{http://www.collocations.de/phd.html}.
  
}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{htest}