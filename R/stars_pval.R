stars.pval <- function (x) {
  y <- cut(x, include.lowest=TRUE, right=FALSE,
      breaks=c(-1e-12, .001, .01, .05, .1, Inf),
      labels=c("***", "**", "*", ".", ""))
  as.character(y)
}
