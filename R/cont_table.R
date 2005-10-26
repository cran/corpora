cont.table <- function (k1, n1, k2, n2) {
  if (max(length(k1), length(n1), length(k2), length(n2)) > 1) stop("this function does not accept vector arguments")
  if (any(k1 < 0) || any(k1 > n1) || any(n1 <= 0)) stop("k1 and n1 must be integers with 0 <= k1 <= n1")
  if (any(k2 < 0) || any(k2 > n2) || any(n2 <= 0)) stop("k2 and n2 must be integers with 0 <= k2 <= n2")
  if (any(k1 + k2 <= 0)) stop("either k1 or k2 must be non-zero")

  matrix(c(k1, n1-k1, k2, n2-k2), nrow=2, byrow=FALSE)
}
