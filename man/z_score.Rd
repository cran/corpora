\name{z.score}
\alias{z.score}
\title{The z-score statistic for frequency counts (corpora)}

\description{

  This function computes a z-score statistic for frequency counts, based
  on a normal approximation to the correct binomial distribution under
  the random sampling model.

}

\usage{

z.score(k, n, p = 0.5, correct = TRUE)

}

\arguments{

  \item{k}{frequency of a type in the corpus (or an integer vector of
    frequencies)}
  \item{n}{number of tokens in the corpus, i.e. sample size (or an
    integer vector specifying the sizes of different samples)}
  \item{p}{null hypothesis, giving the assumed proportion of this
    type in the population (or a vector of proportions for different
    types and/or different populations)}
  \item{correct}{if \code{TRUE}, apply Yates' continuity correction
    (default)}

}

\value{

  The \eqn{z}-score corresponding to the specified data (or a vector of
  \eqn{z}-scores).
  
}

\details{

  The \eqn{z} statistic is given by \deqn{%
    z := \frac{k - np}{\sqrt{n p (1-p)}} }{%
    z := (k - np) / sqrt(n p (1-p)) } 
  When Yates' continuity correction is enabled, the \emph{absolute
    value} of the numerator \eqn{d := k - np} is reduced by \eqn{1/2},
  but clamped to a non-negative value.

}

\seealso{\code{\link{z.score.pval}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{htest}