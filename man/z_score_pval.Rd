\name{z.score.pval}
\alias{z.score.pval}
\title{P-values of the z-score test for frequency counts (corpora)}

\description{

  This function computes the p-value of a z-score test for frequency
  counts, based on the z-score statistic implemented by
  \code{\link{z.score}}.  

}

\usage{

z.score.pval(k, n, p = 0.5, correct = TRUE,
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
  \item{correct}{if \code{TRUE}, apply Yates' continuity correction
    (default)}
  \item{alternative}{a character string specifying the alternative
    hypothesis; must be one of \code{two.sided} (default), \code{less}
    or \code{greater}}

}

\value{

  The p-value of a \eqn{z}-score test applied to the given data (or a vector
  of p-values).
  
}

%% \details{
%% }

\seealso{\code{\link{z.score}}, \code{\link{binom.pval}}, \code{\link{prop.cint}}}
  
\examples{
# compare z-test for H0: pi = 0.15 against binomial test
# with observed counts 10..30 in a sample of n=100 tokens
k <- c(10:30)
p.compare <- rbind(
  z.score = z.score.pval(k, 100, p=.15),
  binomial = binom.pval(k, 100, p=.15))
colnames(p.compare) <- k
round(p.compare, 4)
}
  
\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{htest}