\name{chisq.pval}
\alias{chisq.pval}
\title{P-values of Pearson's chi-squared test for frequency comparisons (corpora)}

\description{

  This function computes the p-value of Pearsons's chi-squared test for
  the comparison of corpus frequency counts (under the null hypothesis
  of equal population proportions). It is based on the chi-squared
  statistic \eqn{X^2} implemented by the \code{\link{chisq}} function.  

}

\usage{

chisq.pval(k1, n1, k2, n2, correct = TRUE,
           alternative = c("two.sided", "less", "greater"))

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

  \item{alternative}{a character string specifying the alternative
    hypothesis; must be one of \code{two.sided} (default), \code{less}
    or \code{greater}}

}

\value{

  The p-value of Pearson's chi-squared test applied to the given data
  (or a vector of p-values).
  
}

\details{

  The p-values returned by this functions are identical to those
  computed by \code{\link{chisq.test}} (two-sided only) and
  \code{\link{prop.test}} (one-sided and two-sided) for two-by-two
  contingency tables.

}

\seealso{\code{\link{chisq}}, \code{\link{fisher.pval}},
  \code{\link{chisq.test}}, \code{\link{prop.test}}}
  
%% \examples{
%% }
  
\author{Stefan Evert}
\keyword{htest}