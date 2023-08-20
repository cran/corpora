chisq <- function (k1, n1, k2, n2, correct=TRUE, one.sided=FALSE) {
  l <- .match.len(c("k1", "n1", "k2", "n2"), adjust=TRUE) # ensure that all vectors have the same length
  if (any(k1 < 0) || any(k1 > n1) || any(n1 <= 0)) stop("k1 and n1 must be integers with 0 <= k1 <= n1")
  if (any(k2 < 0) || any(k2 > n2) || any(n2 <= 0)) stop("k2 and n2 must be integers with 0 <= k2 <= n2")
  if (any(k1 + k2 <= 0)) stop("either k1 or k2 must be non-zero")

  storage.mode(k1) <- "double" # coerce to floating point so we don't get integer overflow for products below
  storage.mode(n1) <- "double"
  storage.mode(k2) <- "double"
  storage.mode(n2) <- "double"
  
  O11 <- k1                             # construct "observed" contingency table
  O21 <- n1 - k1
  O12 <- k2
  O22 <- n2 - k2

  R1 <- O11 + O12                       # compute row/column sums and sample size
  R2 <- O21 + O22
  C1 <- n1
  C2 <- n2
  N <- n1 + n2

  ## common form for homogeneity test with Yates' correction (Evert 2004, p.82)
  term <- abs(O11 * O22 - O12 * O21)
  if (correct) term <- pmax(term - N/2, 0)
  X2 <- (N * term^2) / (R1 * R2 * C1 * C2)

  # approximate one-sided chi-squared statistic as signed root of X2 (-> standard normal distribution)
  if (one.sided) {                      
    X2 <- sign(k1/n1 - k2/n2) * sqrt(X2)
  }

  X2
}
