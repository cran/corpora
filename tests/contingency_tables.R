##
## test inference for contingency tables (p-values of different tests)
##
library(corpora)

n1 <- 100
n2 <- 200
m <- 500

## generate m random contingency tables
set.seed(42) # reduce risk of running into an unfortunate corner case on CRAN :-)
k1 <- round(runif(m, 0 - .4, n1 + .4))
k2 <- round(runif(m, 0 - .4, n2 + .4))

ok <- (k1 + k2 > 0) & (k1 + k2 < n1 + n2) # skip corner cases where an entire row is 0
k1 <- k1[ok]
k2 <- k2[ok]

ct.list <- cont.table(k1, n1, k2, n2, as.list=TRUE)

## compare chisq() and chisq.pval() with chisq.test()
X2.chisq.test <- suppressWarnings(
  sapply(ct.list, function (ct) chisq.test(ct)$statistic))
X2.chisq <- chisq(k1, n1, k2, n2)
stopifnot(all.equal(X2.chisq, X2.chisq.test, check.attributes=FALSE))

pv.chisq.test <- suppressWarnings(
  sapply(ct.list, function (ct) chisq.test(ct)$p.value))
pv.chisq <- chisq.pval(k1, n1, k2, n2)
stopifnot(all.equal(pv.chisq, pv.chisq.test, check.attributes=FALSE))

## compare fisher.pval() with fisher.test()
## (but not for two-sided tests because fisher.pval() computes central p-values)
pv.fisher.test <- sapply(ct.list, function (ct) fisher.test(ct, alternative="greater")$p.value)
pv.fisher.pval <- fisher.pval(k1, n1, k2, n2, alternative="greater")
stopifnot(all.equal(pv.fisher.pval, pv.fisher.test, check.attributes=FALSE))
