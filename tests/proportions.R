##
## test inference for proportions (p-values and confidence intervals)
##
library(corpora)

n <- 100
k <- 0:n
p0 <- 0.15

## consistency of p-values and confidence intervals
pv.binom <- binom.pval(k, n, p=p0)
confint.binom <- prop.cint(k, n, method="binomial")
ok <- xor(pv.binom < .05, confint.binom$lower <= p0 & p0 <= confint.binom$upper)
if (!all(ok)) stop(sprintf("binom.pval() inconsistent with prop.cint() for k = %s with n = %d and H0: p = %g",
                           paste(k[!ok], collapse=", "), n, p0))

pv.z <- z.score.pval(k, n, p=p0)
confint.z <- prop.cint(k, n, method="z.score")
ok <- xor(pv.z < .05, confint.z$lower <= p0 & p0 <= confint.z$upper)
if (!all(ok)) stop(sprintf("z.score.pval() inconsistent with prop.cint() for k = %s with n = %d and H0: p = %g",
                           paste(k[!ok], collapse=", "), n, p0))

## binom.pval() should match to binom.test() for one-sided tests
## (but not for two-sided tests because it computes central p-values)
pv.binom.test <- sapply(k, function (k) 
  binom.test(k, n, p=p0, alternative="greater")$p.value)
pv.binom.pval <- binom.pval(k, n, p=p0, alternative="greater")

stopifnot(all.equal(pv.binom.pval, pv.binom.test))
