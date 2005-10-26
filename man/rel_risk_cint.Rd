\name{rel.risk.cint}
\alias{rel.risk.cint}
\title{Conservative confidence interval for the relative risk ratio (corpora)}

\description{

  This function approximates a conservative confidence interval for the
  relative risk coefficient, i.e. the ratio \eqn{r = p_1/p_2} between
  two population proportions, based on frequency counts from two
  corpora.  The approximation is computed from individual confidence
  intervals for the two proportions, with confidence levels adjusted
  accordingly.

}

\usage{

rel.risk.cint(k1, n1, k2, n2,
              conf.level = 0.95, alternative = c("two.sided", "less", "greater"),
              method = c("binomial", "z.score"), correct = TRUE)

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

  \item{conf.level}{the desired confidence level (defaults to 95\%)}

  \item{alternative}{a character string specifying the alternative
    hypothesis, yielding a two-sided (\code{two.sided}, default), lower
    one-sided (\code{less}) or upper one-sided (\code{greater})
    confidence interval}

  \item{method}{a character string specifying whether the individual
    confidence intervals for the two proportions are based on the
    binomial test (\code{binomial}) or the z-score test
    (\code{z.score})}

  \item{correct}{if \code{TRUE}, apply Yates' continuity correction for
    the z-score test (default)}

}

\value{

  A data frame with two columns, labelled \code{lower} for the lower
  boundary and \code{upper} for the upper boundary of the confidence
  interval.  The number of rows is determined by the length of the
  longest input vector (\code{k1}, \code{n1}, \code{k2}, \code{n2} and
  \code{conf.level}).
  
}

\details{

  This function computes individual confidence intervals for the two
  population proportions \eqn{p_1} (from \eqn{k_1} and \eqn{n_1}) and
  \eqn{p_2} (from \eqn{k_2} and \eqn{n_2}).  Then, a confidence interval
  for the relative risk ratio \eqn{r = p_1 / p_2} is determined in such
  a way, that \eqn{r} lies within the interval whenever \eqn{p_1} and
  \eqn{p_2} lie in their respective confidence intervals.

  Thus, when these intervals are computed with a confidence level of
  e.g. \eqn{.975}, \eqn{r} is certain to fall within its confidence
  interval in \eqn{.975^2 = .95} of all cases.  This adjustment of
  confidence levels is made automatically.  Note that \eqn{r}
  \emph{might} fall within its confidence interval even when either
  \eqn{p_1} or \eqn{p_2} is outside the respective interval, hence
  \code{rel.risk.cint} computes a \emph{conservative} confidence
  interval that will be larger than necessary.

  Exact confidence intervals for the \emph{odds ratio} coefficient
  \eqn{\theta = (p_1 / (1-p_1)) / (p_2 / (1-p_2))} can be computed with
  the \code{\link{fisher.test}} function.  However, these exact
  intervals are computationally \emph{very} expensive and may cause \R
  to run out of memory for large frequency counts.  In addition,
  \code{fisher.test} only computes a single confidence interval for each
  function call (i.e., it cannot be applied to vectorised data).
  
}

\seealso{\code{\link{prop.cint}}, \code{\link{chisq.pval}},
  \code{\link{fisher.pval}}, \code{\link{fisher.test}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{htest}