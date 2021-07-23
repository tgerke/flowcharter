#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
flowchart <- function(chart_specs, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    chart_specs = chart_specs
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'flowchart',
    x,
    width = width,
    height = height,
    package = 'flowcharter',
    elementId = elementId
  )
}

#' Shiny bindings for flowchart
#'
#' Output and render functions for using flowchart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a flowchart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name flowchart-shiny
#'
#' @export
flowchartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'flowchart', width, height, package = 'flowcharter')
}

#' @rdname flowchart-shiny
#' @export
renderFlowchart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, flowchartOutput, env, quoted = TRUE)
}
