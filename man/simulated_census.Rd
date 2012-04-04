\name{simulated.census}
\alias{simulated.census}
\alias{FakeCensus}
\title{Simulated census data for examples and illustrations (corpora)}

\description{

  This function generates a large simulated census data set with body
  measurements (height, weight, shoe size) for male and female inhabitants
  of a highly fictitious country.

  The generated data set is usually named \code{FakeCensus} (see code examples below)
  and is used for various exercises and illustrations in the SIGIL course.

}

\usage{

simulated.census(N=502202, p.male=0.55, seed.rng=42)

}

\arguments{

  \item{N}{population size, i.e. number of inhabitants of the fictitious country}
  
  \item{p.male}{proportion of males in the country}
  
  \item{seed.rng}{seed for the random number generator, so data sets with the same parameters (\code{N}, \code{p.male}, etc.) are reproducible}

}

\value{

  A data set with \code{N} rows corresponding to inhabitants and the following columns:

  \describe{
    \item{\code{height}:}{body height in cm}
    \item{\code{height}:}{body weight in kg}
    \item{\code{shoe.size}:}{shoe size in Paris points (Continental European scale)}
    \item{\code{sex}:}{sex, either \code{m} or \code{f}}
  }

}

\details{

  The default population size corresponds to the estimated populace of Luxembourg
  on 1 January 2010 (according to \url{http://en.wikipedia.org/wiki/Luxembourg}).

  Further parameters of the simulation (standard deviation, correlations, non-linearity)
  will be exposed as function arguments in future releases.

}
  

\examples{

FakeCensus <- simulated.census()
summary(FakeCensus)

\dontshow{
  # some consistency checks
  stopifnot(nrow(FakeCensus) == 502202) 
  stopifnot(! any(is.na(FakeCensus$height) | is.na(FakeCensus$weight) | is.na(FakeCensus$shoe.size)) )
  stopifnot(abs(mean(FakeCensus$height[FakeCensus$sex == "m"]) - 180) < 0.1) 
}

}

\author{Stefan Evert (\url{http://purl.org/stefan.evert})}
\keyword{datasets}