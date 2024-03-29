prop.cint <- function(k, n, method=c("binomial", "z.score"), correct=TRUE, p.adjust=FALSE,
                      conf.level=0.95, alternative=c("two.sided", "less", "greater")) {
  method <- match.arg(method)
  alternative <- match.arg(alternative)

  l <- .match.len(c("k", "n", "conf.level"), adjust=TRUE) # ensure that all vectors have the same length
  if (any(k < 0) || any(k > n) || any(n < 1)) stop("arguments must be integer vectors with 0 <= k <= n and n >= 1")
  if (any(conf.level <= 0) || any(conf.level > 1)) stop("conf.level must be in range [0,1]")

  ## significance level for underlying hypothesis test (with optional Bonferroni correction)
  alpha <- if (alternative == "two.sided") (1 - conf.level) / 2 else (1 - conf.level)
  if (!isFALSE(p.adjust)) {
    if (isTRUE(p.adjust)) p.adjust <- l # implicit family size
    if (!is.numeric(p.adjust)) stop("p.adjust must either be TRUE/FALSE or a number specifying the family size")
    alpha <- alpha / p.adjust # Bonferroni correction
  }
  
  if (method == "binomial") {
    ## Clopper-Pearson method: invert binomial test (using incomplete Beta function)
    lower <- safe.qbeta(alpha, k, n - k + 1)
    upper <- safe.qbeta(alpha, k + 1, n - k, lower.tail=FALSE)
    cint <- switch(alternative,
                   two.sided = data.frame(lower = lower, upper = upper),
                   less      = data.frame(lower = 0,     upper = upper),
                   greater   = data.frame(lower = lower, upper = 1))
  } else {
    ## Wilson score method: invert z-test by solving a quadratic equation
    z <- qnorm(alpha, lower.tail=FALSE) # z-score corresponding to desired confidence level
    yates <- if (correct) 0.5 else 0.0  # whether to apply Yates' correction
    
    k.star <- k - yates                 # lower boundary of confidence interval (solve implicit equation for z-score test)
    k.star <- pmax(0, k.star)           # Yates' correction cannot be satisfied at boundary of valid range for k
    A <- n + z^2                        # coefficients of quadratic equation that has to be solved
    B <- -2 * k.star - z^2
    C <- k.star^2 / n
    lower <- solve.quadratic(A, B, C, nan.lower=0)$lower

    k.star <- k + yates                 # upper boundary of confidence interval
    k.star <- pmin(n, k.star)
    A <- n + z^2
    B <- -2 * k.star - z^2
    C <- k.star^2 / n
    upper <- solve.quadratic(A, B, C, nan.upper=1)$upper

    cint <- switch(alternative,
                   two.sided = data.frame(lower = lower,    upper = upper),
                   less      = data.frame(lower = rep(0,l), upper = upper),
                   greater   = data.frame(lower = lower,    upper = rep(1,l)))
  }

  cint
}

## safely compute qbeta even for shape parameters alpha == 0 or beta == 0
safe.qbeta <- function (p, shape1, shape2, lower.tail=TRUE) {
  stopifnot(length(p) == length(shape1) && length(p) == length(shape2)) # arguments must all have same number of values
  is.0 <- shape1 <= 0
  is.1 <- shape2 <= 0
  ok <- !(is.0 | is.1)
  x <- numeric(length(p))
  x[ok] <- qbeta(p[ok], shape1[ok], shape2[ok], lower.tail=lower.tail) # shape parameters are valid
  x[is.0 & !is.1] <- 0 # density concentrated at x = 0 (for alpha == 0)
  x[is.1 & !is.0] <- 1 # density concentrated at x = 1 (for beta == 0)
  x[is.0 & is.1] <- NA # shouldn't happen in our case (alpha == beta == 0)
  x
}
