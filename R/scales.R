#' @title Dracula Theme Scales for `ggplot2`
#'
#' @param ... Parameters passed on to [ggplot2::discrete_scale()] if
#'  `discrete == TRUE`, or to [ggplot2::scale_fill_gradientn()] if `discrete == FALSE`.
#' @param discrete Whether the scale is discrete. Defaults to `FALSE`.
#' @param aesthetics The aesthetics for the plot.
#'
#' @rdname scale_dracula
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_fill_dracula <- function(..., discrete = FALSE, aesthetics = "fill") {
  if (discrete) {
    discrete_scale(aesthetics, palette = dracula_discrete_bright_palette, ...)
  } else {
    scale_fill_gradientn(colors = pull(dracula_tibble, "hex"), aesthetics = aesthetics, ...)
  }
}


#' @rdname scale_dracula
#'
#' @export
scale_color_dracula <- function(..., discrete = FALSE, aesthetics = "color") {
  if (discrete) {
    discrete_scale(aesthetics, palette = dracula_discrete_bright_palette, ...)
  } else {
    scale_color_gradientn(colors =  pull(dracula_tibble, "hex"), aesthetics = aesthetics, ...)
  }
}

#' @rdname scale_dracula
#' @aliases scale_color_dracula
#' @export
scale_colour_dracula <- scale_color_dracula

#' @title Alucard Theme Scales for `ggplot2`
#'
#' @param ... Parameters passed on to [ggplot2::discrete_scale()] if
#'  `discrete == TRUE`, or to [ggplot2::scale_fill_gradientn()] if `discrete == FALSE`.
#' @param discrete Whether the scale is discrete. Defaults to `FALSE`.
#' @param aesthetics The aesthetics for the plot.
#'
#' @rdname scale_alucard
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_fill_alucard <- function(..., discrete = FALSE, aesthetics = "fill") {
  if (discrete) {
    discrete_scale(aesthetics, palette = alucard_discrete_bright_palette, ...)
  } else {
    scale_fill_gradientn(colors = pull(alucard_tibble, "hex"), aesthetics = aesthetics, ...)
  }
}

#' @rdname scale_alucard
#'
#' @export
scale_color_alucard <- function(..., discrete = FALSE, aesthetics = "color") {
  if (discrete) {
    discrete_scale(aesthetics, palette = alucard_discrete_bright_palette, ...)
  } else {
    scale_color_gradientn(colors =  pull(alucard_tibble, "hex"), aesthetics = aesthetics, ...)
  }
}

#' @rdname scale_alucard
#' @aliases scale_color_alucard
#' @export
scale_colour_alucard <- scale_color_alucard
