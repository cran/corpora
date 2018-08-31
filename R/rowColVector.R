rowVector <- function (x, label=NULL) {
  matrix(x, nrow=1, dimnames=list(label, names(x)))
}
colVector <- function (x, label=NULL) {
  matrix(x, ncol=1, dimnames=list(names(x), label))
}
