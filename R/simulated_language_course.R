simulated.language.course <- function (n=c(15,20,10,10,14,18,15), mean=c(60,50,30,70,55,50,60), effect=c(5,8,12,-4,2,6,-5), sd.subject=15, sd.effect=5, seed.rng=42) {
  pad.vector <- function (x, n) {
    k <- length(x)
    if (k < n && (n %% k) != 0) stop("number of classes not a multiple of parameters specified")
    rep(x, length.out=n)
  }
  clamp.pts <- function (x) pmax(pmin(round(x), 100), 0)
  runif(1)
  save.seed <- .Random.seed
  set.seed(seed.rng, kind = "default")
  n.classes <- max(length(n), length(mean), length(effect), length(sd.subject), length(sd.effect))
  class.names <- LETTERS[1:n.classes]
  n <- pad.vector(n, n.classes)
  mean <- pad.vector(mean, n.classes)
  effect <- pad.vector(effect, n.classes)
  sd.subject <- pad.vector(sd.subject, n.classes)
  sd.effect <- pad.vector(sd.effect, n.classes)
  pts.before <- rnorm(sum(n), mean=rep(mean, n), sd=rep(sd.subject, n))
  pts.after <- pts.before + rnorm(sum(n), mean=rep(effect, n), sd=rep(sd.effect, n))
  id <- combn(c(LETTERS, "0","1","2","3","4","5","6","7","8","9"), 4)
  id <- paste(id[1,], id[2,], id[3,], id[4,], sep="")
  LanguageCourse <- data.frame(
    id = sample(id, sum(n)),
    class = rep(class.names, n),
    pre = clamp.pts(pts.before),
    post = clamp.pts(pts.after)
  )
  .Random.seed <<- save.seed
  LanguageCourse
}
