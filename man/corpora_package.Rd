\name{corpora-package}
\alias{corpora-package}
\alias{corpora}
\docType{package}
\title{

corpora: Statistical Inference from Corpus Frequency Data

}
\description{

The \code{corpora} package provides a collection of functions for statistical inference
from corpus frequency data, as well as some convenience functions and example data sets.

It is a companion package to the open-source course \emph{Statistical Inference: a Gentle Introduction for Linguists and similar creatures} originally developed by Marco Baroni and Stephanie Evert. Statistical methods implemented in the package are described and illustrated in the units of this course.

Starting with version 0.6 the package also includes best-practice implementations of various corpus-linguistic analysis techniques.

}
\details{
  An overview of some important functions and data sets included in the \code{corpora} package.
  See the package index for a complete listing.

  \subsection{Analysis functions}{
    \itemize{
      \item \code{\link{keyness}()} provides reference implementations for best-practice keyness measures, including the recommended LRC measure (Evert 2022)
      \item \code{\link{binom.pval}()} is a vectorised function that computes p-values of the binomial test more efficiently than \code{\link{binom.test}} (using central p-values in the two-sided case)
      \item \code{\link{fisher.pval}()} is a vectorised function that efficiently computes p-values of Fisher's exact test on \eqn{2\times 2}{2x2} contingency tables for large samples (using central p-values in the two-sided case)
      \item \code{\link{prop.cint}()} is a vectorised function that computes multiple binomial confidence intervals much more efficiently than \code{\link{binom.test}}
      \item \code{\link{z.score}()} and \code{\link{z.score.pval}()} can be used to carry out a z-test for a single proportion (as an approximation to \code{\link{binom.test}})
      \item \code{\link{chisq}()} and \code{\link{chisq.pval}()} are vectorised functions that compute the test statistic and p-value of a chi-squared test for \eqn{2\times 2}{2x2} contingency tables more efficiently than \code{\link{chisq.test}}
    }
  }

  \subsection{Utility functions}{
    \itemize{
      \item \code{\link{cont.table}()} creates \eqn{2\times 2}{2x2} contingency tables for frequency comparison test that can be passed to \code{\link{chisq.test}} and \code{\link{fisher.test}}
      \item \code{\link{sample.df}()} extracts random samples of rows from a data frame
      \item \code{\link{qw}()} splits a string on whitespace or a user-specified regular expression (similar to Perl's \code{qw//} construct) 
      \item \code{\link{corpora.palette}()} provides some nice colour palettes (better than R's default colours)
      \item \code{\link{rowVector}()} and \code{\link{colVector}()} convert a vector into a single-row or single-column matrix
    }
  }

  \subsection{Data sets}{
    \itemize{
      \item Several data sets based on the \href{http://www.natcorp.ox.ac.uk}{British National Corpus}, including complete metadata for all 4048 text files (\code{\link{BNCmeta}}), per-text frequency counts for a number of linguistic corpus queries (\code{\link{BNCqueries}}), and relative frequencies of 65 lexico-grammatical features for each text (\code{\link{BNCbiber}})
      \item Frequency counts of passive constructions in all texts of the Brown and LOB corpora (\code{\link{BrownLOBPassives}}) for frequency comparison with regression models, complemented by distributional features (\code{\link{DistFeatBrownFam}}) as additional predictors
      \item A small text corpus of \emph{Very Short Stories} in the form of a data frame \code{\link{VSS}}, with one row for each token in the corpus.
      \item Small example tables to illustrate frequency comparison of lexical items (\code{\link{BNCcomparison}}) and collocation analysis (\code{\link{BNCInChargeOf}})
      \item \code{\link{KrennPPV}} is a data set of German verb-preposition-noun collocation candidates with manual annotation of true positives and pre-computed association scores
      \item Three functions for generating large synthetic data sets used in the SIGIL course: \code{\link{simulated.census}()}, \code{\link{simulated.language.course}()} and \code{\link{simulated.wikipedia}()}
    }
  }
}


\author{ 

Stephanie Evert (\url{https://purl.org/stephanie.evert})

}

\references{

The official homepage of the \code{corpora} package and the SIGIL course is \url{http://SIGIL.R-Forge.R-Project.org/}.

}

\keyword{ package }

%% \seealso{
%% }

%% \examples{
%% }
