## ----simple-r-code, echo=TRUE, eval=TRUE, results='markup'---------------
x <- seq(1, 10, length.out = 100)
round(x,2)

## ----simple-r-plot, echo=TRUE, eval=TRUE, results='markup', fig.cap='\\proglang{R} plot example. For \\code{LaTex} code in the caption use double backslash \\textbackslash\\textbackslash.',  fig.pos="ht"----
y <- cos(x)
plot(x, y, type = "l", col = "red")
lines(x, -y, col = "blue")

