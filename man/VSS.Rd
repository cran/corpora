\name{VSS}
\docType{data}
\alias{VSS}

\title{

  A small corpus of very short stories with linguistic annotations

}

\description{

  This data set contains a small corpus (8043 tokens) of short stories
  from the collection \emph{Very Short Stories} (VSS, see
  \url{http://www.schtepf.de/pages/stories.html}).  The text was
  automatically segmented (tokenised) and annotated with part-of-speech
  tags (from the Penn tagset) and lemmas (base forms), using the IMS
  TreeTagger (Schmid 1994).
  
}

\usage{
data(VSS)
}

\format{

  A data set with 8043 rows corresponding to tokens and the following
  columns:

  \describe{
    \item{\code{word}:}{the word form (or surface form) of the token}
    \item{\code{pos}:}{the part-of-speech tag of the token (using the Penn tagset)}
    \item{\code{word}:}{the lemma (or base form) of the token}
  }

}

\details{

  The Penn tagset defines the following part-of-speech tags:
  
  \tabular{ll}{
    \code{CC}  \tab  Coordinating conjunction                   \cr
    \code{CD}  \tab  Cardinal number				 \cr
    \code{DT}  \tab  Determiner				 \cr
    \code{EX}  \tab  Existential \emph{there}		 \cr
    \code{FW}  \tab  Foreign word				 \cr
    \code{IN}  \tab  Preposition or subordinating conjunction	 \cr
    \code{JJ}  \tab  Adjective					 \cr
    \code{JJR} \tab  Adjective, comparative			 \cr
    \code{JJS} \tab  Adjective, superlative			 \cr
    \code{LS}  \tab  List item marker				 \cr
    \code{MD}  \tab  Modal					 \cr
    \code{NN}  \tab  Noun, singular or mass			 \cr
    \code{NNS} \tab  Noun, plural				 \cr
    \code{NP}  \tab  Proper noun, singular			 \cr
    \code{NPS} \tab  Proper noun, plural			 \cr
    \code{PDT} \tab  Predeterminer				 \cr
    \code{POS} \tab  Possessive ending				 \cr
    \code{PP}  \tab  Personal pronoun				 \cr
    \code{PP$} \tab  Possessive pronoun			 \cr
    \code{RB}  \tab  Adverb					 \cr
    \code{RBR} \tab  Adverb, comparative			 \cr
    \code{RBS} \tab  Adverb, superlative			 \cr
    \code{RP}  \tab  Particle					 \cr
    \code{SYM} \tab  Symbol					 \cr
    \code{TO}  \tab  \emph{to}				 \cr
    \code{UH}  \tab  Interjection				 \cr
    \code{VB}  \tab  Verb, base form				 \cr
    \code{VBD} \tab  Verb, past tense				 \cr
    \code{VBG} \tab  Verb, gerund or present participle	 \cr
    \code{VBN} \tab  Verb, past participle			 \cr
    \code{VBP} \tab  Verb, non-3rd person singular present	 \cr
    \code{VBZ} \tab  Verb, 3rd person singular present		 \cr
    \code{WDT} \tab  Wh-determiner				 \cr
    \code{WP}  \tab  Wh-pronoun				 \cr
    \code{WP$} \tab  Possessive wh-pronoun			 \cr
    \code{WRB} \tab  Wh-adverb                                  
 }
   
}
  
\references{
  
  Schmid, Helmut (1994). Probabilistic part-of-speech tagging using
  decision trees. In: \emph{Proceedings of the International Conference
  on New Methods in Language Processing (NeMLaP)}, pages 44-49.

}

%%\examples{
%%}

\author{Stefan Evert (\url{http://purl.org/stefan.evert})}
\keyword{datasets}