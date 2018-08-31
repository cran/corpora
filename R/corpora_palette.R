alpha.col <- function (col, alpha) {
  rgb.vals <- col2rgb(col, alpha=FALSE)
  rgb(rgb.vals[1,], rgb.vals[2,], rgb.vals[3,], round(alpha * 255), maxColorValue=255L)
}

corpora.palette <- function (name=c("seaborn", "muted", "bright", "simple"), n=NULL, alpha=1) {
  name <- match.arg(name)
  pal <- switch(name,
                seaborn = c("#666666","#C44E52","#55A868","#4C72B0","#CCB974","#64B5CD","#8172B2"),
                muted = c("#808080", "#D65F5F","#6ACC65","#4878CF","#C4AD66","#77BEDB","#B47CC7"),
                bright = c("#333333", "#E8000B","#03ED3A","#003FFF","#FFC400","#00D7FF","#8A2BE2"),
                simple = c("grey20", "red", "green3", "blue", "grey70", "magenta", "yellow2", "cyan3", "orange", "olivedrab1"))
  if (alpha < 1) pal <- alpha.col(pal, alpha=alpha)
  if (!is.null(n)) rep(pal, length.out=n) else pal
}
## for testing the palettes
# barplot(rep(1, 10), col=corpora.palette("muted", 10, alpha=.5))
