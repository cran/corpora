\name{stars.pval}
\alias{stars.pval}
\title{
  Show p-values as significance stars (corpora)
}
\description{

  A simple utility function that converts p-values into the customary significance stars.
  
}

\usage{
stars.pval(x)
}

\arguments{

  \item{x}{
    a numeric vector of non-negative p-values
  }

}
\value{

  A character vector with significance stars corresponding to the p-values.
  
  Significance levels are \code{***} (\eqn{p < .001}), \code{**} (\eqn{p < .01}), \code{*} (\eqn{p < .05}) and \code{.} (\eqn{p < .1}). For non-significant p-values (\eqn{p \ge .1}), an empty string is returned.
  
}

\examples{
stars.pval(c(0, .007, .01, .04, .1))
}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{utilities}
