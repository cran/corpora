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

prop.cint(k, n, method = c("binomial", "z.score"), correct = TRUE,
          conf.level = 0.95, alternative = c("two.sided", "less", "greater"))

}

\arguments{

  \item{k}{frequency of a type in the corpus (or an integer vector of
    frequencies)}
  \item{n}{number of tokens in the corpus, i.e. sample size (or an
    integer vector specifying the sizes of different samples)}
  \item{method}{a character string specifying whether to compute
    a Clopper-Pearson confidence interval (\code{binomial}) or
    a Wilson score interval (\code{z.score}) is computed}
  \item{correct}{if \code{TRUE}, apply Yates' continuity correction for
    the z-score test (default)}
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
  function call.  In addition, it uses a fast approximation of the
  two-sided binomial test that can safely be applied to large samples.

  The confidence interval for a z-score test is computed by solving the
  z-score equation \deqn{%
    \frac{k - np}{\sqrt{n p (1-p)}} = \alpha }{%
    (k - np) / sqrt(n p (1-p)) = alpha }
  for \eqn{p}, where \eqn{\alpha} is the \eqn{z}-value corresponding
  to the chosen confidence level (e.g. \eqn{\pm 1.96}{+/- 1.96} for a
  two-sided test with 95\% confidence).  This leads to the quadratic
  equation \deqn{%
    p^2 (n + \alpha^2) + p (-2k - \alpha^2) + \frac{k^2}{n} = 0 }{%
    p^2 (n + alpha^2) + p (-2k - alpha^2) + k^2 / n = 0 }
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
  
}

\seealso{\code{\link{z.score.pval}}, \code{\link{prop.test}},
  \code{\link{binom.pval}}, \code{\link{binom.test}}}
  
%% \examples{
%% }

\references{
  \url{http://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval}
}

\author{Stefan Evert}
\keyword{htest}