set.seed(52908)

knitr::knit_hooks$set(
  click.img = function(before, options, envir) {
    if (before) {
      "<div class='click-img'>"
    } else {
      "</div>"
    }
  }
)

knitr::opts_chunk$set(
  cache = FALSE,
  out.width = "80%",
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,
  dpi = 120,
  message = FALSE,
  warning = FALSE
)

options(
  htmltools.dir.version = FALSE,
  digits = 4,
  width = 55,
  warnPartialMatchAttr = FALSE,
  warnPartialMatchDollar = FALSE
)
