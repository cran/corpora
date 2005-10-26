\name{binom.pval}
\alias{binom.pval}
\title{P-values of the binomial test for frequency counts (corpora)}

\description{

  This function computes the p-value of a binomial test for frequency
  counts.  In the two-sided case, a fast approximation is used that may
  be inaccurate for small samples.

}

\usage{

binom.pval(k, n, p = 0.5,
           alternative = c("two.sided", "less", "greater"))

}

\arguments{

  \item{k}{frequency of a type in the corpus (or an integer vector of
    frequencies)}
  \item{n}{number of tokens in the corpus, i.e. sample size (or an
    integer vector specifying the sizes of different samples)}
  \item{p}{null hypothesis, giving the assumed proportion of this
    type in the population (or a vector of proportions for different
    types and/or different populations)}
  \item{alternative}{a character string specifying the alternative
    hypothesis; must be one of \code{two.sided} (default), \code{less}
    or \code{greater}}

}

\value{

  The p-value of a binomial test applied to the given data (or a vector
  of p-values).
  
}

\details{

When \code{alternative} is \code{two.sided}, a fast approximation of the
two-sided p-value is used (multiplying the appropriate single-sided tail
probability by two), which may be inaccurate for small samples.  Unlike
the exact algorithm of \code{\link{binom.test}}, this implementation can
be applied to large frequencies and samples without a serious impact on
performance.

}

\seealso{\code{\link{z.score.pval}}, \code{\link{prop.cint}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{htest}