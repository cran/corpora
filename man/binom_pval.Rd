\name{binom.pval}
\alias{binom.pval}
\title{P-values of the binomial test for frequency counts (corpora)}

\description{

  This function computes the p-value of a binomial test for frequency
  counts.  In the two-sided case, a \dQuote{central} p-value (Fay 2010)
  provides better numerical efficiency than the likelihood-based approach
  of \code{binom.test} and is always consistent with confidence intervals.

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

For \code{alternative="two.sided"} (the default), a \dQuote{central} p-value
is computed (Fay 2010: 53f), which differs from the likelihood-based two-sided
p-value determined by \code{binom.test} (the \dQuote{minlike} method in Fay's
terminology).  This approach has two advantages: (i) it is numerically robust
and efficient, even for very large samples and frequency counts; (ii) it is 
always consistent with Clopper-Pearson confidence intervals (see examples below).

}

\seealso{
  \code{\link{z.score.pval}}, \code{\link{prop.cint}}
}

\references{

  Fay, Michael P. (2010). Two-sided exact tests and matching confidence intervals for discrete data. \emph{The R Journal}, \bold{2}(1), 53-58.
  
}
  
\examples{
# inconsistency btw likelihood-based two-sided binomial test and confidence interval
binom.test(2, 10, p=0.555)

# central two-sided test as implemented by binom.pval is always consistent
binom.pval(2, 10, p=0.555)
prop.cint(2, 10, method="binomial")
}
  
\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{htest}