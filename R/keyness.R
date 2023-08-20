keyness <- function (f1, n1, f2, n2, measure=c("LRC", "PositiveLRC", "G2", "LogRatio", "SimpleMaths"),
                     conf.level=.95, alpha=NULL, p.adjust=TRUE, lambda=1) {
  measure <- match.arg(measure)

  l <- length(f1) # ensure that all vectors have the same length (n1, n2 may be scalars)
  if (length(f2) != l) stop("arguments f1, f2 must be vectors of the same length")
  if (!(length(n1) == 1 || length(n1) == l)) stop("argument n1 must be scalar or have same length as f1, f2")
  if (!(length(n2) == 1 || length(n2) == l)) stop("argument n2 must be scalar or have same length as f1, f2")
  if (!all(f1 + f2 >= 1)) stop("f1 = f2 = 0 is not allowed (f1 + f2 must be >= 1)")
  
  if (length(conf.level) != 1) stop("conf.level must be a scalar") # validate other arguments
  if (any(conf.level <= 0) || any(conf.level > 1)) stop("conf.level must be in range [0,1]")
  
  ## Bonferroni correction factor (1 for p.adjust=FALSE)
  if (isFALSE(p.adjust)) {
    p.adjust <- 1
  }
  else if (isTRUE(p.adjust)) {
    p.adjust <- l
  }
  else {
    if (!(is.numeric(p.adjust) && length(p.adjust) == 1)) stop("p.adjust must either be TRUE/FALSE or a number specifying the family size")
  }
  if (!is.null(alpha)) alpha <- alpha / p.adjust # adjust level of significance filter
  
  ## compute desired keyness measure (implementations follow below)
  res <- switch(
    measure,
    LRC = .LRC(f1, f2, n1, n2, conf.level=conf.level, p.adjust=p.adjust, positive=FALSE),
    PositiveLRC = .LRC(f1, f2, n1, n2, conf.level=conf.level, p.adjust=p.adjust, positive=TRUE),
    G2 = .G2(f1, f2, n1, n2, alpha=alpha),
    LogRatio = .LogRatio(f1, f2, n1, n2),
    SimpleMaths = .SimpleMaths(f1, f2, n1, n2, lambda=lambda),
    stop("internal error -- ", measure, " not implemented yet")
  )
  
  ## apply G2 significance filter where appropriate
  ##  - filter has already been applied for G2 measure
  ##  - LRC has a built-in significance filter, but we allow a different threshold for the G2 filter 
  if (!is.null(alpha) && measure != "G2") {
    G2 <- .G2(f1, f2, n1, n2, alpha=alpha)
    if (measure %in% c("PositiveLRC", "SimpleMaths")) {
      ## positive measures provide ranking for positive keywords and shouldn't become non-zero again for significant negative association
      res[G2 <= 0] <- 0
    }
    else {
      ## two-sided measures distinguish significant positive and negative assocation
      res[G2 == 0] <- 0  
    }
  }

  res  
}



######################################################################
## Internal functions with implementations of different keyness measures
##  - vectors have already been validated and adjusted by the main keyness() function
##  - f1, f2 are vectors of same length; N1, N2 may be scalars (or must have same length as f1, f2)
##  - Bonferroni correction must be made by main keyness() function if desired, passing adjusted alpha / conf.level

## ----- G2 measure (log-likelihood) -----
.G2.term <- function (O, E) {
  res <- O * log(O / E)
  res[O == 0] <- 0
  res
}
.G2 <- function (f1, f2, N1, N2, alpha=NULL) {
  storage.mode(f1) <- "double" # ensure floating-point representation so we don't get integer overflows below
  storage.mode(f2) <- "double"
  storage.mode(N1) <- "double"
  storage.mode(N2) <- "double"
  
  ## observed and expected contingency tables
  N <- N1 + N2
  R1 <- f1 + f2
  O11 <- f1;      E11 <- R1 * N1 / N
  O12 <- f2;      E12 <- R1 * N2 / N
  ## will compute O2j = Nj - O1j and E2j = Nj - E1j below
  
  ## G2 statistic
  G2 <- .G2.term(O11, E11) + .G2.term(O12, E12) 
  G2 <- G2 + .G2.term(N1 - O11, N1 - E11) + .G2.term(N2 - O12, N2 - E12)
  G2 <- 2 * G2
  res <- sign(O11 - E11) * G2 # set sign to distinguish positive vs. negative keywords
  
  ## weed out non-significant items if alpha is specified
  if (!is.null(alpha)) {
    theta <- qchisq(alpha, df=1, lower.tail=FALSE)
    res[G2 < theta] <- 0 # set to 0 if not significant at level alpha
  }
  
  res
}

## ----- LogRatio measure -----
.LogRatio <- function (f1, f2, N1, N2) {
  ## almost unbiased estimate of log2(r) according to Walter (1975)
  log2((f1 + 0.5) / (N1 + 0.5)) - log2((f2 + 0.5) / (N2 + 0.5)) 
}

## ----- SimpleMaths measure ------
.SimpleMaths <- function (f1, f2, N1, N2, lambda=1) {
  p1 <- f1 / N1
  p2 <- f2 / N2
  (1e6 * p1 + lambda) / (1e6 * p2 + lambda)
}

## ----- LRC measure (or PositiveLRC with positive=TRUE) -----
.LRC <- function (f1, f2, N1, N2, conf.level=.95, p.adjust=FALSE, positive=FALSE) {
  if (positive) {
    ## exact confidence interval from conditional Poisson test (one-sided)
    tau <- prop.cint(f1, f1 + f2, conf.level=conf.level, p.adjust=p.adjust, alternative="greater")
    log2( (N2 / N1) * tau$lower / (1 - tau$lower) )
  }
  else {
    ## exact confidence interval from conditional Poisson test (two-sided)
    tau <- prop.cint(f1, f1 + f2, conf.level=conf.level, p.adjust=p.adjust, alternative="two.sided")
    ifelse(f1 / N1 >= f2 / N2, 
           pmax(log2( (N2 / N1) * tau$lower / (1 - tau$lower) ), 0),  # p1 >= p2 -> use lower bound (clamped to >= 0)
           pmin(log2( (N2 / N1) * tau$upper / (1 - tau$upper) ), 0))  # p1 < p2  -> use upper bound (clamped to <= 0)
  }
}
