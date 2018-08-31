qw <- function (s, sep="\\s+", names=FALSE) {
  y <- unlist(strsplit(s, split=sep, perl=TRUE))
  if (names) names(y) <- y
  y
}
