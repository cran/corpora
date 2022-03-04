\name{fisher.pval}
\alias{fisher.pval}
\title{P-values of Fisher's exact test for frequency comparisons (corpora)}

\description{

  This function computes the p-value of Fisher's exact test (Fisher
  1934) for the comparison of corpus frequency counts (under the null
  hypothesis of equal population proportions).  In the two-sided case, a
  fast approximation is used that may be inaccurate for small samples.

}

\usage{

fisher.pval(k1, n1, k2, n2, 
            alternative = c("two.sided", "less", "greater"),
            log.p = FALSE)

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

  \item{alternative}{a character string specifying the alternative
    hypothesis; must be one of \code{two.sided} (default), \code{less}
    or \code{greater}}
    
  \item{log.p}{if TRUE, the natural logarithm of the p-value is returned}

}

\value{

  The p-value of Fisher's exact test applied to the given data
  (or a vector of p-values).
  
}

\details{

  When \code{alternative} is \code{two.sided}, a fast approximation of
  the two-sided p-value is used (multiplying the appropriate
  single-sided tail probability by two), which may be inaccurate for
  small samples.  Unlike the exact algorithm of
  \code{\link{fisher.test}}, this implementation is memory-efficient and
  can be applied to large samples and/or large frequency counts.

  For one-sided tests, the p-values returned by this functions are
  identical to those computed by \code{\link{fisher.test}} on two-by-two
  contingency tables.

}

\seealso{\code{\link{fisher.test}}, \code{\link{chisq.pval}}}

\references{

  Fisher, R. A. (1934). \emph{Statistical Methods for Research Workers}.
  Oliver & Boyd, Edinburgh, 2nd edition (1st edition 1925, 14th
  edition 1970).

}

\examples{

  ## Fisher's Tea Drinker (see ?fisher.test)
  TeaTasting <-
  matrix(c(3, 1, 1, 3),
         nrow = 2,
         dimnames = list(Guess = c("Milk", "Tea"),
                         Truth = c("Milk", "Tea")))
  print(TeaTasting)
  ##  - the "corpora" consist of 4 cups of tea each (n1 = n2 = 4)
  ##     => columns of TeaTasting
  ##  - frequency counts are the number of cups selected by drinker (k1 = 3, k2 = 1)
  ##     => first row of TeaTasting
  ##  - null hypothesis of equal type probability = drinker makes random guesses
  fisher.pval(3, 4, 1, 4, alternative="greater")
  fisher.test(TeaTasting, alternative="greater")$p.value # should be the same
  
  fisher.pval(3, 4, 1, 4) # uses fast approximation suitable for small p-values
  fisher.test(TeaTasting)$p.value # approximation is exact for symmetric distribution

}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{htest}