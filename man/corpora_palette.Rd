\name{corpora.palette}
\alias{corpora.palette}
\alias{alpha.col}
\title{
  Colour palettes for linguistic visualization (corpora)
}
\description{

  Several useful colour palettes for plots and other visualizations.
  
  The function \code{alpha.col} can be used to turn colours (partially) translucent for used in crowded scatterplots.
  
}

\usage{
corpora.palette(name=c("seaborn", "muted", "bright", "simple"), 
                n=NULL, alpha=1)

alpha.col(col, alpha)
}

\arguments{

  \item{name}{
    name of the desired colour palette (see Details below)
  }

  \item{n}{
    optional: number of colours to return. The palette will be shortened or recycled as necessary.
  }

  \item{col}{
    a vector of R colour specifications (as accepted by \code{\link{col2rgb}})
  }

  \item{alpha}{
    alpha value between 0 and 1; values below 1 make the colours translucent
  }

}
\value{

  A character vector with colour names or hexadecimal RGB specifications.

}
\details{

  Every colour palette starts with the colours black, red, green and blue in this order.
  
  \code{seaborn}, \code{muted} and \code{bright} are 7-colour palettes inspired by the \href{https://seaborn.pydata.org/}{seaborn} data visualization library, but add a shade of dark grey as first colour.  
  
  \code{simple} is a 10-colour palette based on R's default palette.

}
\seealso{
  \code{\link{rgb}} for R colour specification formats, \code{\link{palette}} for setting the default colour palette
}


\examples{
par.save <- par(mfrow=c(2, 2))
for (name in qw("seaborn muted bright simple")) {
  barplot(rep(1, 10), col=corpora.palette(name, 10), main=name)
}
par(par.save)
}

\author{Stephanie Evert (Rl{https://purl.org/stephanie.evert})}
\keyword{color}
