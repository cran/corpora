\name{keyness}
\alias{keyness}
\title{Compute best-practice keyness measures (corpora)}

\description{

  Compute best-practice keyness measures (according to Evert 2022) for the 
  frequency comparison of lexical items in two corpora.
  The function is fully vectorised and should be applied to a complete
  data set of candidate items (so statistical analysis can be adjusted to
  control the family-wise error rate).

}

\usage{

keyness(f1, n1, f2, n2, measure=c("LRC", "PositiveLRC", "G2", "LogRatio", "SimpleMaths"),
        conf.level=.95, alpha=NULL, p.adjust=TRUE, lambda=1)

}

\arguments{

  \item{f1}{a numeric vector specifying the frequencies of candidate items in corpus A (target corpus)}
  \item{n1}{sample size of target corpus, i.e. the total number of tokens in corpus A (usually a scalar, but can also be a vector parallel to \code{f1})}
  \item{f2}{a numeric vector parallel to \code{f1}, specifying the frequencies of candidate items in corpus B (reference corpus)}
  \item{n2}{sample size of reference corpus, i.e. the total number of tokens in corpus B (usually a scalar, but can also be a vector parallel to \code{f2})}
  \item{measure}{the keyness measure to be computed (see \dQuote{Details} below)}
  \item{conf.level}{the desired confidence level for the \code{LRC} and \code{PositiveLRC} measures (defaults to 95\%)}
  \item{alpha}{if specified, filter out candidate items whose frequency difference between \eqn{f_1} and \eqn{f_2} is not significant at level \eqn{\alpha}.
    This is achieved by setting the score of such candidates to 0.}
  \item{p.adjust}{if \code{TRUE}, apply a Bonferroni correction in order to control the family-wise error rate across all tests carried out
    in a single function call (i.e. the common length of \code{f1} and \code{f2}).
    Alternatively, the desired family size can be specified instead of \code{TRUE} (useful if a larger data set is processed in batches).
    The adjustment applied both the the significance filter (\code{alpha}) and the confidence intervals (\code{conf.level}) underlying \code{LRC} and \code{PositiveLRC} measures.}
  \item{lambda}{parameter \eqn{\lambda} of the \code{SimpleMaths} measure.}
}

\value{

  A numeric vector of the same length as \code{f1} and \code{f2}, containing keyness scores for all candidate lexical items.
  For most measures, positive scores indicate positive keywords (i.e. higher frequency in the population underlying corpus A)
  and negative scores indicate negative keywords (i.e. higher frequency in the population underlying corpus B).
  If \code{alpha} is specified, non-significant candidates always have a score of 0.
  
}

