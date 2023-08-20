\name{simulated.language.course}
\alias{simulated.language.course}
\alias{LanguageCourse}
\title{Simulated study on effectiveness of language course (corpora)}

\description{

  This function generates simulated results of a study measuring the effectiveness
  of a new corpus-driven foreign language teaching course.
  
  The generated data set is usually named \code{LanguageCourse} (see code examples below)
  and is used for various exercises and illustrations in the SIGIL course.

}

\usage{

simulated.language.course(n=c(15,20,10,10,14,18,15), mean=c(60,50,30,70,55,50,60),
                          effect=c(5,8,12,-4,2,6,-5), sd.subject=15, sd.effect=5,
                          seed.rng=42)

}

\arguments{

  \item{n}{number of participants in each class}
  
  \item{mean}{average score of each class before the course}

  \item{effect}{improvement of each class during the course}

  \item{sd.subject}{inter-subject variability, may be different in each class}

  \item{sd.effect}{inter-subject variability of effect size, may also be different in each class}
  
  \item{seed.rng}{seed for the random number generator, so data sets with the same parameters are reproducible}

}

\value{

  A data frame with \code{sum(n)} rows corresponding to individual subjects participating in the study and the following columns

  \describe{
    \item{\code{id}:}{unique ID code of subject}
    \item{\code{class}:}{name of the teaching class}
    \item{\code{pre}:}{score in standardized language test before the course (\emph{pre-test})}
    \item{\code{post}:}{score in standardized language test after the course (\emph{post-test})}
  }

}

\details{

  TODO

}
  

\examples{

LanguageCourse <- simulated.language.course()
head(LanguageCourse, 20)
summary(LanguageCourse)

}

\author{Stephanie Evert (\url{https://purl.org/stephanie.evert})}
\keyword{datasets}
