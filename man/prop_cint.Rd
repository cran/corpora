\name{prop.cint}
\alias{prop.cint}
\title{Confidence interval for proportion based on frequency counts (corpora)}

\description{

  This function computes a confidence interval for a population proportion from
  the corresponding frequency count in a sample.  It either uses the Clopper-Pearson
  method (inverted exact binomial test) or the Wilson score method (inversion of a
  z-score test, with or without continuity correction).
  
}

\usage{

prop.cint(k, n, method = c("binomial", "z.score"), correct = TRUE, p.adjust=FALSE,
          conf.level = 0.95, alternative = c("two.sided", "less", "greater"))

}

\arguments{

  \item{k}{frequency of a type in the corpus (or an integer vector of
    frequencies)}
  \item{n}{number of tokens in the corpus, i.e. sample size (or an
    integer vector specifying the sizes of different samples)}
  \item{method}{a character string specifying whether to compute
    a Clopper-Pearson confidence interval (\code{binomial}) or
    a Wilson score interval (\code{z.score})}
  \item{correct}{if \code{TRUE}, apply Yates' continuity correction for
    the z-score test (default)}
  \item{p.adjust}{if \code{TRUE}, apply a Bonferroni correction to ensure
    a family-wise confidence level over all tests carried out in a single
    function call (i.e. the length of \code{k}). Alternatively, the desired 
    family size can be specified instead of \code{TRUE}.}
  \item{conf.level}{the desired confidence level (defaults to 95\%)}
  \item{alternative}{a character string specifying the alternative
    hypothesis, yielding a two-sided (\code{two.sided}, default), lower
    one-sided (\code{less}) or upper one-sided (\code{greater})
    confidence interval}

}

\value{

  A data frame with two columns, labelled \code{lower} for the lower
  boundary and \code{upper} for the upper boundary of the confidence
  interval.  The number of rows is determined by the length of the
  longest input vector (\code{k}, \code{n} and \code{conf.level}).
  
}

\details{

  The confidence intervals computed by this function correspond to those
  returned by \code{\link{binom.test}} and \code{\link{prop.test}},
  respectively.  However, \code{prop.cint} accepts vector arguments,
  allowing many confidence intervals to be computed with a single
  function call in a computationally efficient manner.
  
  The \bold{Clopper-Pearson} confidence interval (\code{binomial}) is
  obtained by inverting the exact binomial test at significance level
  \eqn{\alpha} = 1 - \code{confidence.level}.
  In the two-sided case, the p-value of the test is computed using the
  \dQuote{central} method Fay (2010: 53), i.e. as twice the tail probability
  of the matching tail. This corresponds to the algorithm originally proposed
  by Clopper & Pearson (1934).
  
  The limits of the confidence interval are computed in an efficient and
  numerically robust manner via (the inverse of) the incomplete Beta function.
  
  The \bold{Wilscon score} confidence interval (\code{z.score}) is computed
  by solving the equation of the z-score test \deqn{%
    \frac{k - np}{\sqrt{n p (1-p)}} = A }{%
    (k - np) / sqrt(n p (1-p)) = A }
  for \eqn{p}, where \eqn{A} is the \eqn{z}-value corresponding
  to the chosen confidence level (e.g. \eqn{\pm 1.96}{+/- 1.96} for a
  two-sided test with 95\% confidence).  This leads to the quadratic
  equation \deqn{%
    p^2 (n + A^2) + p (-2k - A^2) + \frac{k^2}{n} = 0 }{%
    p^2 (n + A^2) + p (-2k - A^2) + k^2 / n = 0 }
  whose two solutions correspond to the lower and upper boundary of
  the confidence interval.

  When Yates' continuity correction is applied, the value \eqn{k} in the
  numerator of the \eqn{z}-score equation has to be replaced by
  \eqn{k^*}{k*}, with \eqn{k^* = k - 1/2}{k* = k - 1/2} for the
  \emph{lower} boundary of the confidence interval (where \eqn{k > np})
  and \eqn{k^* = k + 1/2}{k* = k + 1/2} for the \emph{upper} boundary of
  the confidence interval (where \eqn{k < np}).  In each case, the
  corresponding solution of the quadratic equation has to be chosen
  (i.e., the solution with \eqn{k > np} for the lower boundary and vice
  versa).
 
  If a \bold{Bonferroni} correction is applied, the significance level \eqn{\alpha}
  of the underlying test is divided by the number \eqn{m} of tests carried out
  (specified explicitly by the user or given implicitly by \code{length(k)}):
  \eqn{\alpha' = \alpha / m}.
  
}

\seealso{\code{\link{z.score.pval}}, \code{\link{prop.test}},
  \code{\link{binom.pval}}, \code{\link{binom.test}}}
  
\examples{
# Clopper-Pearson confidence interval
binom.test(19, 100)
prop.cint(19, 100, method="binomial")

# Wilson score confidence interval
prop.test(19, 100)
prop.cint(19, 100, method="z.score")
}

\references{

  Clopper, C. J. & Pearson, E. S. (1934). The use of confidence or fiducial limits illustrated in the case of the binomial. \emph{Biometrika}, \bold{26}(4), 404-413.

  Fay, Michael P. (2010). Two-sided exact tests and matching confidence intervals for discrete data. \emph{The R Journal}, \bold{2}(1), 53-58.

  \url{https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval}

}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{htest}