\details{

  This function computes a range of best-practice keyness measures comparing the relative frequencies
  \eqn{\pi_1} and \eqn{\pi_2} of lexical items in populations (i.e. sublanguages) A and B,
  based on the observed sample frequencies \eqn{f_1, f_2} and the corresponding sample sizes \eqn{n_1, n_2}.
  The function is fully vectorised with respect to arguments \code{f1}, \code{f2}, \code{n1} and \code{n2},
  but only a single keyness measure can be selected for each function call.
  All implemented measures are robust for the corner cases \eqn{f_1 = 0} and \eqn{f_2 = 0}, but \eqn{f_1 = f_2 = 0} is not allowed.
  
  Most of the keyness measures are \bold{directional}, 
  i.e. positive scores indicate positive keyness in A (\eqn{\pi_1 > \pi_2})
  and negative scores indicate negative keyness in A (\eqn{\pi_1 < \pi_2}).
  By contrast, the \bold{one-sided} measures \code{PositiveLRC} and \code{SimpleMaths} only detect positive keyness in A,
  returning small (and possibly negative) scores otherwise, i.e. in case of insufficient evidence for \eqn{\pi_1 > \pi_2}
  and in case of strong evidence for \eqn{\pi_1 < \pi_2}.
  One-sided measures can be useful for a ranking of the entire data set as positive keyword candidates.
  
  Hardie (2014) and other authors recommend to combine effect-size measures (in particular \code{LogRatio}) with
  a \bold{significance filter} in order to weed out candidate items for which there is no significant evidence
  against the null hypothesis \eqn{H_0: \pi_1 = \pi_2}.  Such a filter is activated by specifying the desired
  significance level \code{alpha}, and can be combined with all keyness measures.
  In this case, the scores of all non-significant candidate items are set to 0.
  The decision is based in the likelihood-ratio test implemented by the \code{G2} measure
  and its asymptotic \eqn{\chi^2_1} distribution under \eqn{H_0}.
  
  Note that the significance filter can also be applied to the \code{G2} measure itself, setting all scores
  below the critical value for the significance test to 0.
  For one-sided measures (\code{PositiveLRC} and \code{SimpleMaths}), candidates with significant evidence 
  for negative keyness are also filtered out (i.e. their scores are set to 0) in order to ensure a consistent ranking.
  
  By default, statistical inference corrects for multiple testing in order to control \bold{family-wise error rates}.
  This applies to the significance filter as well as to the confidence intervals underlying \code{LRC} and \code{PositiveLRC}.
  Note that the \code{G2} scores themselves are never adjusted (only the critical value for the significance filter is modified).

  Family size \eqn{m} is automatically determined from the number of candidate items processed in a single function call.
  Alternatively, the family size can be specified explicitly in the \code{p.adjust} argument, e.g. if a large data set
  is processed in multiple batches, or \code{p.adjust=FALSE} can be used to disable the correction.

  For the adjustment, a highly conservative Bonferroni correction \eqn{\alpha' = \alpha / m} is applied to significance levels.
  Since the large candidate sets and sample sizes often found in corpus linguistics tend to produce large numbers of false positives,
  this conservative approach is considered to be useful.
  
  See Evert (2022) and its supplementary materials for a more detailed discussion of the implemented best-practice measures and some alternatives.

  \subsection{Keyness Measures}{
    \describe{
      \item{\code{G2}}{
        The \bold{log-likelihood} measure (Rayson & Garside 2003: 3) computes the score \eqn{G^2}
        of a likelihood-ratio test for \eqn{H_0: \pi_1 = \pi_2}.  This test is two-sided and
        always returns positive values, so the sign of its score is inverted for \eqn{f_1 / n_1 < f_2 / n_2} 
        in order to obtain a directional keyness measure.
        As a pure significance measure, it tends to prefer high-frequency candidates with large \eqn{f_1}.
      }

      \item{\code{LogRatio}}{
        A point estimate of the log \bold{relative risk} \eqn{\log_2 (\pi_1 / \pi_2)}, which has been suggested
        as an intuitive keyness measure under the name \bold{LogRatio} by Hardie (2014: 45).
        The implementation uses Walter's (1975) adjusted estimator \deqn{%
          \log_2 \dfrac{f_1 + \frac12}{n_1 + \frac12} - \log_2 \dfrac{f_2 + \frac12}{n_2 + \frac12} 
          }{ log2(f1 + 0.5 / n1 + 0.5) - log2(f2 + 0.5 / n2 + 0.5) } 
        which is less biased and robust against \eqn{f_i = 0}.
        As a pure effect-size measure, LogRatio tends to assign spuriously high scores to low-frequency candidates
        with small \eqn{f_1} and \eqn{f_2} (due to sampling variation).
        Combination with a significance filter is strongly recommended.
      }

      \item{\code{LRC} (default)}{
        A \bold{conservative} estimate for \bold{LogRatio} recommended by Evert (2022) in order to combine
        and balance the advantages of effect-size and significance measures.
        A confidence interval (according to the specified \code{conf.level}) for relative risk \eqn{r = \pi_1 / \pi_2}
        is obtained from an exact conditional Poisson test (Fay 2010: 55), adjusted for multiple testing by default.
        If a candidate is not significant (i.e. the confidence interval includes \eqn{H_0: r = 1}) its score is set to 0.
        Otherwise the boundary of the confidence interval closer to 1 is taken as a conservative directional estimate
        of \eqn{r} and its \eqn{\log_2} is returned.
      }
      
      \item{\code{PositiveLRC}}{
        A \bold{one-sided} variant of \bold{LRC}, which returns the lower boundary of a one-sided confidence interval
        for \eqn{\log_2 r}. Scores \eqn{\leq 0} indicate that there is no significant evidence for positive keyness.
        The directional version of LRC is recommended for general use, but PositiveLRC may be preferred if the
        hermeneutic interpretation should also consider non-significant candidates (especially with small data sets).
      }

      \item{\code{SimpleMaths}}{
        The \bold{simple maths} keyness measure (Kilgarriff 2009) used by the commercial corpus analysis
        platform \bold{Sketch Engine}: \deqn{
          \dfrac{10^6 \cdot \frac{f_1}{n_1} + \lambda}{10^6 \cdot \frac{f_2}{n_2} + \lambda} 
          }{ (10^6 * f1 / n1 + lambda) / (10^6 * f2 / n2 + lambda) }
        Its frequency bias can be adjusted with the user parameter \eqn{\lambda > 0}. The scaling
        factor \eqn{10^6} was chosen so that \eqn{\lambda = 1} is a practical default value.
        
        There does not appear to be a convincing mathematical justification behind this measure. It is 
        included here only because of the popularity of the Sketch Engine platform.
      }
    }
  }
}

