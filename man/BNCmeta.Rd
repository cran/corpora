\name{BNCmeta}
\docType{data}
\alias{BNCmeta}

\title{

  Metadata for the British National Corpus (XML edition)

}

\description{

  This data set provides complete metadata for all 4048 texts of the
  British National Corpus (XML edition).
  See Aston & Burnard (1998) for more information about the BNC, or go
  to \url{http://www.natcorp.ox.ac.uk/}.
  
  The data have automatically been extracted from the original BNC source
  files.  Some transformations were applied so that all attribute names and 
  their values are given in a human-readable form.  The Perl scripts used
  in the extraction procedure are available from
  \url{http://cwb.sourceforge.net/download.php#import}.

}

\usage{
data(BNCmeta)
}

\format{

  A data set with 4048 rows and the columns listed below.
  Unless specified otherwise, columns are coded as factors.

  \describe{
    \item{\code{id}:}{BNC document ID; character vector}
    \item{\code{title}:}{Title of the document; character vector}
    \item{\code{n_words}:}{Number of words in the document; integer vector}
    \item{\code{n_tokens}:}{Total number of tokens (including punctuation and deleted material); integer vector}
    \item{\code{n_w}:}{Number of w-units (words); integer vector}
    \item{\code{n_c}:}{Number of c-units (punctuation); integer vector}
    \item{\code{n_s}:}{Number of s-units (sentences); integer vector}
    \item{\code{publication_date}:}{Publication date}
    \item{\code{text_type}:}{Text type}
    \item{\code{context}:}{Spoken context}
    \item{\code{respondent_age}:}{Age-group of respondent}
    \item{\code{respondent_class}:}{Social class of respondent (NRS social grades)}
    \item{\code{respondent_sex}:}{Sex of respondent}
    \item{\code{interaction_type}:}{Interaction type}
    \item{\code{region}:}{Region}
    \item{\code{author_age}:}{Author age-group}
    \item{\code{author_domicile}:}{Domicile of author}
    \item{\code{author_sex}:}{Sex of author}
    \item{\code{author_type}:}{Author type}
    \item{\code{audience_age}:}{Audience age}
    \item{\code{domain}:}{Written domain}
    \item{\code{difficulty}:}{Written difficulty}
    \item{\code{medium}:}{Written medium}
    \item{\code{publication_place}:}{Publication place}
    \item{\code{sampling_type}:}{Sampling type}
    \item{\code{circulation}:}{Estimated circulation size}
    \item{\code{audience_sex}:}{Audience sex}
    \item{\code{availability}:}{Availability}
    \item{\code{mode}:}{Text mode (written/spoken)}
    \item{\code{derived_type}:}{Text class}
    \item{\code{genre}:}{David Lee's genre classification}
  }

}

\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.

}

%%\examples{
%%}

\author{Stefan Evert (\url{http://purl.org/stefan.evert})}
\keyword{datasets}