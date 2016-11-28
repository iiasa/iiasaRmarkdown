#' IIASA Working Papers format
#'
#' Format for creating a IIASA Working Papers. Adapted
#' from \href{http://intranet.iiasa.ac.at/Admin/COM/templates/wp-latex-files.zip}{http://intranet.iiasa.ac.at/Admin/COM/templates/wp-latex-files.zip}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @importFrom rmarkdown pdf_document
#'
#' @examples
#'
#' \dontrun{
#' library(iiasaRmarkdown)
#' 
#' rmarkdown::draft(file = "MyWorkingPaper.Rmd", create_dir = TRUE, 
#'   template = "iiasawp", package = "iiasaRmarkdown")
#' 
#' rmarkdown::render(input = "MyWorkingPaper/MyWorkingPaper.Rmd")
#' 
#' }
#'
#' @export
iiasawp = function(..., keep_tex = TRUE) {
    res = pdf_document(..., keep_tex = keep_tex,
                       template = find_file("iiasawp", file.path("resources", "template.tex")))
    res$inherits = "pdf_document"
    res$knitr$opts_knit$out.format = "sweave"
    res$knitr$opts_chunk$prompt = TRUE
    res$knitr$opts_chunk$comment = NA
    res$knitr$opts_chunk$highlight = FALSE
    res$knitr$opts_chunk$fig.align = "center"
    res
}

find_file = function(template, file) {
  template = system.file("rmarkdown", "templates", template, file, package = "iiasaRmarkdown")
  if (template == "") 
    stop("Template file ", template, "/", file, "not found", call. = FALSE)
  template
}

