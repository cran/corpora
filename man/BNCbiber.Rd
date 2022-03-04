\name{BNCbiber}
\docType{data}
\alias{BNCbiber}

\title{

  Biber's (1988) register features for the British National Corpus

}

\description{

  This data set contains a table of the relative frequencies (per 1000 words)
  of 65 linguistic features (Biber 1988, 1995) for each text document in the
  British National Corpus (Aston & Burnard 1998).
  
  Biber (1988) introduced these features for the purpose of a multidimensional
  register analysis. Variables in the data set are numbered according to Biber's
  list (see e.g. Biber 1995, 95f).
  
  Feature frequencies were automatically extracted from the British National Corpus
  using query patterns based on part-of-speech tags (Gasthaus 2007).  Note that
  features 60 and 65 had to be omitted because they cannot be identified
  with sufficient accuracy by the automatic methods.  For further information on
  the extraction methodology, see Gasthaus (2007, 20-21).  The original data set
  and the Python scripts used for feature extraction are available from
  \url{https://portal.ikw.uni-osnabrueck.de/~CL/download/BSc_Gasthaus2007/}; the
  version included here contains some bug fixes.

}

\usage{

BNCbiber

}

\format{

  A numeric matrix with 4048 rows and 65 columns, specifying the relative frequencies
  (per 1000 words) of 65 linguistic features.  Documents are listed in the same order
  as the metadata in \code{\link{BNCmeta}} and rows are labelled with text IDs, so it
  is straightforward to combine the two data sets.
  
  \tabular{ll}{
     \tab \bold{A. Tense and aspect markers} \cr
     \code{f_01_past_tense} \tab Past tense \cr
     \code{f_02_perfect_aspect} \tab Perfect aspect \cr
     \code{f_03_present_tense} \tab Present tense \cr
     \tab \bold{B. Place and time adverbials} \cr
     \code{f_04_place_adverbials} \tab Place adverbials (e.g., \emph{above, beside, outdoors}) \cr
     \code{f_05_time_adverbials} \tab Time adverbials (e.g., \emph{early, instantly, soon}) \cr
     \tab \bold{C. Pronouns and pro-verbs} \cr
     \code{f_06_first_person_pronouns} \tab First-person pronouns \cr
     \code{f_07_second_person_pronouns} \tab Second-person pronouns \cr
     \code{f_08_third_person_pronouns} \tab Third-person personal pronouns (excluding \emph{it}) \cr
     \code{f_09_pronoun_it} \tab Pronoun \emph{it} \cr
     \code{f_10_demonstrative_pronoun} \tab Demonstrative pronouns (\emph{that, this, these, those} as pronouns) \cr
     \code{f_11_indefinite_pronoun} \tab Indefinite pronounes (e.g., \emph{anybody, nothing, someone}) \cr
     \code{f_12_proverb_do} \tab Pro-verb \emph{do} \cr
     \tab \bold{D. Questions} \cr
     \code{f_13_wh_question} \tab Direct \emph{wh}-questions \cr
     \tab \bold{E. Nominal forms} \cr
     \code{f_14_nominalization} \tab Nominalizations (ending in \emph{-tion, -ment, -ness, -ity}) \cr
     \code{f_15_gerunds} \tab Gerunds (participial forms functioning as nouns) \cr
     \code{f_16_other_nouns} \tab Total other nouns \cr
     \tab \bold{F. Passives} \cr
     \code{f_17_agentless_passives} \tab Agentless passives \cr
     \code{f_18_by_passives} \tab \emph{by}-passives \cr
     \tab \bold{G. Stative forms} \cr
     \code{f_19_be_main_verb} \tab \emph{be} as main verb \cr
     \code{f_20_existential_there} \tab Existential \emph{there} \cr
     \tab \bold{H. Subordination features} \cr
     \code{f_21_that_verb_comp} \tab \emph{that} verb complements (e.g., \emph{I said that he went.}) \cr
     \code{f_22_that_adj_comp} \tab \emph{that} adjective complements (e.g., \emph{I'm glad that you like it.}) \cr
     \code{f_23_wh_clause} \tab \emph{wh}-clauses (e.g., \emph{I believed what he told me.}) \cr
     \code{f_24_infinitives} \tab Infinitives \cr
     \code{f_25_present_participle} \tab Present participial adverbial clauses (e.g., \emph{Stuffing his mouth with cookies, Joe ran out the door.}) \cr
     \code{f_26_past_participle} \tab Past participial adverbial clauses (e.g., \emph{Built in a single week, the house would stand for fifty years.}) \cr
     \code{f_27_past_participle_whiz} \tab Past participial postnominal (reduced relative) clauses (e.g., \emph{the solution produced by this process}) \cr
     \code{f_28_present_participle_whiz} \tab Present participial postnominal (reduced relative) clauses (e.g., \emph{the event causing this decline}) \cr
     \code{f_29_that_subj} \tab \emph{that} relative clauses on subject position (e.g., \emph{the dog that bit me}) \cr
     \code{f_30_that_obj} \tab \emph{that} relative clauses on object position (e.g., \emph{the dog that I saw}) \cr
     \code{f_31_wh_subj} \tab \emph{wh} relatives on subject position (e.g., \emph{the man who likes popcorn}) \cr
     \code{f_32_wh_obj} \tab \emph{wh} relatives on object position (e.g., \emph{the man who Sally likes}) \cr
     \code{f_33_pied_piping} \tab Pied-piping relative clauses (e.g., \emph{the manner in which he was told}) \cr
     \code{f_34_sentence_relatives} \tab Sentence relatives (e.g., \emph{Bob likes fried mangoes, which is the most disgusting thing I've ever heard of.}) \cr
     \code{f_35_because} \tab Causative adverbial subordinator (\emph{because}) \cr
     \code{f_36_though} \tab Concessive adverbial subordinators (\emph{although, though}) \cr
     \code{f_37_if} \tab Conditional adverbial subordinators (\emph{if, unless}) \cr
     \code{f_38_other_adv_sub} \tab Other adverbial subordinators (e.g., \emph{since, while, whereas}) \cr
     \tab \bold{I. Prepositional phrases, adjectives and adverbs} \cr
     \code{f_39_prepositions} \tab Total prepositional phrases \cr
     \code{f_40_adj_attr} \tab Attributive adjectives (e.g., \emph{the big horse}) \cr
     \code{f_41_adj_pred} \tab Predicative adjectives (e.g., \emph{The horse is big.}) \cr
     \code{f_42_adverbs} \tab Total adverbs \cr
     \tab \bold{J. Lexical specificity} \cr
     \code{f_43_type_token} \tab Type-token ratio (including punctuation)\cr
     \code{f_44_mean_word_length} \tab Average word length (across tokens, excluding punctuation) \cr
     \tab \bold{K. Lexical classes} \cr
     \code{f_45_conjuncts} \tab Conjuncts (e.g., \emph{consequently, furthermore, however}) \cr
     \code{f_46_downtoners} \tab Downtoners (e.g., \emph{barely, nearly, slightly}) \cr
     \code{f_47_hedges} \tab Hedges (e.g., \emph{at about, something like, almost}) \cr
     \code{f_48_amplifiers} \tab Amplifiers (e.g., \emph{absolutely, extremely, perfectly}) \cr
     \code{f_49_emphatics} \tab Emphatics (e.g., \emph{a lot, for sure, really}) \cr
     \code{f_50_discourse_particles} \tab Discourse particles (e.g., sentence-initial \emph{well, now, anyway}) \cr
     \code{f_51_demonstratives} \tab Demonstratives \cr
     \tab \bold{L. Modals} \cr
     \code{f_52_modal_possibility} \tab Possibility modals (\emph{can, may, might, could}) \cr
     \code{f_53_modal_necessity} \tab Necessity modals (\emph{ought, should, must}) \cr
     \code{f_54_modal_predictive} \tab Predictive modals (\emph{will, would, shall}) \cr
     \tab \bold{M. Specialized verb classes} \cr
     \code{f_55_verb_public} \tab Public verbs (e.g., \emph{assert, declare, mention}) \cr
     \code{f_56_verb_private} \tab Private verbs (e.g., \emph{assume, believe, doubt, know}) \cr
     \code{f_57_verb_suasive} \tab Suasive verbs (e.g., \emph{command, insist, propose}) \cr
     \code{f_58_verb_seem} \tab \emph{seem} and \emph{appear} \cr
     \tab \bold{N. Reduced forms and dispreferred structures} \cr
     \code{f_59_contractions} \tab Contractions \cr               
     \emph{n/a} \tab Subordinator \emph{that} deletion (e.g., \emph{I think [that] he went.}) \cr
     \code{f_61_stranded_preposition} \tab Stranded prepositions (e.g., \emph{the candidate that I was thinking of}) \cr
     \code{f_62_split_infinitve} \tab Split infinitives (e.g., \emph{He wants to convincingly prove that \ldots}) \cr
     \code{f_63_split_auxiliary} \tab Split auxiliaries (e.g., \emph{They were apparently shown to \ldots}) \cr
     \tab \bold{O. Co-ordination} \cr
     \code{f_64_phrasal_coordination} \tab Phrasal co-ordination (N \emph{and} N; Adj \emph{and} Adj; V \emph{and} V; Adv \emph{and} Adv) \cr
     \emph{n/a} \tab Independent clause co-ordination (clause-initial \emph{and}) \cr
     \tab \bold{P. Negation} \cr
     \code{f_66_neg_synthetic} \tab Synthetic negation (e.g., \emph{No answer is good enough for Jones.}) \cr
     \code{f_67_neg_analytic} \tab Analytic negation (e.g., \emph{That's not likely.})     
  }
}

\references{
  
  Aston, Guy and Burnard, Lou (1998). \emph{The BNC Handbook.} Edinburgh
  University Press, Edinburgh. See also the BNC homepage at
  \url{http://www.natcorp.ox.ac.uk/}.
  
  Biber, Douglas (1988). \emph{Variations Across Speech and Writing.}
  Cambridge University Press, Cambridge.

  Biber, Douglas (1995). \emph{Dimensions of Register Variation: A cross-linguistic comparison.}
  Cambridge University Press, Cambridge.

  Gasthaus, Jan (2007). \emph{Prototype-Based Relevance Learning for Genre Classification.}
  B.Sc.\ thesis, Institute of Cognitive Science, University of \enc{Osnabrück}{Osnabrueck}.
  Data sets and software available from \url{https://portal.ikw.uni-osnabrueck.de/~CL/download/BSc_Gasthaus2007/}.

}

\seealso{\code{\link{BNCmeta}}}

%%\examples{
%%}
\author{Stephanie Evert (\url{https://purl.org/stephanie.evert}); feature extractor by Jan Gasthaus (2007).}
\keyword{datasets}
