# validate that vector arguments have same length (or are scalars) 
#  - if adjust=TRUE replicate scalars to common length (NB: directly modifies the specified variables in the calling frame)
#  - len= can be explicitly specified, otherwise inferred from arguments
#  - invisible returns len
.match.len <- function (vars, len=NULL, adjust=FALSE, envir=parent.frame()) {
  vecs <- setNames(lapply(vars, get, envir=envir), vars)
  ok <- sapply(vecs, is.numeric)
  if (any(!ok)) stop("argument(s) ", paste(vars[!ok], collapse=", "), " must be numeric vectors")
  if (is.null(len)) len <- max(sapply(vecs, length))
  for (v in vars) {
    if (length(vecs[[v]]) == 1) {
      if (adjust) assign(v, rep(vecs[[v]], len), envir=envir)
    }
    else if (length(vecs[[v]]) != len) {
      stop(sprintf("argument %s should be of length %d or a scalar (%s must have same length)", v, len, paste(vars, collapse=", ")))
    }
  }
  invisible(len)
}
