rel.risk.cint <- function(k1, n1, k2, n2, 
                          conf.level=0.95, alternative=c("two.sided", "less", "greater"),
                          method=c("binomial", "z.score"), correct=TRUE) {
  method <- match.arg(method)
  alternative <- match.arg(alternative)
  if (any(k1 < 0) || any(k1 > n1) || any(n1 <= 0)) stop("k1 and n1 must be integers with 0 <= k1 <= n1")
  if (any(k2 < 0) || any(k2 > n2) || any(n2 <= 0)) stop("k2 and n2 must be integers with 0 <= k2 <= n2")
  if (any(k1 + k2 <= 0)) stop("either k1 or k2 must be non-zero")
  if (any(conf.level <= 0) || any(conf.level > 1)) stop("conf.level must be in range [0,1]")

  conf.level <- sqrt(conf.level)        # adjust conf.level to ensure relative risk ratio is in computed range

  ## compute individual confidence intervals for population proportions p1 and p2
  p1 <- prop.cint(k1, n1, method=method, correct=correct, conf.level=conf.level,
                  alternative=switch(alternative, two.sided="two.sided", less="less", greater="greater"))
  p2 <- prop.cint(k2, n2, method=method, correct=correct, conf.level=conf.level,
                  alternative=switch(alternative, two.sided="two.sided", less="greater", greater="less"))
  ## note that one-sided confidence intervals are swapped for p2 (because r <= A/B if p1 <= A and p2 >= B)
  l1 <- nrow(p1)
  l2 <- nrow(p2)
  if (l1 != l2) stop("(k1,n1) and (k2,n2) must have the same length")
  
  ## derive conservative confidence interval for the ratio r = p1/p2
  if (alternative == "two.sided") {
    upper <- ifelse(p2$lower >= 0, p1$upper / p2$lower, Inf)
    lower <- ifelse(p2$upper >= 0, p1$lower / p2$upper, Inf)
  }
  else if (alternative == "less") {
    upper <- ifelse(p2$lower >= 0, p1$upper / p2$lower, Inf)
    lower <- rep(0, l1)
  } else {
    upper <- rep(Inf, l1)
    lower <- ifelse(p2$upper >= 0, p1$lower / p2$upper, Inf)
  }
  
  data.frame(lower=lower, upper=upper)
}
