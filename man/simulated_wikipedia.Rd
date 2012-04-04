\name{simulated.wikipedia}
\alias{simulated.wikipedia}
\alias{WackypediaStats}
\title{Simulated type and token counts for Wikipedia articles (corpora)}

\description{

  This function generates type and token counts, token-type ratios (TTR) and
  average word length for simulated articles from the English Wikipedia.
  Simulation paramters are based on data from the Wackypedia corpus.

  The generated data set is usually named \code{WackypediaStats} (see code examples below)
  and is used for various exercises and illustrations in the SIGIL course.

}

\usage{

simulated.wikipedia(N=1429649, length=c(100,1000), seed.rng=42)

}

\arguments{

  \item{N}{population size, i.e. total number of Wikipedia articles}
  
  \item{length}{a numeric vector of length 2, specifying the typical range of Wikipedia article lengths}
  
  \item{seed.rng}{seed for the random number generator, so data sets with the same parameters (\code{N} and \code{lenght}) are reproducible}

}

\value{

  A data set with \code{N} rows corresponding to Wikipedia articles and the following columns:

  \describe{
    \item{\code{tokens}:}{number of word tokens in the article}
    \item{\code{types}:}{number of distinct word types in the article}
    \item{\code{ttr}:}{token-type ratio (TTR) for the article}
    \item{\code{avglen}:}{average word length in characters (averaged across tokens)}
  }

}

\details{

  The default population size corresponds to the subset of the Wackypedia corpus from which
  the simulation parameters were obtained.  This excludes all articles with extreme type-token
  statistics (very short, very long, extremely long words, etc.).

  Article lengths are sampled from a lognormal distribution which is scaled so that the
  central 95\% of the values fall into the range specified by the \code{length} argument.

  The simulated data are surprising close to the original Wackypedia statistics.

}

\references{
  
  The Wackypedia corpus can be obtained from \url{http://wacky.sslmit.unibo.it/doku.php?id=corpora}.
  
}


\examples{

WackypediaStats <- simulated.wikipedia()
summary(WackypediaStats)

\dontshow{
  # some consistency checks
  stopifnot(nrow(WackypediaStats) == 1429649) 
}

}

\author{Stefan Evert (\url{http://purl.org/stefan.evert})}
\keyword{datasets}