\seealso{\code{\link{prop.cint}}, which is used by the exact conditional Poisson test of the LRC measure}
  
\examples{
# compute all keyness measures for a single candidate item with f1=7, f2=2 and n1=n2=1000
keyness(7, 1000, 2, 1000, measure="G2") # log-likelihood
keyness(7, 1000, 2, 1000, measure="LogRatio")
keyness(7, 1000, 2, 1000, measure="LogRatio", alpha=0.05) # with significance filter
keyness(7, 1000, 2, 1000, measure="LRC") # the default measure
keyness(7, 1000, 2, 1000, measure="PositiveLRC")
keyness(7, 1000, 2, 1000, measure="SimpleMaths")

# a practical example: keywords of spoken British English (from BNC corpus)
n1 <- sum(BNCcomparison$spoken) # sample sizes
n2 <- sum(BNCcomparison$written)
kw <- transform(BNCcomparison,
  G2 = keyness(spoken, n1, written, n2, measure="G2"),
  LogRatio = keyness(spoken, n1, written, n2, measure="LogRatio"),
  LRC = keyness(spoken, n1, written, n2))
kw <- kw[order(-kw$LogRatio), ]
head(kw, 20)

# collocations of "in charge of" with LRC as an association measure
colloc <- transform(BNCInChargeOf, 
  PosLRC = keyness(f.in, N.in, f.out, N.out, measure="PositiveLRC"))
colloc <- colloc[order(-colloc$PosLRC), ]
head(colloc, 30)
}

\references{

  Evert, S. (2022). Measuring keyness. In \emph{Digital Humanities 2022: Conference Abstracts}, pages 202-205, Tokyo, Japan / online. 
  \url{https://osf.io/cy6mw/}

  Fay, Michael P. (2010). Two-sided exact tests and matching confidence intervals for discrete data. \emph{The R Journal}, \bold{2}(1), 53-58.
  
  Hardie, A. (2014). A single statistical technique for keywords, lockwords, and collocations. Internal CASS working paper no. 1, unpublished.
  
  Kilgarriff, A. (2009). Simple maths for keywords. In \emph{Proceedings of the Corpus Linguistics 2009 Conference}, Liverpool, UK.

  Rayson, P. and Garside, R. (2000). Comparing corpora using frequency profiling. In \emph{Proceedings of the ACL Workshop on Comparing Corpora}, pages 1-6, Hong Kong.  

  Walter, S. D. (1975). The distribution of Levin’s measure of attributable risk. \emph{Biometrika}, \bold{62}(2): 371-374.

}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{htest}